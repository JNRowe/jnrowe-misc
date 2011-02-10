#! /usr/bin/python -tt
# vim: set sw=4 sts=4 et tw=80 fileencoding=utf-8:
#
"""gen_removal - Generate remind compatible cues from package.mask"""
# Copyright (C) 2009 James Rowe;
# All rights reserved.
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

__version__ = "0.1.0"
__date__ = "2010-03-30"
__author__ = "James Rowe <jnrowe@gmail.com>"
__copyright__ = "Copyright (C) 2010 James Rowe"
__license__ = "GNU General Public License Version 3"
__credits__ = ""
__history__ = "See Git repository"

import collections
import glob
import os
import re
import sys

from xml.etree import cElementTree as ET
from xml.sax.saxutils import unescape

def main():
    pmask = "profiles/package.mask"
    if not os.path.exists(pmask):
        sys.stderr.write("%s must be run from within a repo.\n" % __file__)
        return 1

    chunks = open("profiles/package.mask").read().split("\n\n")
    removals = collections.defaultdict(list)
    for chunk in filter(lambda s: "\n# X-Removal: " in s, chunks):
        data = chunk[chunk.index("X-Removal"):].split("\n")
        removals[data[0][11:]].append(data[1:])

    with open("support/removal.remind", "w") as file:
        file.write("# THIS FILE IS AUTOGENERATED FROM profiles/package.mask\n\n")
        for key, items in sorted(removals.items(), reverse=True):
            for pkgs in items:
                for pkg in pkgs:
                    file.write("REM %s *1 +1 UNTIL 2038-01-19 PRIORITY 2500 "
                               "MSG Removal due for %s %%a\n" % (key, pkg))

if __name__ == '__main__':
    sys.exit(main())
