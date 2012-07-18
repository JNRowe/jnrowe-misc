#! /usr/bin/python

import os
import sys

sys.path.insert(0, "/usr/lib/portage/pym")

import portage


REPO_NAME = open('profiles/repo_name').read().strip()

REMIND = True

# This is awful, but portage really doesn't provide a much better way to get
# the data
REPO = portage.config().repositories.prepos[REPO_NAME]
CACHE = REPO.iter_pregenerated_caches('').next()


DUE = {'amd64': {}, 'x86': {}}
for line in open("support/stabilisation.%s" % ("rem" if REMIND else "org")):
    if not line.strip():
        continue
    words = line.split()
    if REMIND:
        DUE[words[5]][words[6][:-2]] = words[1]
    else:
        DUE[words[2]][words[1]] = words[4][1:]

MASKED = []
for line in open('profiles/package.mask'):
    if not line.strip() or line.startswith('#'):
        continue
    MASKED.append(line.strip())


def keywords(atom, keywords):
    cpv = atom[1:]

    def due(kw):
        date = DUE[kw[1:]].get(cpv)
        if date:
            return "due %s" % date
        else:
            return "indefinite"

    if keywords:
        output = []
        for kw in keywords.split(" "):
            if "~" in kw:
                output.append("``%s`` (%s)" % (kw, due(kw)))
            else:
                output.append("``%s``" % kw)
        text = ", ".join(output)
    else:
        text = ""

    if atom in MASKED or atom.cp in MASKED:
        if text:
            text += " "
        text += "(masked by ``package.mask``)"

    return text


def live(atom, eclasses):
    if atom.version == "9999":
        if "git" in eclasses:
            text = "[``git``]"
        elif "mercurial" in eclasses:
            text = "[``hg``]"
        else:
            raise ValueError(atom)
    else:
        text = ""
    return text


def write_cat_doc(cat, output):
    output.append('')
    output.append('')
    open("doc/packages/%s.rst" % cat, "w").write("\n".join(output))


if not os.path.isdir("doc/packages"):
    os.mkdir("doc/packages")

output = []
cat = pkg = ''
for package, meta in sorted(CACHE.items()):
    c, p, v, r = portage.catpkgsplit(package)
    atom = portage.dep.Atom('=' + package)
    meta['NAME'] = p
    if not c == cat:
        if output:
            write_cat_doc(cat, output)

        output = []
        cat = c

        output.append("``%s``" % cat)
        output.append("--" + "-" * len(cat) + "--")
    if not p == pkg:
        if not meta["HOMEPAGE"] == "DEAD":
            output.append('\n* ``%(NAME)s`` - %(HOMEPAGE)s' % meta)
        else:
            output.append('\n* ``%(NAME)s`` - no upstream' % meta)
        output.append('\n * %(DESCRIPTION)s' % meta)
        output.append(' * Licence: ``%(LICENSE)s``' % meta)
        output.append(' * Versions:\n')
        pkg = p

    gh = "https://github.com/JNRowe/%s/blob/master/%s/%s/%s-%s.ebuild" \
        % (REPO_NAME, c, p, p, atom.version)
    output.append('  * `%s <%s>`__ %s %s' % (atom.version, gh,
                                             live(atom, meta['_eclasses_']),
                                             keywords(atom, meta['KEYWORDS'])))

write_cat_doc(cat, output)
