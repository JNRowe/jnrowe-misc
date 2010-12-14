# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit gnome2-utils

DESCRIPTION="Icons for Notify-OSD in Ubuntu style"
HOMEPAGE="http://packages.ubuntu.com/notify-osd-icons"
SRC_URI="mirror://ubuntu/pool/main/${PN::1}/${PN}/${PN}_${PV}.tar.gz"

LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="png-icons"

DEPEND="gnome-base/librsvg
	png-icons? ( media-gfx/optipng )"
RDEPEND="x11-themes/gnome-icon-theme"

S="${WORKDIR}"/${PN}

pkg_setup() {
	export ICON_SIZES="8 16 22 24 32 48 256"
}

src_compile() {
	local bdir files target link_dest i file

	# Build a list of icon files, symlinks and all.  Zsh would make this whole
	# mess much nicer.
	pushd scalable/ >/dev/null
	files=$(ls -1 status/*)
	popd >/dev/null

	if use png-icons; then
		for i in ${ICON_SIZES}; do
			einfo "Building ${i}x${i} icons "
			bdir=${i}x${i}
			mkdir -p ${bdir}/status
			for file in ${files}; do
				target=${bdir}/${file/%.svg/.png}
				if [ -L scalable/${file} ]; then
					link_dest=$(readlink scalable/${file})
					ln -s "${link_dest/%.svg/.png}" ${target}
				else
					rsvg -w $i -h $i scalable/${file} ${target}
					# optipng -o7 ${target}
				fi
			done
		done
	fi
}

src_install() {
	local i icon_dir=/usr/share/icons/gnome

	dodoc AUTHORS debian/changelog || die "dodoc failed"

	dodir ${icon_dir}
	cp -a scalable "${D}"${icon_dir} || die "cp scalable failed"
	if use png-icons; then
		for i in ${ICON_SIZES}; do
			cp -a ${i}x${i}/ "${D}"${icon_dir} || die "cp ${i}x${i} failed"
		done
	fi
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
