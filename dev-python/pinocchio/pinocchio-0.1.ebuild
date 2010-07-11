# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Extensions for the nose testing framework"
HOMEPAGE="http://darcs.idyll.org/~t/projects/pinocchio/doc/"
SRC_URI="http://darcs.idyll.org/~t/projects/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples test"

DEPEND="dev-python/setuptools
	test? ( dev-python/nose )"
RDEPEND="dev-python/nose"

# Tests fail to show usage
RESTRICT="test"

DOCS="IDEAS"

src_test() {
	testing() {
		nosetests examples
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	dodoc doc/ChangeLog doc/*.txt || die "dodoc failed"
	if use doc; then
		dohtml doc/index.html doc/default.css || die "dohtml failed"
	fi
	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r examples
	fi
}
