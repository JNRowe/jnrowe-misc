# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
# 3.x is restricted due to print syntax
RESTRICT_PYTHON_ABIS="3.*"

inherit jnrowe-pypi

DESCRIPTION="Network library using greenlet and libevent for scalable concurrency"
HOMEPAGE="http://gevent.org/"

LICENSE="BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

RDEPEND="dev-python/greenlet
	dev-python/pyopenssl
	dev-libs/libevent"
# setuptools is an optional dependency for setup.py, but favour reproducibilty.
DEPEND="${RDEPEND}
	dev-python/setuptools
	doc? ( dev-python/sphinx )"

# Tests are broken in current release, be careful with dependencies if
# this is removed(fex sqlite)
RESTRICT="test"

DOCS="changelog.rst"

src_compile() {
	distutils_src_compile

	if use doc; then
		pushd doc >/dev/null
		emake html || die "emake html failed"
		popd >/dev/null
	fi
}

src_test() {
	testing() {
		export PYTHONPATH=$(ls -d "${S}"/build-${PYTHON_ABI}/lib.*)
		pushd greentest >/dev/null
		$(PYTHON) testrunner.py || die "testrunner.py failed"
		popd >/dev/null
	}
	python_execute_function testing
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r -A inv doc/_build/html/* || die "dohtml failed"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r examples/* || die "doins failed"
	fi
}
