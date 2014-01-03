# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit eutils jnrowe-pypi

DESCRIPTION="A helper tool for git that mimics mercurial's serve command"
HOMEPAGE="https://github.com/jezdez/git-serve/"
SRC_URI="${SRC_URI}
	mirror://github/JNRowe/jnrowe-misc/${P}-gitweb_1.6.4.4_update.patch.bz2"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-vcs/git"

PATCHES=("${FILESDIR}"/${P}-callable_from_git_ui.patch \
	"${WORKDIR}"/${P}-gitweb_1.6.4.4_update.patch)

DOCS=(README.txt)
