#
# coding=utf-8
"""conf - Sphinx configuration information"""
# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
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

import os

from subprocess import (CalledProcessError, check_output)

extensions = \
    ["sphinx.ext.%s" % ext for ext in ['extlinks', 'intersphinx', ]] \
    + ["sphinxcontrib.%s" % ext for ext in ['cheeseshop']]

master_doc = 'index'
source_suffix = '.rst'

project = u'jnrowe-misc'
copyright = u'2009-2013, James Rowe'

version = "1.0"  # Just set 1.0, as it is unused in this document.
release = version

today_fmt = '%Y-%m-%d'

pygments_style = 'sphinx'
html_theme_options = {
    "externalrefs": True,
}
html_title = u"%s documentation" % project
try:
    html_last_updated_fmt = check_output(['git', 'log',
                                          "--pretty=format:'%ad [%h]'",
                                          '--date=short', '-n1'])
except CalledProcessError:
    pass

intersphinx_mapping = {
    'python': ('http://docs.python.org/', os.getenv('SPHINX_PYTHON_OBJECTS')),
}

extlinks = {
    'commit': ('https://github.com/JNRowe/jnrowe-misc/commit/%s', ''),
    'issue': ('https://github.com/JNRowe/jnrowe-misc/issues/%s', 'GitHub #'),
}
