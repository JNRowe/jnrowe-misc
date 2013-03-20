# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{5..7})

inherit base eutils python-single-r1

DESCRIPTION="Utilities to find file system lint(duplicate files, empty dirs, etc)"
HOMEPAGE="http://www.pixelbeat.org/${PN}/"
SRC_URI="http://www.pixelbeat.org/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls"

DEPEND="${PYTHON_DEPS}
	nls? ( sys-devel/gettext )"
RDEPEND="dev-python/pygtk"

PATCHES=("${FILESDIR}"/${P}-install_locations.patch)

src_compile() {
	use nls && make -C po
}

src_install() {
	python_doscript ${PN}-gui
	dodoc doc/*
	doman man/*

	domenu ${PN}.desktop
	doicon ${PN}_icon.png

	insinto /usr/share/${PN}
	doins ${PN}.glade

	cp -R ${PN} "${D}"/usr/share/${PN} || die "Copying scripts failed"

	use nls && emake DESTDIR="${D}" -C po install
}
