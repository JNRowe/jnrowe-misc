# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
# 2.5 is restricted due to collections.namedtuple use
# 3.x is restricted due to non-relative imports
PYPI_OLD_DISTUTILS_NG=1
PYTHON_COMPAT="python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Grep GnuPG-encrypted YAML password safe"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for entry points usage
RDEPEND="${DEPEND}
	dev-python/pyyaml
	dev-python/termcolor
	dev-python/xerox"

src_install() {
	jnrowe-pypi_src_install

	# Duplicate of README.rst
	rm "${D}"/usr/share/doc/${PF}/README.txt
}
