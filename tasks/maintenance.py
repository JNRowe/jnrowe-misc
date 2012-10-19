import datetime

from glob import glob
from re import match
from subprocess import (Popen, PIPE)

from utils import (cmd_output, fail, open_issue, success, warn)


def keyword_check(args):
    """Check for missing keywords."""
    for file in glob('metadata/md5-cache/*/*'):
        # Skip live packages, they shouldn't have stable keywords anyway
        if file.endswith('-9999'):
            continue
        meta = dict([line.strip().split('=', 1) for line in open(file)])
        pkg = file.split('/', 2)[2]
        if 'amd64' not in meta['KEYWORDS']:
            print(fail('[~]amd64 keyword missing in %r' % pkg))
        if 'x86' not in meta['KEYWORDS']:
            print(fail('[~]x86 keyword missing in %r' % pkg))
    print(success('All packages checked for keywords'))


def eclass_doc_check(args):
    """Check eclass documentation syntax."""
    portdir = cmd_output('portageq envvar PORTDIR')
    awk_file = portdir + '/' + \
        'app-portage/eclass-manpages/files/eclass-to-manpage.awk'
    eclasses = glob('eclass/*.eclass')
    for eclass in eclasses:
        proc = Popen(['gawk', '-f', awk_file], stdin=PIPE, stdout=PIPE,
                     stderr=PIPE)
        _, err = proc.communicate(open(eclass).read())
        if err:
            print(warn('>>> %s' % eclass))
            print(err)


def task_doc_check(args):
    """Check tasks are documented."""
    # This should be far easier to write, if only we could rely on the Sphinx
    # cache or mock the Sphinx extensions simply and use the docutils parser
    lines = open('doc/maintenance.rst').readlines()
    commands = []
    for n, line in enumerate(lines):
        if match("^'+\n$", line):
            commands.append(lines[n - 1][2:-3])

    for name in sorted(args.subs):
        if not name in commands:
            print(warn('%s task undocumented' % name))


def gen_stable(args):
    """Generate a base stabilisation string for a package."""
    date = datetime.date.today() + datetime.timedelta(days=args.days)
    for arch in args.arches:
        reminder = 'REM %s *1 MSG %%"Stabilise %s %s%%" %%a' % (date, arch,
                                                                args.cpv)
        print(reminder)
        if args.selection:
            proc = Popen(['xsel'], stdin=PIPE)
            proc.communicate(reminder)


def open_bug(args):
    """Open a new bump bug."""
    data = {'title': args.title, 'body': args.body, 'labels': args.labels}
    open_issue(data)


def bump_pkg(args):
    """Open a version bump bug."""
    data = {
        'title': '%s version bump.' % args.cpv,
        'body': '',
        'labels': ['feature', ]
    }
    open_issue(data)
