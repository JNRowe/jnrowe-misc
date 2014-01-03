# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Retrieve statistics and generate reports from source code repositories"
HOMEPAGE="http://scm-pepper.sourceforge.net/"
SRC_URI="mirror://sourceforge/scm-pepper/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc git +gnuplot mercurial"

RDEPEND="dev-lang/lua
	git? ( dev-vcs/git )
	gnuplot? ( sci-visualization/gnuplot )
	mercurial? ( dev-vcs/mercurial )"
DEPEND="${RDEPEND}
	doc? (
		app-text/asciidoc
		app-text/xmlto
	)"

# Tests are currently broken
RESTRICT="test"

DOCS=(AUTHORS ChangeLog README)

src_configure() {
	# svn support is disabled, as I can't test it.
	econf \
		$(use_enable git) \
		$(use_enable mercurial) \
		--disable-svn \
		$(use_enable gnuplot)
}
