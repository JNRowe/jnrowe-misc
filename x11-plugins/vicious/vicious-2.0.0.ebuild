# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="vicious widgets for the awesome window manager"
HOMEPAGE="http://awesome.naquadah.org/wiki/Vicious"
SRC_URI="http://git.sysphere.org/${PN}/snapshot/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa curl hddtemp wifi"

DEPEND=""
RDEPEND=">=x11-wm/awesome-3.4_rc1
	alsa? ( media-sound/alsa-utils )
	curl? ( net-misc/curl )
	hddtemp? ( app-admin/hddtemp )
	wifi? ( net-wireless/wireless-tools )"

src_prepare() {
	scrub() {
		# Disable widgets if USE flags not set
		local use=$1
		use ${use} && return
		local widgets=(${@:1})
		einfo "${use} USE flag not enabled, disabling widgets: ${widgets}"
		for widget in ${widgets}; do
			sed -i '/\.widgets\.'${widget}'"/d' widgets/init.lua
			rm -f widgets/${widget}.lua
		done
	}
	scrub alsa volume
	scrub curl gmail hddtemp mpd weather
	scrub hddtemp hddtemp
	scrub wifi wifi
}

src_install() {
	dodoc CHANGES README

	insinto /usr/share/awesome/lib/${PN}
	doins *.lua
	cd widgets
	insinto /usr/share/awesome/lib/${PN}/widgets
	doins *.lua
}
