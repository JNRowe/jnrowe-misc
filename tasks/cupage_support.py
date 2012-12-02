#
# -*- coding: utf-8 -*-
"""cupage_support - cupage support tasks"""
# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
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
from sys import exit

from utils import (APP, dep, fail, success)


@APP.cmd(name='gen-cupage-conf', help='generate a new cupage.conf file')
def gen_cupage_conf():
    """Generate a new cupage.conf file"""
    dep(['support/cupage.conf', ], glob('*-*/*/watch'))
    with open('support/cupage.conf', 'w') as f:
        for category in sorted(glob('*-*')):
            os.chdir(category)
            f.write('### %s {{{\n' % category)
            for package in sorted(glob('*')):
                watch_data = open('%s/watch' % package).read()[:-1]
                if watch_data.startswith('# Live ebuild'):
                    f.write('# %s is a live ebuild\n' % package)
                elif 'upstream is dead' in watch_data:
                    f.write("# %s's upstream is dead\n" % package)
                else:
                    if not watch_data.startswith('['):
                        f.write('[%s]\n' % package)
                    f.write(watch_data + '\n')
            f.write('# }}}\n\n')
            os.chdir(os.pardir)
    print(success('cupage.conf generated!'))


@APP.cmd(name='cupage-check',
         help='make sure a watch file exists for each package')
def cupage_check():
    """Make sure a watch file exists for each package"""
    failures = 0
    packages = glob('*-*/*')
    for package in packages:
        if not os.path.isfile(os.path.join(package, 'watch')):
            print(fail('Missing watch file in %r' % package))
            failures += 1
    if failures == 0:
        print(success('All watch files present!'))
    else:
        print(fail('%d watch file%s missing!'
                   % (failures, 's' if failures > 1 else '')))
        exit(failures)
