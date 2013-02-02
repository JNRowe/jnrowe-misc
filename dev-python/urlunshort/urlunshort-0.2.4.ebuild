# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{5..7})

inherit jnrowe-pypi

DESCRIPTION="Tools for detecting and expanding shortened URLs"
HOMEPAGE="http://bitbucket.org/runeh/${PN}"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

# tests span network boundaries, and depend on upstream availablility
RESTRICT="test"
