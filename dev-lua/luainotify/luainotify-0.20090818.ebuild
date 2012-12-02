# Copyright © 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib toolchain-funcs versionator

MY_P=${PN}-$(get_version_component_range 2)

DESCRIPTION="a Lua interface to the Linux inotify subsystem"
HOMEPAGE="http://www3.telus.net/taj_khattra/${PN}.html"
SRC_URI="http://www3.telus.net/taj_khattra/${PN}/${MY_P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/lua"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i -e 1,3d -e 4aCFLAGS+=-fpic Makefile
}

src_compile() {
	make CC="$(tc-getCC)" || die "emake failed"
}

src_install() {
	dodoc DOC README
	insinto /usr/$(get_libdir)/lua/5.1
	insopts -m755
	doins inotify.so
}
