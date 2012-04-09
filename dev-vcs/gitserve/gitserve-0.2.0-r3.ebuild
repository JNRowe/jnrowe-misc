# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit eutils jnrowe-pypi

DESCRIPTION="A helper tool for git that mimics mercurial's serve command"
HOMEPAGE="https://github.com/jezdez/git-serve/"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz
	https://github.com/downloads/JNRowe/jnrowe-misc/${P}-gitweb_1.6.4.4_update.patch.bz2"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-vcs/git"

PATCHES=("${FILESDIR}"/${P}-callable_from_git_ui.patch "${WORKDIR}"/${P}-gitweb_1.6.4.4_update.patch)

DOCS=(README.txt)

python_install_all() {
	python-distutils-ng_redoscript "/usr/bin/git-serve"
}
