# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_{5,6,7},3_{1,2,3}})

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
