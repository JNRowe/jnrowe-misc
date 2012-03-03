# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND="2"

inherit base eutils python

DESCRIPTION="Utilities to find file system lint(duplicate files, empty dirs, etc)"
HOMEPAGE="http://www.pixelbeat.org/fslint/"
SRC_URI="http://www.pixelbeat.org/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls"

DEPEND="nls? ( sys-devel/gettext )"
RDEPEND="dev-python/pygtk"

PATCHES=("${FILESDIR}"/${P}-install_locations.patch)

src_prepare() {
	base_src_prepare

	# This is only valid with upstream's python.eclass, be careful when merging
	# branches!  Perhaps one day we won't have to deal with the nastiness of
	# upstream's python.eclass
	python_convert_shebangs -- 2 ${PN}-gui ${PN}/fstool/dupwaste \
		${PN}/supprt/rmlint/{fixdup,merge_hardlinks}
}

src_compile() {
	use nls && make -C po
}

src_install() {
	dobin ${PN}-gui
	dodoc doc/*
	doman man/*

	domenu ${PN}.desktop
	doicon ${PN}_icon.png

	insinto /usr/share/${PN}
	doins ${PN}.glade

	cp -R ${PN} "${D}"/usr/share/${PN} || die "Copying scripts failed"

	use nls && emake DESTDIR="${D}" -C po install
}
