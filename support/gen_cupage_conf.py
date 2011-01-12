#! /usr/bin/python -tt
# vim: set sw=4 sts=4 et tw=80 fileencoding=utf-8:
#
"""gen_cupage_conf - Generate cupage.conf from watch files"""
# Copyright (C) 2011  James Rowe <jnrowe@gmail.com>
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
__date__ = "2011-01-12"
__author__ = "James Rowe <jnrowe@gmail.com>"
__copyright__ = "Copyright (C) 2011 James Rowe <jnrowe@gmail.com>"
__license__ = "GNU General Public License Version 3"
__credits__ = ""
__history__ = "See git repository"

import glob
import os
import sys


def main():
    for category in sorted(glob.glob("*-*")):
        os.chdir(category)
        print "### %s {{{" % category
        packages = glob.glob("*")
        for package in sorted(packages):
            watch_data = open("%s/watch" % package).read()[:-1]
            if watch_data.startswith("# Live ebuild"):
                print "# %s is a live ebuild" % package
            elif "upstream is dead" in watch_data:
                print "# %s's upstream is dead" % package
            else:
                if not watch_data.startswith("["):
                    print "[%s]" % package
                print watch_data
        print "# }}}"
        print
        os.chdir(os.pardir)

if __name__ == '__main__':
    sys.exit(main())
