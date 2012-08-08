from StringIO import StringIO

from lxml import etree

from utils import (APP, CommandError, fail, success)

try:
    import httplib2
except ImportError:
    httplib2 = None  # NOQA
try:
    import lxml
except ImportError:
    lxml = None  # NOQA


@APP.cmd(name='layman-check')
def layman_check():
    """check basic layman config validity"""
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
