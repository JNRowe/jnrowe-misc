from StringIO import StringIO

import argh

from lxml import etree

from utils import (command, fail, success)

try:
    import httplib2
except ImportError:
    httplib2 = None  # NOQA
try:
    import lxml
except ImportError:
    lxml = None  # NOQA


@command
def layman_check(args):
    """check basic layman config validity"""
    dtd_loc = ('http://git.overlays.gentoo.org/gitweb/?'
               'p=proj/repositories-xml-format.git;a=blob_plain;'
               'f=schema/%s;hb=HEAD')

    if not lxml or not httplib2:
        raise argh.CommandError(fail("Layman validity checks require the "
                                     "httplib2 and lxml Python packages"))

    http = httplib2.Http(cache='.http_cache')

    layman_dtd = http.request(dtd_loc % 'layman-global.dtd')[1]
    repos_dtd = http.request(dtd_loc % 'repositories.dtd')[1]

    failed = False
    for dtd, file in [(layman_dtd, 'layman.xml'), (repos_dtd, 'layman2.xml')]:
        dtd = etree.DTD(StringIO(dtd))
        doc = etree.parse('support/%s' % file)
        if not dtd.validate(doc):
            yield fail('%s is invalid' % file)
            failed = True

    if not failed:
        yield success('layman files valid!')
