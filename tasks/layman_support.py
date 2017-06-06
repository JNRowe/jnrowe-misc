#
# -*- coding: utf-8 -*-
"""layman_support - layman support tasks"""
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

try:  # Python 3
    from io import StringIO
except ImportError:  # Python 2
    from StringIO import StringIO  # NOQA

from lxml import etree

from tasks.utils import (cli, CommandError, fail, success)

try:
    import httplib2
except ImportError:
    httplib2 = None  # NOQA
try:
    import lxml
except ImportError:
    lxml = None  # NOQA


@cli.command(name='layman-check')
def layman_check():
    """Check basic layman config validity."""
    dtd_loc = ('http://git.overlays.gentoo.org/gitweb/?'
               'p=proj/repositories-xml-format.git;a=blob_plain;'
               'f=schema/%s;hb=HEAD')

    if not lxml or not httplib2:
        raise CommandError(fail("Layman validity checks require the httplib2 "
                                "and lxml Python packages"))

    http = httplib2.Http(cache='.http_cache')

    layman_dtd = http.request(dtd_loc % 'layman-global.dtd')[1]
    repos_dtd = http.request(dtd_loc % 'repositories.dtd')[1]

    failed = False
    for dtd, file in [(layman_dtd, 'layman.xml'), (repos_dtd, 'layman2.xml')]:
        dtd = etree.DTD(StringIO(dtd))
        doc = etree.parse('support/%s' % file)
        if not dtd.validate(doc):
            print(fail('%s is invalid' % file))
            failed = True

    if not failed:
        print(success('layman files valid!'))
