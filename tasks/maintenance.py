import datetime

from glob import glob
from re import search
from subprocess import check_output

from cake.helpers import task
from cake.lib import puts
from github2.client import Github


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


@task('Open a new bump bug')
def open_bug(title, body="", label=None):
    user = check_output('git config github.user'.split()).strip()
    token = check_output('git config github.token'.split()).strip()
    project_url = check_output('git config remote.origin.url'.split()).strip()
    project = search('github.com[:/]([^/]+/.*).git', project_url).groups()[0]
    github = Github(username=user, api_token=token)
    new_issue = github.issues.open(project, title, body)
    if label:
        github.issues.add_label(project, new_issue.number, label)


@task('Open a version bump bug')
def bump_pkg(cpv):
    open_bug('%s version bump.' % cpv, '', 'feature')
