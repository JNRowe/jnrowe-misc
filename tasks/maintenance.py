import datetime

from glob import glob

from cake.helpers import task
from cake.lib import puts

@task('Check for missing keywords')
def keyword_check():
    for file in glob('metadata/cache/*/*'):
        # Skip live packages, they shouldn't be keyworded anyway
        if file.endswith('-9999'):
            continue
        keywords = open(file).readlines()[8]
        pkg = file.split('/', 2)[2]
        if 'amd64' not in keywords:
            puts('{red}[~]amd64 keyword missing in %r' % pkg)
        if 'x86' not in keywords:
            puts('{red}[~]x86 keyword missing in %r' % pkg)
    puts('{green}All packages checked for keywords')


@task('Generate a base stabilsation string for a package')
def gen_stable(cpv):
    date = datetime.date.today() + datetime.timedelta(days=30)
    for arch in ('amd64', 'x86'):
        print "* %-40s %5s SCHEDULED: <%s>" \
              % (cpv, arch, date.strftime("%Y-%m-%d %a"))
