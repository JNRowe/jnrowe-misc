# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="2"

inherit git

EGIT_REPO_URI="git://git.savannah.gnu.org/${PN}.git"

DESCRIPTION="Manage installation of software in via symlinks"
HOMEPAGE="http://savannah.gnu.org/projects/stow/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="test"

DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Output
		dev-perl/Sub-Exporter
	)"
RDEPEND="dev-lang/perl"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
