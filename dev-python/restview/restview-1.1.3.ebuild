# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit jnrowe-pypi

DESCRIPTION="A viewer for ReStructuredText documents that renders them on the fly"
HOMEPAGE="http://mg.pov.lt/restview/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="pygments"

DEPEND="dev-python/setuptools"
RDEPEND="dev-python/docutils
	pygments? ( dev-python/pygments )"

src_install() {
	distutils_src_install

	module_script_wrapper "${PN}" "${PN}.restviewhttp"
}
