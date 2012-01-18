import os
from glob import glob
from subprocess import (check_call, check_output)

from cake.lib import (puts, task)

from utils import (dep, newer)


SIGN_KEY = check_output('. /etc/make.conf; echo $PORTAGE_GPG_KEY',
                        shell=True).strip()


@task('Generate use.local.desc')
@dep(['profiles/use.local.desc', ], glob('*-*/*/metadata.xml'))
def gen_use_local_desc():
    repo = open('profiles/repo_name').read().strip()
    # This really shouldn't be handled with subprocess, but portage seemingly
    # goes out of its way to make reasonable use difficult.
    check_call(('egencache --repo=%s --update-use-local-desc' % repo).split())
    puts('{green}use.local.desc generated!')


@task('Generate categories listing')
@dep(['profiles/categories', ], glob('*-*'))
def gen_categories():
    with open('profiles/categories', 'w') as file:
        for cat in sorted(glob('*-*')):
            file.write(cat + '\n')
    puts('{green}categories list generated!')


@task('Generate Manifest files')
@dep(glob('*-*/*/Manifest'), glob('*-*/*/*'))
def gen_manifests():
    base_dir = os.path.abspath(os.curdir)
    for package in sorted(glob('*-*/*')):
        try:
            os.chdir(package)
            if not any(map(lambda f: newer(f, 'Manifest'), glob('*'))):
                break
            ebuild = glob('*.ebuild')[0]
            check_call(('ebuild %s manifest' % ebuild).split())
            if SIGN_KEY:
                command = 'gpg --local-user %s --clearsign Manifest' % SIGN_KEY
                check_call(command.split())
                os.rename('Manifest.asc', 'Manifest')
        finally:
            os.chdir(base_dir)


@task('Generate news file signatures')
@dep(map(lambda s: s + '.asc', glob('metadata/news/*/*.txt')),
     glob('metadata/news/*/*.txt'), mapping=True)
def gen_news_sigs():
    if not SIGN_KEY:
        raise ValueError('No GnuPG key set!')
    base_dir = os.path.abspath(os.curdir)
    for path in glob('metadata/news/*/*.txt'):
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
            command = 'gpg --local-user %s --detach-sign --armor %s' \
                % (SIGN_KEY, file)
            check_call(command.split())
        finally:
            os.chdir(base_dir)
