# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils git

EGIT_REPO_URI="git://github.com/rlisagor/freshen.git"

DESCRIPTION="Clone of the Cucumber BDD framework for Python"
HOMEPAGE="http://github.com/rlisagor/freshen"
SRC_URI=""

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="examples"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/nose
	dev-python/pyparsing"

DOCS="todo.txt"

src_install() {
	distutils_src_install

	insinto /usr/share/doc/${PF}
	if use examples; then
		doins -r examples
	fi
}
