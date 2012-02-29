import datetime

from glob import glob
import argh

from utils import (command, create_gh_client, fail, fetch_project_name,
                   success)


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
    github = create_gh_client()
    project = fetch_project_name()
    new_issue = github.issues.open(project, args.title, args.body)
    if args.label:
        github.issues.add_label(project, new_issue.number, args.label)
    yield success("Issue #%d opened!" % new_issue.number)


@command
@argh.arg('cpv', help='Fully qualified package identifier')
def bump_pkg(args):
    """Open a version bump bug"""
    github = create_gh_client()
    project = fetch_project_name()
    new_issue = github.issues.open(project, '%s version bump.' % args.cpv, '')
    github.issues.add_label(project, new_issue.number, 'feature')
    yield success("Issue #%d opened!" % new_issue.number)
