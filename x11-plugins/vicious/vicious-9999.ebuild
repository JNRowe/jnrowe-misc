# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="http://git.sysphere.org/${PN}"
	EGIT_BRANCH="master"
	inherit git
	SRC_URI=""
else
	# The upstream tarball is generated with gitweb and its checksum
	# occasionally changes, so we mirror it.
	SRC_URI="https://github.com/downloads/JNRowe/misc-overlay/${P}.tar.gz"

fi

DESCRIPTION="vicious widgets for the awesome window manager"
HOMEPAGE="http://awesome.naquadah.org/wiki/Vicious"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
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
	dodoc CHANGES README || die "dodoc failed"

	insinto /usr/share/awesome/lib/${PN}
	doins *.lua || die "doins *.lua failed"
	cd widgets
	insinto /usr/share/awesome/lib/${PN}/widgets
	doins *.lua || die "doins *.lua in widgets failed"
}
