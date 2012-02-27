import os

from StringIO import StringIO
from glob import glob
from re import sub
from subprocess import check_call
from sys import exit

from docutils.core import publish_file
from docutils.utils import SystemMessage

from utils import (command, dep, newer, success)


@command
def rst_check(args):
    """Check syntax of reST-formatted files"""
    for file in glob('*.rst'):
        try:
            publish_file(open(file), destination=StringIO(),
                         settings_overrides={'halt_level': 1})
        except SystemMessage:
            exit(1)
    yield success('All reST files pass!')


@command
def gen_html(args):
    """Generate HTML output"""
    dep(map(lambda s: os.path.splitext(s)[0] + '.html', glob('*.rst')),
            glob('*.rst'), mapping=True)
    for file in glob('*.rst'):
        html_file = os.path.splitext(file)[0] + '.html'
        if newer(html_file, file):
            break
        try:
            publish_file(open(file), destination=open(html_file, 'w'),
                         settings_overrides={'halt_level': 1})
        except SystemMessage:
            exit(1)
        yield success('%s generated!' % file)
    yield success('All reST generated!')


@command
def gen_thanks(args):
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
    yield success('thanks.rst generated!')


@command
def gen_sphinx_html(args):
    """Generate Sphinx HTML output"""
    dep(['doc/.build/doctrees/environment.pickle', ],
        glob('doc/*.rst') + glob('doc/packages/*.rst'))
    check_call('make -C doc html'.split())
