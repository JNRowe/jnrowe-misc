import datetime

from glob import glob
from re import search
from sys import exit
import argh

try:
    from github2.client import Github
except ImportError:
    Github = None  # NOQA

from utils import (cmd_output, command, fail, success)


@command
def keyword_check(args):
    """Check for missing keywords"""
    for file in glob('metadata/cache/*/*'):
        # Skip live packages, they shouldn't be keyworded anyway
        if file.endswith('-9999'):
            continue
        keywords = open(file).readlines()[8]
        pkg = file.split('/', 2)[2]
        if 'amd64' not in keywords:
            yield fail('[~]amd64 keyword missing in %r' % pkg)
        if 'x86' not in keywords:
            yield fail('[~]x86 keyword missing in %r' % pkg)
    yield success('All packages checked for keywords')


@command
@argh.arg('cpv', help='Fully qualified package identifier')
def gen_stable(args):
    """Generate a base stabilisation string for a package"""
    date = datetime.date.today() + datetime.timedelta(days=30)
    for arch in ('amd64', 'x86'):
        yield 'REM %s *1 MSG %%"Stabilise %s %s%%" %%a' % (date, arch,
                                                           args.cpv)


@command
@argh.arg('title', help='Title for bug')
@argh.arg('body', nargs='?', default='', help='Body for bug')
@argh.arg('label', nargs='?', help='Initial label for bug')
def open_bug(args):
    """Open a new bump bug"""
    if not Github:
        raise argh.CommandError(fail("Opening bugs requires the github2 "
                                     "Python package"))
    user = cmd_output('git config github.user')
    token = cmd_output('git config github.token')
    project_url = cmd_output('git config remote.origin.url')
    project = search('github.com[:/]([^/]+/.*).git', project_url).groups()[0]
    github = Github(username=user, api_token=token)
    new_issue = github.issues.open(project, args.title, args.body)
    if args.label:
        github.issues.add_label(project, new_issue.number, args.label)
    yield success("Issue #%d opened!" % new_issue.number)


@command
@argh.arg('cpv', help='Fully qualified package identifier')
def bump_pkg(args):
    """Open a version bump bug"""
    open_bug('%s version bump.' % args.cpv, '', 'feature')
