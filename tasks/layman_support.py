from glob import glob
from sys import exit

from xml.etree import ElementTree as ET

from utils import (command, fail, success)


@command
def layman_check(args):
    """Check basic layman config validity"""
    # This would do a whole lot more useful if there was a published schema to
    # test against
    for file in glob('support/layman*.xml'):
        try:
            ET.parse(file)
        except ET.ParseError:
            yield fail('Parsing error in %r' % file)
            exit(1)
    yield success('layman files files are parseable XML!')
