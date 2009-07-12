# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit bash-completion ruby

DESCRIPTION="A simple, light-weight distributed issue tracker designed for dVCS"
HOMEPAGE="http://ditz.rubyforge.org"
SRC_URI="mirror://rubyforge/${PN}/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE=""

DEPEND=""
RDEPEND="dev-ruby/trollop"

USE_RUBY="ruby18"

src_install() {
	ruby setup.rb install --prefix="${D}" || die
	find . -name trollop.rb -exec rm {} \;
	dodoc Changelog PLUGINS.txt README.txt ReleaseNotes

	dobashcompletion contrib/completion/${PN}.bash ${PN}
}
