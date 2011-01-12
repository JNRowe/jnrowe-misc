# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base git

EGIT_REPO_URI="git://git.savannah.gnu.org/${PN}.git"

DESCRIPTION="Manage installation of software in via symlinks"
HOMEPAGE="http://savannah.gnu.org/projects/stow/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="dev-lang/perl"
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Output
		dev-perl/Sub-Exporter
	)"
