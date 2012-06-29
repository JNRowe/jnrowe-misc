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

import argh

from tasks import *  # NOQA


try:
    VERSION = cmd_output('git describe --always')
except OSError:
    VERSION = 'unknown'


@command
@argh.alias('all')
def make_all(args):
    """update generated files"""
    for name in globals():
        if name.startswith('gen_') and not name == 'gen_stable':
            globals()['name'](args)


@command
def check(args):
    """run tests"""
    for name in globals():
        if name.endswith('_check'):
            yield globals()['name'](None)


@command
def clean(args):
    """clean repo"""
    for file in glob('*.rst'):
        html_file = os.path.splitext(file)[0] + '.html'
        try:
            os.unlink(html_file)
        except OSError:
            pass
        else:
            yield warn('%s removed' % html_file)
    try:
        os.unlink('profiles/categories')
    except OSError:
        pass
    else:
        yield warn('profiles/categories removed')


@command
def distclean(args):
    """clean repo, deeply"""
    clean()
    for file in glob('*-*/*/Manifest'):
        os.unlink(file)


def main():
    """main script"""
    description = __doc__.splitlines()[0].split("-", 1)[1]
    epi = "Please report bugs at https://github.com/JNRowe/jnrowe-misc/issues/"
    parser = argh.ArghParser(description=description, epilog=epi,
                             version="%%(prog)s (%s)" % VERSION)
    parser.add_commands(COMMANDS)
    parser.dispatch(pre_call=lambda args: setattr(args, 'commands', COMMANDS))


if __name__ == '__main__':
    sys.exit(main())
