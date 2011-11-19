import datetime

from collections import defaultdict

from cake.helpers import (task, sh)
from cake.lib import puts

from utils import dep


@task('Generate remind file for package removals')
@dep(['support/removal.rem', ], ['profiles/package.mask', ])
def gen_removals():
    chunks = open("profiles/package.mask").read().split("\n\n")
    removals = defaultdict(list)
    for chunk in filter(lambda s: "\n# X-Removal: " in s, chunks):
        data = chunk[chunk.index("X-Removal"):].split("\n")
        removal_date = data[0][11:]
        removals[removal_date].append(data[1:])

    with open("support/removal.rem", "w") as file:
        file.write("# THIS FILE IS AUTOGENERATED FROM "
                   "profiles/package.mask\n\n")
        for date, items in sorted(removals.items(), reverse=True):
            for pkgs in items:
                for pkg in filter(None, pkgs):
                    file.write("REM %s *1 +1 UNTIL 2038-01-19 PRIORITY 2500 "
                               "MSG Removal due for %s %%a\n" % (date, pkg))
    puts('{green}removal.rem generated!')


@task('Display repository reminders')
def reminders():
    sh('remind support/removal.rem')
    sh('remind support/stabilisation.rem')
