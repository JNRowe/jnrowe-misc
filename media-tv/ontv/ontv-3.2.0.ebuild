# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2:2.5"
GCONF_DEBUG="no"

inherit distutils gnome2

DESCRIPTION="GNOME Applet for monitoring current and upcoming TV programs"
HOMEPAGE="http://live.gnome.org/OnTV"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE="+xmltv"

COMMON_DEPEND="dev-python/gnome-python
	dev-python/pygtk
	dev-python/notify-python
	gnome-base/gconf
	x11-libs/vte[python]"
RDEPEND="${COMMON_DEPEND}
	dev-python/dbus-python
	xmltv? ( media-tv/xmltv )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	dev-util/pkgconfig"

DOCS="AUTHORS ChangeLog FAQ HACKING NEWS README THANKS TODO"

src_prepare() {
	gnome2_src_prepare

	# No bytecode compilation
	rm py-compile
	ln -s $(type -P true) py-compile

	python_convert_shebangs $(python_get_version) bin/ontv{{-applet,}.in,-dbus}
}

pkg_postinst() {
	gnome2_pkg_postinst
	distutils_pkg_postinst
	if ! use xmltv; then
		ewarn "You must enable USE=xmltv if you wish to download TV listings!"
	fi
}

pkg_postrm() {
	gnome2_pkg_postrm
	distutils_pkg_postrm
}
