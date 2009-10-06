# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils git

EGIT_REPO_URI="git://github.com/rlisagor/freshen.git"

DESCRIPTION="Clone of the Cucumber BDD framework for Python"
HOMEPAGE="http://github.com/rlisagor/freshen"
SRC_URI=""

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND="dev-python/setuptools"
# setuptools is required for RDEPEND as it provides a plugin for nose.
RDEPEND="dev-python/nose
	dev-python/pyparsing
	dev-python/setuptools"

DOCS="todo.txt"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
