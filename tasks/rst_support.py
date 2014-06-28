#
# -*- coding: utf-8 -*-
"""rst_support - reStructuredText support tasks"""
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

from glob import glob
from re import sub
from subprocess import check_call
from sys import exit

try:  # Python 3
    from io import StringIO
except ImportError:  # Python 2
    from StringIO import StringIO  # NOQA

from docutils.core import publish_file
from docutils.utils import SystemMessage

from tasks.utils import (cli, dep, newer, success)


@cli.command(name='rst-check', help='check syntax of reST-formatted files')
def rst_check():
    """Check syntax of reST-formatted files"""
    for file in glob('*.rst'):
        try:
            publish_file(open(file), destination=StringIO(),
                         settings_overrides={'halt_level': 1})
        except SystemMessage:
            exit(1)
    print(success('All reST files pass!'))


@cli.command(name='gen-html', help='generate HTML output')
def gen_html():
    """Generate HTML output"""
    rst_files = glob('*.rst')
    dep(map(lambda s: s[:-4] + '.html', rst_files), rst_files, mapping=True)
    for file in glob('*.rst'):
        html_file = file[:-4] + '.html'
        if newer(html_file, file):
            break
        try:
            publish_file(open(file), destination=open(html_file, 'w'),
                         settings_overrides={'halt_level': 1})
        except SystemMessage:
            exit(1)
        print(success('%s generated!' % file))
    print(success('All reST generated!'))


@cli.command(name='gen-thanks', help='generate Sphinx contributor doc')
def gen_thanks():
    """Generate Sphinx contributor doc"""
    dep(['doc/thanks.rst', ], ['README.rst'])
    data = open('README.rst').read()
    data = sub("\n('+)\n", lambda m: '\n' + "-" * len(m.groups()[0]) + '\n',
               data)
    data = data.splitlines()
    start = data.index('Contributors')
    end = data.index('Python multi-ABI support')
    data[start + 1] = sub('-', '=', data[start + 1])

    with open('doc/thanks.rst', 'w') as file:
        add_nl = lambda x: map(lambda s: s + '\n', x)
        file.writelines(add_nl(data[start:end]))
        links = filter(lambda s: s.startswith(('.. _email:', '.. _GitHub:')),
                       data)
        file.writelines(add_nl(links))
    print(success('thanks.rst generated!'))


@cli.command(name='gen-sphinx-html', help='generate Sphinx HTML output')
def gen_sphinx_html():
    """Generate Sphinx HTML output"""
    dep(['doc/.build/doctrees/environment.pickle', ],
        glob('doc/*.rst') + glob('doc/packages/*.rst'))
    check_call(['make', '-C', 'doc', 'html'])
