# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit jnrowe-pypi

DESCRIPTION="A viewer for ReStructuredText documents that renders them on the fly"
HOMEPAGE="http://mg.pov.lt/restview/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="pygments"

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for wrapper scripts.
RDEPEND="${DEPEND}
	dev-python/docutils
	pygments? ( dev-python/pygments )"

RESTRICT_PYTHON_ABIS="3.*"

src_test() {
	testing() {
		"$(PYTHON)" test.py || die "test.py failed"
	}
	python_execute_function testing
}
