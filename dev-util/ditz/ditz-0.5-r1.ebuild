# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit bash-completion ruby

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://gitorious.org/ditz/mainline.git"
	EGIT_BRANCH="master"
	inherit git
	SRC_URI=""
else
	SRC_URI="mirror://rubyforge/${PN}/${P}.tgz"
fi

DESCRIPTION="A simple, light-weight distributed issue tracker designed for dVCS"
HOMEPAGE="http://ditz.rubyforge.org"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="zsh-completion"

DEPEND=""
RDEPEND="dev-ruby/trollop"

USE_RUBY="ruby18"

src_install() {
	${RUBY} setup.rb config --prefix=/usr --mandir=/usr/share/man/man1 \
		|| die "setup.rb config failed"
	${RUBY} setup.rb install --prefix="${D}" \
		|| die "setup.rb install failed"
	find "${D}" -name trollop.rb -exec rm {} \;
	dodoc Changelog PLUGINS.txt README.txt ReleaseNotes || die "dodoc failed"

	dobashcompletion contrib/completion/${PN}.bash ${PN}
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins contrib/completion/_ditz.zsh _ditz || die "newins failed"
	fi
}
