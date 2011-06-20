from functools import update_wrapper
from os import path

from cake.lib import puts


def empty_rule(f):
    puts('{yellow}Nothing to do for %r' % f.__name__)


def newer(file1, file2):
    def getmtime(file):
        if isinstance(file, (int, float)):
            return file
        elif not path.exists(file):
            return 0
        else:
            return path.getmtime(file)
    file1_time = getmtime(file1)
    file2_time = getmtime(file2)

    return file1_time > file2_time


def dep(targets, sources, mapping=False):
    def wrapper(f):
        rebuild = False
        if not all(map(path.exists, targets)):
            rebuild = True
        else:
            if not mapping:
                target_mtime = min(map(path.getmtime, targets))
                if any(filter(lambda x: newer(x, target_mtime), sources)):
                    rebuild = True
            else:
                rebuild = not all(newer(s, t)
                                  for s, t in zip(targets, sources))
        if rebuild:
            return f
        else:
            return update_wrapper(lambda: empty_rule(f), f)

    return wrapper
