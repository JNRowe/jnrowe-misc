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
    """Update generated files"""
    for task in [v for k, v in globals().items()
                if k.startswith('gen_') and not k == 'gen_stable']:
        task()


@command
def check(args):
    """Run tests"""
    for task in [v for k, v in globals().items() if k.endswith('_check')]:
        yield task(None)


@command
def clean(args):
    """Clean repo"""
    for file in glob('*.rst'):
        html_file = os.path.splitext(file)[0] + '.html'
        try:
            os.unlink(html_file)
            yield warn('%s removed' % html_file)
        except OSError:
            pass
    try:
        os.unlink('profiles/categories')
        yield warn('profiles/categories removed')
    except OSError:
        pass


@command
def distclean(args):
    """Clean repo, deeply"""
    clean()
    for file in glob('*-*/*/Manifest'):
        os.unlink(file)


def main():
    """Main script"""
    description = __doc__.splitlines()[0].split("-", 1)[1]
    epilog = "Please report bugs to jnrowe@gmail.com"
    parser = argh.ArghParser(description=description, epilog=epilog,
                             version="%%(prog)s (%s)" % VERSION)
    parser.add_commands(COMMANDS)
    parser.dispatch(pre_call=lambda args: setattr(args, 'commands', COMMANDS))


if __name__ == '__main__':
    sys.exit(main())
