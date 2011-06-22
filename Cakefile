# -*- mode: Python; -*-

import os
import sys

from glob import glob

sys.path.append('tasks')

load('tasks/*.py')


@task('Update generated files')
def all():
    for task in [v for k, v in globals().items()
                if k.startswith('gen_') and not k == 'gen_stable']:
        task()


@task('Run tests')
def check():
    for task in [v for k, v in globals().items() if k.endswith('_check')]:
        task()


@task('Clean repo')
def clean():
    for file in glob('*.rst'):
        html_file = os.path.splitext(file)[0] + '.html'
        try:
            os.unlink(html_file)
        except OSError:
            pass
    try:
        os.unlink('profiles/categories')
    except OSError:
        pass


@task('Clean repo, deeply')
def distclean():
    clean()
    for file in glob('*-*/*/Manifest'):
        os.unlink(file)
