#
# -*- coding: utf-8 -*-
"""portage_tasks - Portage support tasks"""
# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
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
from glob import glob
from subprocess import (CalledProcessError, check_call, check_output)

from tasks.utils import (cli, CommandError, dep, fail, newer, success, warn)

try:
    SIGN_KEY = check_output(['portageq', 'envvar', 'PORTAGE_GPG_KEY']).strip()
except CalledProcessError:
    SIGN_KEY = None


@cli.command(name='gen-categories')
def gen_categories():
    """Generate categories listing."""
    categories = glob('*-*') + ['virtual', ]
    dep(['profiles/categories', ], categories)
    with open('profiles/categories', 'w') as file:
        for cat in sorted(categories):
            if not os.path.isdir(cat):
                print(warn('Category match on %s, may cause problems with '
                           'portage' % cat))
                continue
            file.write(cat + '\n')
    print(success('categories list generated!'))


@cli.command(name='gen-manifests')
def gen_manifests():
    """Generate Manifest files."""
    packages = glob('*-*/*/*') + glob('virtual/*/*')
    dep(glob('*-*/*/Manifest') + glob('virtual/*/Manifest'), packages)
    base_dir = os.path.abspath(os.curdir)
    if not SIGN_KEY:
        print(warn('No GnuPG key set!'))
    for package in sorted(packages):
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


@cli.command(name='gen-news-sigs')
def gen_news_sigs():
    """Generate news file signatures."""
    news_files = glob('metadata/news/*/*.txt')
    dep(map(lambda s: s + '.asc', news_files), news_files, mapping=True)
    if not SIGN_KEY:
        raise CommandError(fail('No GnuPG key set!'))
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
