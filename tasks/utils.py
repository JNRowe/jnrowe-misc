from os import path

import argh
import blessings


T = blessings.Terminal()


def success(text):
    return T.bright_green(text)


def fail(text):
    return T.bright_red(text)


def warn(text):
    return T.bright_yellow(text)


COMMANDS = []


def command(func):
    """Simple decorator to add function to ``COMMANDS`` list

    The purpose of this decorator is to make the definition of commands simpler
    by reducing duplication, it is purely a convenience.

    :param func func: Function to wrap
    :rtype: func
    :returns: Original function
    """
    COMMANDS.append(func)
    return func


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


def dep(args, targets, sources, mapping=False):
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
    if not rebuild:
        raise argh.CommandError('Nothing to do for %s'
                                % args.function.__name__)
