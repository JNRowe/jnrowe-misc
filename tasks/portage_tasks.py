import os
from glob import glob
from subprocess import (check_call, check_output)

from cake.helpers import task


SIGN_KEY = check_output('. /etc/make.conf; echo $PORTAGE_GPG_KEY',
                        shell=True).strip()


@task('Generate use.local.desc')
def gen_use_local_desc():
    repo = open('profiles/repo_name').read().strip()
    # This really shouldn't be handled with subprocess, but portage seemingly
    # goes out of its way to make reasonable use difficult.
    check_call(('egencache --repo=%s --update-use-local-desc' % repo).split())


@task('Generate categories listing')
def gen_categories():
    with open('profiles/categories', 'w') as file:
        for cat in sorted(glob('*-*')):
            file.write(cat + '\n')


@task('Generate Manifest files')
def gen_manifests():
    base_dir = os.path.abspath(os.curdir)
    for package in sorted(glob('*-*/*')):
        os.chdir(package)
        ebuild = glob('*.ebuild')[0]
        check_call(('ebuild %s manifest' % ebuild).split())
        if SIGN_KEY:
            command = 'gpg --local-user %s --clearsign Manifest' % SIGN_KEY
            check_call(command.split())
            os.rename('Manifest.asc', 'Manifest')
        os.chdir(base_dir)


@task('Generate news file signatures')
def gen_news_sigs():
    if not SIGN_KEY:
        raise ValueError('No GnuPG key set!')
    for file in glob('metadata/news/*/*.txt'):
        sign_file = file + '.asc'
        # Delete up front, if we can't sign we shouldn't leave stale signatures
        os.unlink(sign_file)
        command = 'gpg --local-user %s --detach-sign --armor %s' \
            % (SIGN_KEY, file)
        check_call(command.split())
