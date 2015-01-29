#! /usr/bin/python -tt
# -*- coding: utf-8 -*-
"""Makefile - Overlay maintenance helpers"""
# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
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
from subprocess import check_output

import click


try:
    VERSION = check_output('git describe --always'.split()).strip().decode()
except OSError:
    VERSION = 'unknown'


@click.group(help=__doc__.splitlines()[0].split("-", 1)[1],
             epilog='Please report bugs to '
                    'https://github.com/JNRowe/jnrowe-misc/issues')
@click.version_option(VERSION)
def cli():
    """Main command entry point."""


# These must be below cli() to workaround circular imports
from tasks import *  # NOQA


@cli.command(name='all')
def make_all():
    """Update generated files."""
    for name in sorted(globals()):
        if name.startswith('gen_') and not name == 'gen_stable':
            globals()[name]()


@cli.command()
@click.pass_context
def check(ctx):
    """Run tests."""
    for name, func in sorted(cli.commands.items()):
        if name.endswith('-check'):
            ctx.invoke(func)


@cli.command()
def clean():
    """Clean repo."""
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


@cli.command()
def distclean():
    """Clean repo, deeply."""
    clean()
    for file in glob('*-*/*/Manifest'):
        os.unlink(file)


if __name__ == '__main__':
    sys.exit(cli())
