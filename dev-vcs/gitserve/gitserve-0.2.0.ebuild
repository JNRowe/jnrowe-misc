# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"

inherit eutils jnrowe-pypi

DESCRIPTION="A helper tool for git that mimics mercurial's serve command"
HOMEPAGE="http://github.com/jezdez/git-serve/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="dev-vcs/git"

src_install() {
	distutils_src_install

	module_script_wrapper
}
