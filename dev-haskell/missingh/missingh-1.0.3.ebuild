# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

EAPI="2"
CABAL_FEATURES="lib profile haddock"

inherit haskell-cabal eutils

MY_PN="MissingH"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Collection of Haskell-related utilities"
HOMEPAGE="http://software.complete.org/missingh"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2" # mixed licence, all GPL compatible
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="0"

DEPEND=">=dev-lang/ghc-6.6.1
	>=dev-haskell/cabal-1.2
	dev-haskell/filepath
	dev-haskell/hslogger
	dev-haskell/hunit
	dev-haskell/mtl
	dev-haskell/network
	dev-haskell/parsec
	=dev-haskell/quickcheck-1*
	dev-haskell/regex-compat"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed -e 's/Library/Library\n  Build-Depends: base < 4/' \
	  -i "${MY_PN}.cabal"

	# type definitions cannot have haddock comments
	epatch "${FILESDIR}/${P}-haddock.patch"
}
