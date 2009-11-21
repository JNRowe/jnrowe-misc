# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit versionator

DESCRIPTION="Assorted geany plugins, including version control and lua support"
HOMEPAGE="http://plugins.geany.org/geany-plugins/"
SRC_URI="${HOMEPAGE}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="lua nls spell test"

DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	test? ( dev-libs/check )"
RDEPEND=">=dev-util/geany-$(get_version_component_range 1-2)
	lua? ( dev-lang/lua )
	spell? ( app-text/gtkspell )"

src_configure() {
	econf $(use_enable lua geanylua ) \
		$(use_enable nls) \
		$(use_enable spell gtkspell) \
		$(use_enable spell spellcheck)
}

src_install() {
	local plugins="addons geany{gdb,latex,lipsum,lua,sendmail,vc} shiftcolumn \
		spellcheck"
	emake DESTDIR="${D}" docdir="\${datarootdir}/doc/${PF}" install \
		|| die "emake install failed"
}
