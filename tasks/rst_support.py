import os

from StringIO import StringIO
from glob import glob
from re import sub
from subprocess import check_call
from sys import exit

from cake.helpers import task
from docutils.core import publish_file
from docutils.utils import SystemMessage

from utils import (dep, newer)


@task('Check syntax of reST-formatted files')
def rst_check():
    for file in glob('*.rst'):
        try:
            publish_file(open(file), destination=StringIO(),
                         settings_overrides={'halt_level': 1})
        except SystemMessage:
            exit(1)
    print 'All reST files pass!'


@task('Generate HTML output')
@dep(map(lambda s: os.path.splitext(s)[0] + '.html', glob('*.rst')),
     glob('*.rst'), mapping=True)
def gen_html():
    for file in glob('*.rst'):
        html_file = os.path.splitext(file)[0] + '.html'
        if newer(html_file, file):
            break
        try:
            publish_file(open(file), destination=open(html_file, 'w'),
                         settings_overrides={'halt_level': 1})
        except SystemMessage:
            exit(1)
    print 'All reST generated!'


@task('Generate Sphinx contributor doc')
@dep(['doc/thanks.rst', ], ['README.rst'])
def gen_thanks():
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


@task('Generate Sphinx HTML output')
@dep(['doc/.build/doctrees/environment.pickle', ],
     glob('doc/*.rst') + glob('doc/packages/*.rst'))
def gen_sphinx_html():
    check_call('make -C doc html'.split())
