# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})
GCONF_DEBUG="no"
GNOME_TARBALL_SUFFIX="bz2"

inherit python-single-r1 gnome2

DESCRIPTION="GNOME Applet for monitoring current and upcoming TV programs"
HOMEPAGE="http://live.gnome.org/OnTV"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+xmltv"

COMMON_DEPEND="dev-python/gnome-applets-python
	dev-python/notify-python[${PYTHON_USEDEP}]
	gnome-base/gconf
	x11-libs/vte[python]
	${PYTHON_DEPS}"
RDEPEND="${COMMON_DEPEND}
	dev-python/dbus-python[${PYTHON_USEDEP}]
	xmltv? ( media-tv/xmltv )"
DEPEND="${COMMON_DEPEND}
	dev-util/intltool
	virtual/pkgconfig"

DOCS=(AUTHORS ChangeLog FAQ HACKING NEWS README THANKS TODO)

src_prepare() {
	gnome2_src_prepare

	# No bytecode compilation
	rm py-compile
	ln -s $(type -P true) py-compile
}

pkg_postinst() {
	gnome2_pkg_postinst

	if ! use xmltv; then
		ewarn "You must enable USE=xmltv if you wish to download TV listings!"
	fi
}
