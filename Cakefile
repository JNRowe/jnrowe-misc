# -*- mode: Python; -*-

import os

from glob import glob

load('tasks/*.py')


@task('Update generated files')
def all():
    gen_html()
    gen_categories()
    gen_use_local_desc()
    gen_manifests()
    gen_news_sigs()
    gen_cupage_conf()
    gen_removals()


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
