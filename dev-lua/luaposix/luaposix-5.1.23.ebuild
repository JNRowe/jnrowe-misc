# Copyright © 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit multilib

DESCRIPTION="POSIX function support library for lua"
HOMEPAGE="http://wiki.alpinelinux.org/wiki/Luaposix"
SRC_URI="mirror://github/${PN}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}
	dev-lua/LuaBitOp"

# Tests are broken, and have unpackaged dependencies
RESTRICT="test"

src_configure() {
	# Have to override datadir and libdir here as package doesn't
	# correctly use package dirs
	econf --libdir=/usr/$(get_libdir)/lua/5.1/ \
		--datadir=/usr/share/lua/5.1 \
		--docdir=/usr/share/doc/${PF}/html
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS ChangeLog README
}
