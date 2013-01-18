# Copyright © 2009, 2010, 2011, 2012  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby18"

inherit bash-completion-r1 ruby-ng

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="git://gitorious.org/ditz/mainline.git
		https://git.gitorious.org/ditz/mainline.git"
	EGIT_PROJECT=${PN}
	EGIT_BRANCH="master"
	inherit git-2
	SRC_URI=""
else
	SRC_URI="mirror://rubyforge/${PN}/${P}.tgz"
fi

DESCRIPTION="A simple, light-weight distributed issue tracker designed for dVCS"
HOMEPAGE="http://${PN}.rubyforge.org"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-ruby/trollop"

each_ruby_install() {
	${RUBY} setup.rb config --prefix=/usr --mandir=/usr/share/man/man1 \
		|| die "setup.rb config failed"
	${RUBY} setup.rb install --prefix="${D}" \
		|| die "setup.rb install failed"
	find "${D}" -name trollop.rb -exec rm {} \;
}

src_install() {
	ruby-ng_src_install

	pushd "${WORKDIR}"/all/${P} >/dev/null
	dodoc Changelog PLUGINS.txt README.txt ReleaseNotes

	newbashcomp contrib/completion/${PN}.bash ${PN}
	insinto /usr/share/zsh/site-functions
	newins contrib/completion/_ditz.zsh _ditz
	popd >/dev/null
}
