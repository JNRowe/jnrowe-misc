# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"

inherit eutils jnrowe-pypi

GIT_P="git-1.6.4.4"

DESCRIPTION="A helper tool for git that mimics mercurial's serve command"
HOMEPAGE="http://github.com/jezdez/git-serve/"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz
	http://github.com/downloads/JNRowe/misc-overlay/${P}-gitweb_1.6.4.4_update.patch.bz2"

LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-vcs/git"

src_prepare() {
	# See bug a7b
	epatch "${WORKDIR}"/${P}-gitweb_1.6.4.4_update.patch
}

src_install() {
	distutils_src_install

	module_script_wrapper
}
