# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils eutils

DESCRIPTION="A bugtracker built on distributed revision control"
HOMEPAGE="http://bugseverywhere.org/be/show/HomePage"
# Upstream aren't cutting releases, and the VCS is bzr so a checkout is a no-go
SRC_URI="http://www.jnrowe.ukfsn.org/_static/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc64 x86"
IUSE=""

# This is required because the testsuite hard-codes pathnames to the
# developer's machine.
RESTRICT="test"

DEPEND="dev-lang/python"
#	test? (
#		dev-util/tla
#		dev-util/bzr
#		dev-util/mercurial
#	)
RDEPEND="dev-lang/python"

PYTHON_MODNAME="becommands libbe"

DOCS="README"

src_prepare() {
	epatch "${FILESDIR}"/${P}.patch
	sed -i 12,14d setup.py
}

src_test() {
	${python} test.py
}
