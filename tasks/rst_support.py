from StringIO import StringIO
from glob import glob
from re import sub
from subprocess import check_call
from sys import exit

from docutils.core import publish_file
from docutils.utils import SystemMessage

from utils import (APP, dep, newer, success)


@APP.cmd(name='rst-check')
def rst_check():
    """check syntax of reST-formatted files"""
    for file in glob('*.rst'):
        try:
            publish_file(open(file), destination=StringIO(),
                         settings_overrides={'halt_level': 1})
        except SystemMessage:
            exit(1)
    print(success('All reST files pass!'))


@APP.cmd(name='gen-html')
def gen_html():
    """generate HTML output"""
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


@APP.cmd(name='gen-thanks')
def gen_thanks():
    """generate Sphinx contributor doc"""
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


@APP.cmd(name='gen-sphinx-html')
def gen_sphinx_html():
    """generate Sphinx HTML output"""
    dep(['doc/.build/doctrees/environment.pickle', ],
        glob('doc/*.rst') + glob('doc/packages/*.rst'))
    check_call(['make', '-C', 'doc', 'html'])
