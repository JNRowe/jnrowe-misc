# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_{5..7},3_{1..3}})

inherit jnrowe-pypi

DESCRIPTION="Python Port of John Gruber's titlecase.pl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

python_prepare() {
	# Remove ez_setup automagic
	sed -i '/use_setuptools/d' setup.py

	if [[ ${EPYTHON} == python3.* ]]; then
		2to3 -w ${PN}/tests.py
	fi
}

python_test() {
	nosetests || die
}
