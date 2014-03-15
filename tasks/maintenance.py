#
# -*- coding: utf-8 -*-
"""maintenance - Maintenance support tasks"""
# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

import datetime

from glob import glob
from re import match
from subprocess import (Popen, PIPE)

try:
    from configparser import ConfigParser
except ImportError:
    from ConfigParser import ConfigParser

from tasks.utils import (APP, cmd_output, fail, open_issue, success, warn)


@APP.cmd(name='keyword-check', help='check for missing keywords')
def keyword_check():
    """Check for missing keywords"""
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


@APP.cmd(name='eclass-doc-check', help='check eclass documentation syntax')
def eclass_doc_check():
    """Check eclass documentation syntax"""
    p = Popen(['portageq', 'repos_config', '/'], stdout=PIPE)
    p.wait()
    conf = ConfigParser()
    conf.readfp(p.stdout)
    portdir = conf.get(conf.defaults()['main-repo'], 'location')
    awk_file = portdir + '/' + \
        'app-portage/eclass-manpages/files/eclass-to-manpage.awk'
    eclasses = glob('eclass/*.eclass')
    for eclass in eclasses:
        proc = Popen(['gawk', '-f', awk_file], stdin=PIPE, stdout=PIPE,
                     stderr=PIPE)
        _, err = proc.communicate(open(eclass, 'rb').read())
        if err:
            print(warn('>>> %s' % eclass))
            print(err)


@APP.cmd(name='task-doc-check', help='check tasks are documented')
def task_doc_check():
    """Check tasks are documented"""
    # This should be far easier to write, if only we could rely on the Sphinx
    # cache or mock the Sphinx extensions simply and use the docutils parser
    lines = open('doc/maintenance.rst').readlines()
    commands = []
    for n, line in enumerate(lines):
        if match("^'+\n$", line):
            commands.append(lines[n - 1][2:-3])

    for name in sorted(APP._subparsers.choices):
        if not name in commands:
            print(warn('%s task undocumented' % name))


@APP.cmd(name='gen-stable',
         help='generate a base stabilisation string for a package')
@APP.cmd_arg('--arches', default=['amd64', 'x86'],
             help='architectures to generate reminder for')
@APP.cmd_arg('-s', '--selection', default=False,
             help='copy reminder to primary selection')
@APP.cmd_arg('cpv', help='fully qualified package identifier')
@APP.cmd_arg('days', nargs='?', default=30, help='number of days to wait')
def gen_stable(arches, selection, cpv, days):
    """Generate a base stabilisation string for a package"""
    date = datetime.date.today() + datetime.timedelta(days=days)
    for arch in arches:
        reminder = 'REM %s *1 MSG %%"Stabilise %s %s%%" %%a' % (date, arch,
                                                                cpv)
        print(reminder)
        if selection:
            proc = Popen(['xsel'], stdin=PIPE)
            proc.communicate(reminder)


@APP.cmd(name='open-bug', help='open a new bump bug')
@APP.cmd_arg('title', help='title for bug')
@APP.cmd_arg('body', nargs='?', default='', help='body for bug')
@APP.cmd_arg('labels', nargs='*', help='initial label for bug')
def open_bug(title, body, labels):
    """Open a new bump bug"""
    data = {'title': title, 'body': body, 'labels': labels}
    open_issue(data)


@APP.cmd(name='bump-pkg', help='open a version bump bug')
@APP.cmd_arg('cpv', help='fully qualified package identifier')
def bump_pkg(cpv):
    """Open a version bump bug"""
    data = {
        'title': '%s version bump.' % cpv,
        'body': '',
        'labels': ['feature', ]
    }
    open_issue(data)
