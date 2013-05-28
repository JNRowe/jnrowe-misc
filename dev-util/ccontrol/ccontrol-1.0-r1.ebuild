# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit eutils multilib python-r1

DESCRIPTION="Utility to manage ccache and distcc"
HOMEPAGE="http://${PN}.ozlabs.org/"
SRC_URI="${HOMEPAGE}/releases/${P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk test"

# Tests are currently restricted due to a problem with valgrind, once this is
# fixed tests will be reenabled.
RESTRICT="test"

DEPEND="app-text/asciidoc
	app-text/xmlto
	test? ( dev-util/valgrind )"
RDEPEND="gtk? (
	${PYTHON_DEPS}
	dev-python/pygtk[${PYTHON_USEDEP}]
)"

src_prepare() {
	epatch "${FILESDIR}"/${P}-build_fixes.patch
}

src_configure() {
	# This can't use econf because it is a hand-hacked shell script.
	./configure --bindir=/usr/bin --libdir=/usr/$(get_libdir)/${PN} \
		--mandir=/usr/share/man \
		$(use test || echo --disable-valgrind) || die "configure failed"
}

src_install() {
	gui_install() {
		python_doscript gui/gccontrol.py
	}

	emake prefix="${D}" install{bin,lib,man}
	if use gtk; then
		emake prefix="${D}" installgui
		python_foreach_impl gui_install
	fi

	dodoc CHANGES README TODO
}
