import os
from glob import glob
from subprocess import (check_call, check_output)

import argh

from utils import (command, dep, fail, newer, success, warn)

try:
    SIGN_KEY = check_output('. /etc/make.conf; echo $PORTAGE_GPG_KEY',
                            shell=True).strip()
except OSError:
    SIGN_KEY = None


@command
def gen_use_local_desc(args):
    """Generate use.local.desc"""
    dep(['profiles/use.local.desc', ], glob('*-*/*/metadata.xml'))
    repo = open('profiles/repo_name').read().strip()
    # This really shouldn't be handled with subprocess, but portage seemingly
    # goes out of its way to make reasonable use difficult.
    check_call(('egencache --repo=%s --update-use-local-desc' % repo).split())
    yield success('use.local.desc generated!')


@command
def gen_categories(args):
    """Generate categories listing"""
    dep(['profiles/categories', ], glob('*-*'))
    with open('profiles/categories', 'w') as file:
        for cat in sorted(glob('*-*')):
            if not os.path.isdir(cat):
                yield warn('Category match on %s, may cause problems with '
                           'portage' % cat)
                continue
            file.write(cat + '\n')
    yield success('categories list generated!')


@command
def gen_manifests(args):
    """Generate Manifest files"""
    dep(glob('*-*/*/Manifest'), glob('*-*/*/*'))
    base_dir = os.path.abspath(os.curdir)
    if not SIGN_KEY:
        yield warn('No GnuPG key set!')
    for package in sorted(glob('*-*/*')):
        try:
            os.chdir(package)
            if not any(map(lambda f: newer(f, 'Manifest'), glob('*'))):
                break
            check_call(['repoman', 'manifest'])
            if SIGN_KEY:
                check_call(['gpg', '--local-user', SIGN_KEY, '--clearsign',
                            'Manifest'])
                os.rename('Manifest.asc', 'Manifest')
        finally:
            os.chdir(base_dir)


@command
def gen_news_sigs(args):
    """Generate news file signatures"""
    news_files = glob('metadata/news/*/*.txt')
    dep(map(lambda s: s + '.asc', news_files), news_files, mapping=True)
    if not SIGN_KEY:
        raise argh.CommandError(fail('No GnuPG key set!'))
    base_dir = os.path.abspath(os.curdir)
    for path in news_files:
        try:
            dir, file = os.path.split(path)
            os.chdir(dir)
            sign_file = file + '.asc'
            if newer(sign_file, file):
                continue
            # Delete up front, if we can't sign we shouldn't leave stale
            # signatures
            if os.path.exists(sign_file):
                os.unlink(sign_file)
            check_call(['gpg', '--local-user', SIGN_KEY, '--detach-sign',
                        '--armor', file])
        finally:
            os.chdir(base_dir)
