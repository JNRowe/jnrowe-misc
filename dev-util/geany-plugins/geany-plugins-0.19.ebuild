# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit versionator

DESCRIPTION="Assorted geany plugins, including version control and lua support"
HOMEPAGE="http://plugins.geany.org/geany-plugins/"
SRC_URI="${HOMEPAGE}/${P}.tar.bz2"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gendoc lua nls spell test xml"

RDEPEND=">=dev-util/geany-$(get_version_component_range 1-2)
	gendoc? ( dev-libs/ctpl )
	lua? ( dev-lang/lua )
	spell? ( app-text/gtkspell )
	xml? ( dev-libs/libxml2 )"
DEPEND="${RDEPEND}
	dev-util/intltool
	dev-util/pkgconfig
	test? ( dev-libs/check )"

src_configure() {
	# Workaround broken $LINGUAS handling, the easy(read: nasty) way
	unset LINGUAS
	econf $(use_enable gendoc geanygendoc) \
		$(use_enable lua geanylua ) \
		$(use_enable nls) \
		$(use_enable spell gtkspell) \
		$(use_enable spell spellcheck) \
		$(use_enable xml prettyprinter)
}

src_install() {
	emake DESTDIR="${D}" docdir="\${datarootdir}/doc/${PF}" install \
		|| die "emake install failed"
}
