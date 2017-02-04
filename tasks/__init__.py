#
# -*- coding: utf-8 -*-
"""tasks - Overlay maintainer tools"""
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

# Pull in all the tasks here, to simplify setup in Makefile.py(at the expense
# of horrific wildcard imports)

from tasks.cupage_support import *  # NOQA
from tasks.layman_support import *  # NOQA
from tasks.maintenance import *  # NOQA
from tasks.portage_tasks import *  # NOQA
from tasks.remind_support import *  # NOQA
from tasks.rst_support import *  # NOQA
from tasks.utils import *  # NOQA
