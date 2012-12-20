# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_{5,6,7},3_{1,2,3}})

inherit jnrowe-pypi

DESCRIPTION="Declarative dictionary-based model classes for Python"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

DEPEND=""
RDEPEND=""

DOCS=(README.md)
