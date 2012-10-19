#! /usr/bin/python -tt
#
"""Makefile - Overlay maintenance helpers"""
# Copyright (C) 2009-2012  James Rowe <jnrowe@gmail.com>
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

import argparse
import glob
import os
import sys

from tasks import (cupage_support, layman_support, maintenance, portage_tasks,
                   remind_support, rst_support, utils)


def process_command_line():
    """Process the command line arguments."""
    description = __doc__.splitlines()[0].split("-", 1)[1]
    epilog = "Please report bugs at https://github.com/JNRowe/jnrowe-misc/"
    try:
        version = utils.cmd_output('git describe --always')
    except OSError:
        version = 'unknown'

    parser = argparse.ArgumentParser(description=description, epilog=epilog,
                                     version='%%(prog)s (%s)' % version)
    subs = parser.add_subparsers()

    commands = [
        check,
        clean,
        distclean,

        cupage_support.gen_cupage_conf,
        cupage_support.cupage_check,

        layman_support.layman_check,

        maintenance.keyword_check,
        maintenance.eclass_doc_check,
        maintenance.task_doc_check,

        portage_tasks.gen_use_local_desc,
        portage_tasks.gen_categories,
        portage_tasks.gen_manifests,
        portage_tasks.gen_news_sigs,

        remind_support.gen_removals,
        remind_support.reminders,

        rst_support.rst_check,
        rst_support.gen_html,
        rst_support.gen_thanks,
        rst_support.gen_sphinx_html,
    ]
    for func in commands:
        temp_parser = subs.add_parser(func.__name__.replace('_', '-'),
                                      help=(func.__doc__[0].lower()
                                            + func.__doc__[1:-1]))
        temp_parser.set_defaults(func=func)

    all_p = subs.add_parser('all', help='update generated files')
    all_p.set_defaults(func=make_all)

    gen_stable_p = subs.add_parser('gen-stable',
                                   help=('generate a base stabilisation '
                                         'string for a package'))
    gen_stable_p.add_argument('--arches', action='append',
                              default=['amd64', 'x86'],
                              help='architectures to generate reminder for')
    gen_stable_p.add_argument('-s', '--selection', action='store_true',
                              help='copy reminder to primary selection')
    gen_stable_p.add_argument('cpv', help='fully qualified package identifier')
    gen_stable_p.add_argument('days', nargs='?', default=30,
                              help='number of days to wait')
    gen_stable_p.set_defaults(func=maintenance.gen_stable)

    open_bug_p = subs.add_parser('open-bug', help='open a new bump bug')
    open_bug_p.add_argument('title', help='title for bug')
    open_bug_p.add_argument('body', nargs='?', default='', help='body for bug')
    open_bug_p.add_argument('labels', nargs='*', help='initial label for bug')
    open_bug_p.set_defaults(func=maintenance.open_bug)

    bump_pkg_p = subs.add_parser('bump-pkg', help='open a version bump bug')
    bump_pkg_p.add_argument('cpv', help='fully qualified package identifier')
    bump_pkg_p.set_defaults(func=maintenance.bump_pkg)

    args = parser.parse_args()
    args.subs = parser._subparsers._group_actions[0].choices
    return args


def make_all():
    """Update generated files."""
    for name in sorted(globals()):
        if name.startswith('gen_') and not name == 'gen_stable':
            globals()[name]()


def check():
    """Run tests."""
    for name in sorted(globals()):
        if name.endswith('_check'):
            globals()[name]()


def clean():
    """Clean repo."""
    for file in glob('*.rst'):
        html_file = os.path.splitext(file)[0] + '.html'
        try:
            os.unlink(html_file)
        except OSError:
            pass
        else:
            print(utils.warn('%s removed' % html_file))
    try:
        os.unlink('profiles/categories')
    except OSError:
        pass
    else:
        print(utils.warn('profiles/categories removed'))


def distclean():
    """Clean repo, deeply."""
    clean()
    for file in glob('*-*/*/Manifest'):
        os.unlink(file)


def main():
    """Main script."""
    args = process_command_line()
    try:
        args.func(args)
    except utils.CommandError as e:
        print(utils.error(e.args[0]))
        return 1

if __name__ == '__main__':
    sys.exit(main())
