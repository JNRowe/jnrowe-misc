# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit jnrowe-pypi

DESCRIPTION="Nose plugin to show progress bar and tracebacks during tests"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
# setuptools is required in RDEPEND for entry points
RDEPEND="${DEPEND}
	dev-python/blessings[${PYTHON_USEDEP}]
	dev-python/nose[${PYTHON_USEDEP}]"

# Tests are broken in portage environment
RESTRICT="test"

PYTHON_MODNAME="${PN/-/}"
