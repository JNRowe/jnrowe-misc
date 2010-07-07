# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="2"

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="Podcast Aggregator (downloader)"
HOMEPAGE="http://software.complete.org/hpodder"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/ghc-6.4.2
	>=dev-haskell/network-2.2.0.1
	>=dev-haskell/missingh-1.0
	>=dev-haskell/hdbc-sqlite-1.1.0
	dev-haskell/mtl
	>=dev-haskell/haxml-1.13.2
	dev-haskell/hslogger
	dev-haskell/configfile"

RDEPEND="dev-db/sqlite:3
	media-sound/id3v2
	net-misc/curl"
