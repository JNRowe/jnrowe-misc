from glob import glob
from sys import exit

from xml.etree import ElementTree as ET

from cake.lib import (puts, task)


@task('Check basic layman config validity')
def layman_check():
    """Check layman config files are parseable

    This would do a whole lot more if there was a published schema to test
    against.
    """
    for file in glob('support/layman*.xml'):
        try:
            ET.parse(file)
        except ET.ParseError:
            puts('{red}Parsing error in %r' % file)
            exit(1)
    puts('{green}layman files files are parseable XML!')
