from functools import partial
from inspect import stack
from json import (dumps, loads)
from os import path
from re import search
from subprocess import (CalledProcessError, check_output)

import argh
import blessings

try:
    import httplib2
except ImportError:
    httplib2 = None  # NOQA


CA_CERTS = '/etc/ssl/certs/ca-certificates.crt'

T = blessings.Terminal()


def success(text):
    return T.bright_green(text)


def fail(text):
    return T.bright_red(text)


def warn(text):
    return T.bright_yellow(text)


COMMANDS = []


def command(func):
    """Simple decorator to add function to ``COMMANDS`` list

    The purpose of this decorator is to make the definition of commands simpler
    by reducing duplication, it is purely a convenience.

    :param func func: Function to wrap
    :rtype: func
    :returns: Original function
    """
    COMMANDS.append(func)
    return func


def newer(file1, file2):
    def getmtime(file):
        if isinstance(file, (int, float)):
            return file
        elif not path.exists(file):
            return 0
        else:
            return path.getmtime(file)
    file1_time = getmtime(file1)
    file2_time = getmtime(file2)

    return file1_time > file2_time


def dep(targets, sources, mapping=False):
    rebuild = False
    if not all(map(path.exists, targets)):
        rebuild = True
    else:
        if not mapping:
            target_mtime = min(map(path.getmtime, targets))
            if any(filter(lambda x: newer(x, target_mtime), sources)):
                rebuild = True
        else:
            rebuild = not all(newer(s, t)
                              for s, t in zip(targets, sources))
    if not rebuild:
        f_name = stack()[1][0].f_locals['args'].function.func_name
        raise argh.CommandError(success('Nothing to do for %s' % f_name))


def cmd_output(command):
    return check_output(command.split()).strip()


def create_gh_client():
    if not httplib2:
        raise argh.CommandError(fail("Opening bugs requires the httplib2 "
                                     "Python package"))
    if not path.exists(CA_CERTS):
        raise argh.CommandError(fail("Unable to find system SSL certificates"))

    def request(uri, method='GET', body=None):
        if body:
            body = dumps(body)
        r, c = session.request(uri, method, body,
                               {"Authorization": "token %s" % token})
        r.content = loads(c)
        return r

    repo = open('profiles/repo_name').read().strip()
    try:
        token = cmd_output('git config %s.token' % repo)
    except CalledProcessError:
        raise argh.CommandError('Missing %s.token API token in git config'
                                % repo)

    session = httplib2.Http(cache='.http_cache', ca_certs=CA_CERTS)
    session.get = partial(request, method='GET')
    session.post = partial(request, method='POST')
    return session


def fetch_project_name():
    project_url = cmd_output('git config remote.origin.url')
    return search('github.com[:/]([^/]+/.*).git', project_url).groups()[0]


def open_issue(data):
    github = create_gh_client()
    project = fetch_project_name()
    new_issue = github.post('https://api.github.com/repos/%s/issues' % project,
                            body=data)
    yield success("Issue #%d opened!" % new_issue.content['number'])
