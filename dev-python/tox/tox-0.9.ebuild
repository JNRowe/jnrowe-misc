# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="py.test"
PYTHON_DEPEND="*"
PYPI_ARCHIVE_SUFFIX="zip"

inherit jnrowe-pypi

DESCRIPTION="virtualenv-based automation of test activities"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools
	test? ( >=dev-python/pytest-2.0.0 )"
# Setuptools is needed in RDEPEND, because of entrypoint usage
RDEPEND=">=dev-python/py-1.4.0
	dev-python/setuptools
	dev-python/virtualenv
	dev-python/virtualenv5
	|| ( >=dev-lang/python-2.7 dev-python/argparse )"

# Tests are quite broken, and even if they worked they cross network boundaries
RESTRICT="test"
