# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git-2 portability

EGIT_REPO_URI="git://git.mercenariesguild.net/${PN}.git"

DESCRIPTION="A set of widgets for x11-wm/awesome that provide helpful information."
HOMEPAGE="http://awesome.naquadah.org/wiki/Obvious"
SRC_URI=""

# BSD is just for obvious/lib/mpd/init.lua
LICENSE="MIT BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
# All these tools are needed because initialisation fails without them
# regardless of the module being used
RDEPEND="dev-lua/luasocket
	media-sound/alsa-utils
	sys-power/acpi
	x11-wm/awesome"

src_install() {
	local modules="basic_mpd battery clock cpu fs_usage io lib mem net \
		popup_run_prompt volume_alsa wlan"
	treecopy ${modules} init.lua  "${D}"/usr/share/awesome/lib/${PN}
	find "${D}"/usr/share/awesome/lib/${PN} -name readme | xargs rm
	dodoc AUTHORS CONTRIBUTING.md TODO || die "dodoc failed"
	for module in ${modules}; do
		if [ -f ${module}/readme ]; then
			newdoc ${module}/readme readme.${module} \
				|| die "dodoc ${module} failed"
		fi
	done
}
