# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_5 python2_6 python2_7 python3_1 python3_2 python3_3"

inherit jnrowe-pypi

DESCRIPTION="Python binding for the Sundown Markdown parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/sphinx )"
RDEPEND=""

# Include the benchmarking suite's test file, as it is a useful doc for writing
# Markdown
DOCS=(THANKS benchmark/markdown-syntax.md)

# TODO: Support installing docs, requires jekyll for HTML versions
