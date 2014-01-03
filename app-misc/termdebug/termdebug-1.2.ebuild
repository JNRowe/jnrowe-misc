# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit base toolchain-funcs

DESCRIPTION="Utilities to record and replay a terminal program session"
HOMEPAGE="http://os.ghalkes.nl/${PN}.html"
SRC_URI="http://os.ghalkes.nl/dist/${P}.tgz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/pkgconfig"
RDEPEND=""

PATCHES=("${FILESDIR}"/${P}-manual_doc_install.patch)

DOCS=(Changelog README)

src_configure() {
	# Handmade configure :/
	CC="$(tc-getCC)" ./configure --prefix=/usr || die "configure failed"
}
