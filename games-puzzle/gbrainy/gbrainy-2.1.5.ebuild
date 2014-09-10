# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils games

DESCRIPTION="Brain teaser game/trainer to have fun and keep your brain trained"
HOMEPAGE="http://live.gnome.org/${PN}"
SRC_URI="http://gent.softcatala.org/jmas/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="plugins"

RDEPEND="dev-dotnet/gtk-sharp
	plugins? ( dev-dotnet/mono-addins )"
DEPEND="${RDEPEND}
	app-text/gnome-doc-utils
	dev-util/intltool
	virtual/pkgconfig"

# Tests are broken in the current release
RESTRICT="test"

DOCS=(AUTHORS MAINTAINERS NEWS README)

src_configure() {
	econf $(use_enable plugins addins)
}

src_test() {
	pushd tests >/dev/null
	emake run || die "emake run failed"
	popd >/dev/null
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	rm "${D}"usr/bin/${PN} || die "Deleting wrapper failed"
	dogamesbin src/Clients/Classical/gbrainy || die "Installing wrapper failed"

	einstalldocs

	prepgamesdirs
}
