# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Python code checking using pep8 and pyflakes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

# tests are unfortunately broken in this release, and this package is already
# enough of a mess that fixing it isn't worth the grief
RESTRICT="test"

# tl;dr This package is masked on genesis, because it bundles libs
#
# Unfortunately, this package bundles slightly modified versions of pep8 and
# pyflakes.  Stripping the bundling and monkey patching in the changes will be
# a huge maintenance burden, so we'll try to live with it for the time being as
# this package never hits a deploy platform.

# setuptools is an optional dependency for setup.py, but favour reproducibilty
# as installation varies when it is available.
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}"

DOCS=(CONTRIBUTORS.txt README)
