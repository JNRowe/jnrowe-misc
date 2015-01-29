#
# -*- coding: utf-8 -*-
"""utils - Helpers for tasks"""
# Copyright © 2009-2015  James Rowe <jnrowe@gmail.com>
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

from functools import partial
from inspect import stack
from json import (dumps, loads)
from os import path
from re import search
from subprocess import (CalledProcessError, check_output)

import click

try:
    import httplib2
except ImportError:
    httplib2 = None  # NOQA


CA_CERTS = '/etc/ssl/certs/ca-certificates.crt'

cli = stack()[-1][0].f_globals['cli']


def success(text):
    click.termui.secho(text, fg='green', bold=True)


def fail(text):
    click.termui.secho(text, fg='red', bold=True)


def warn(text):
    click.termui.secho(text, fg='yellow', bold=True)


class CommandError(ValueError):
    pass


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
        raise CommandError(success('Nothing to do!'))


def cmd_output(command):
    return check_output(command.split()).strip().decode()


def create_gh_client():
    if not httplib2:
        raise CommandError(fail("Opening bugs requires the httplib2 "
                                "Python package"))
    if not path.exists(CA_CERTS):
        raise CommandError(fail("Unable to find system SSL certificates"))

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
        raise CommandError('Missing %s.token API token in git config'
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
    print(success("Issue #%d opened!" % new_issue.content['number']))
