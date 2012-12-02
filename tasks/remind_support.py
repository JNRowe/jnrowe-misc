#
# -*- coding: utf-8 -*-
"""remind_support - remind support tasks"""
# Copyright © 2011, 2012  James Rowe <jnrowe@gmail.com>
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

from collections import defaultdict

from utils import (APP, cmd_output, dep, success)


@APP.cmd(name='gen-removals', help='generate remind file for package removals')
def gen_removals():
    """Generate remind file for package removals"""
    dep(['support/removal.rem', ], ['profiles/package.mask', ])
    chunks = open("profiles/package.mask").read().split("\n\n")
    removals = defaultdict(list)
    for chunk in filter(lambda s: "\n# X-Removal: " in s, chunks):
        data = chunk[chunk.index("X-Removal"):].split("\n")
        removal_date = data[0][11:]
        removals[removal_date].append(data[1:])

    with open("support/removal.rem", "w") as file:
        file.write("# THIS FILE IS AUTOGENERATED FROM "
                   "profiles/package.mask\n\n")
        for date, items in sorted(removals.items()):
            for pkgs in items:
                for pkg in filter(None, pkgs):
                    file.write("REM %s *1 PRIORITY 2500 "
                               'MSG %%"Removal due for %s%%" %%a\n'
                               % (date, pkg))
    print(success('removal.rem generated!'))


@APP.cmd(help='display repository reminders')
def reminders():
    """Display repository reminders"""
    output = lambda f: "\n".join(cmd_output('remind %s' % f).splitlines()[1:])
    removals = output('support/removal.rem')
    if removals:
        print('Removals:')
        print(removals)
    stable_candidates = output('support/stabilisation.rem')
    if stable_candidates:
        print('Stabilisation:')
        print(stable_candidates)
