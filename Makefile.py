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

import os
import sys

from glob import glob

import aaargh


APP = aaargh.App(description=__doc__.splitlines()[0].split("-", 1)[1],
                 epilog=("Please report bugs at "
                         "https://github.com/JNRowe/jnrowe-misc/issues/"))

from tasks import *  # NOQA

try:
    VERSION = cmd_output('git describe --always')
except OSError:
    VERSION = 'unknown'
APP.arg('--version', action='version', version='%%(prog)s (%s)' % VERSION)


@APP.cmd(name='all')
def make_all():
    """update generated files"""
    for name in sorted(globals()):
        if name.startswith('gen_') and not name == 'gen_stable':
            globals()[name]()


@APP.cmd
def check():
    """run tests"""
    for name in sorted(globals()):
        if name.endswith('_check'):
            globals()[name]()


@APP.cmd
def clean():
    """clean repo"""
    for file in glob('*.rst'):
        html_file = os.path.splitext(file)[0] + '.html'
        try:
            os.unlink(html_file)
        except OSError:
            pass
        else:
            print(warn('%s removed' % html_file))
    try:
        os.unlink('profiles/categories')
    except OSError:
        pass
    else:
        print(warn('profiles/categories removed'))


@APP.cmd
def distclean():
    """clean repo, deeply"""
    clean()
    for file in glob('*-*/*/Manifest'):
        os.unlink(file)


def main():
    """main script"""
    try:
        APP.run()
    except CommandError as e:
        APP._parser.exit(message=e.args[0] + '\n')


if __name__ == '__main__':
    sys.exit(main())
