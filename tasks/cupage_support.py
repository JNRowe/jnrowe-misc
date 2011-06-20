import os

from glob import glob
from sys import exit

from cake.helpers import task
from cake.lib import puts

from utils import dep


@task('Generate a new cupage.conf file')
@dep(['support/cupage.conf', ], glob('*-*/*/watch'))
def gen_cupage_conf():
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
    puts('{green}cupage.conf generated!')


@task('Make sure a watch file exists for each package')
def cupage_check():
    failures = 0
    packages = glob('*-*/*')
    for package in packages:
        if not os.path.isfile(os.path.join(package, 'watch')):
            puts('{red}Missing watch file in %r' % package)
            failures += 1
    if failures == 0:
        puts('{green}All watch files present!')
    else:
        puts('{red}%d watch file%s missing!' % (failures,
                                                's' if failures > 1 else ''))
        exit(failures)
