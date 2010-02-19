# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
CABAL_FEATURES="lib profile haddock"

inherit haskell-cabal

MY_PN=ConfigFile
MY_P=${MY_PN}-${PV}

DESCRIPTION="Parser and writer for handling sectioned config files in Haskell."
HOMEPAGE="http://software.complete.org/configfile"
SRC_URI="http://hackage.haskell.org/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"

DEPEND=">=dev-lang/ghc-6.6
	>=dev-haskell/hslogger-1.0.2
	>=dev-haskell/hunit-1.2.0.3
	dev-haskell/mtl
	>=dev-haskell/network-2.2.1
	dev-haskell/parsec
	>=dev-haskell/quickcheck-1.1.0.0
	>=dev-haskell/regex-compat-0.71.0.1
	dev-haskell/missingh"
RDEPEND=""

S="${WORKDIR}/${MY_P}"
