import datetime

from glob import glob
from operator import attrgetter
from re import match
from subprocess import (Popen, PIPE)

import argh

from utils import (command, cmd_output, create_gh_client, fail,
                   fetch_project_name, success, warn)


@command
def keyword_check(args):
    """Check for missing keywords"""
    for file in glob('metadata/md5-cache/*/*'):
        # Skip live packages, they shouldn't have stable keywords anyway
        if file.endswith('-9999'):
            continue
        meta = dict([line.strip().split('=', 1) for line in open(file)])
        pkg = file.split('/', 2)[2]
        if 'amd64' not in meta['KEYWORDS']:
            yield fail('[~]amd64 keyword missing in %r' % pkg)
        if 'x86' not in meta['KEYWORDS']:
            yield fail('[~]x86 keyword missing in %r' % pkg)
    yield success('All packages checked for keywords')


@command
def eclass_doc_check(args):
    """Check eclass documentation syntax"""
    portdir = cmd_output('portageq envvar PORTDIR')
    awk_file = portdir + '/' + \
        'app-portage/eclass-manpages/files/eclass-to-manpage.awk'
    eclasses = glob('eclass/*.eclass')
    for eclass in eclasses:
        proc = Popen(['gawk', '-f', awk_file], stdin=PIPE, stdout=PIPE,
                     stderr=PIPE)
        out, err = proc.communicate(open(eclass).read())
        if err:
            yield warn('>>> %s' % eclass)
            print err


@command
def task_doc_check(args):
    """Check tasks are documented"""
    # This should be far easier to write, if only we could rely on the Sphinx
    # cache or mock the Sphinx extensions simply and use the docutils parser
    lines = open('doc/maintenance.rst').readlines()
    commands = []
    for n, line in enumerate(lines):
        if match("^'+\n$", line):
            commands.append(lines[n - 1][2:-3])

    for command in sorted(args.commands, key=attrgetter('__name__')):
        if hasattr(command, 'argh_alias'):
            name = command.argh_alias.replace('_', '-')
        else:
            name = command.__name__.replace('_', '-')
        if not name in commands:
            print warn('%s undocumented' % name)


@command
@argh.arg('cpv', help='fully qualified package identifier')
@argh.arg('days', nargs='?', default=30, help='number of days to wait')
def gen_stable(args):
    """Generate a base stabilisation string for a package"""
    date = datetime.date.today() + datetime.timedelta(days=args.days)
    for arch in ('amd64', 'x86'):
        yield 'REM %s *1 MSG %%"Stabilise %s %s%%" %%a' % (date, arch,
                                                           args.cpv)


@command
@argh.arg('title', help='title for bug')
@argh.arg('body', nargs='?', default='', help='body for bug')
@argh.arg('labels', nargs='*', help='initial label for bug')
def open_bug(args):
    """Open a new bump bug"""
    github = create_gh_client()
    project = fetch_project_name()
    data = {'title': args.title, 'body': args.body, 'labels': args.labels}
    new_issue = github.post('https://api.github.com/repos/%s/issues' % project,
                            data)
    yield success("Issue #%d opened!" % new_issue.content['number'])


@command
@argh.arg('cpv', help='fully qualified package identifier')
def bump_pkg(args):
    """Open a version bump bug"""
    github = create_gh_client()
    project = fetch_project_name()
    data = {
        'title': '%s version bump.' % args.cpv,
        'body': '',
        'labels': ['feature', ]
    }
    new_issue = github.post('https://api.github.com/repos/%s/issues' % project,
                            data)
    yield success("Issue #%d opened!" % new_issue.content['number'])
