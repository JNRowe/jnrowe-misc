# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit eutils versionator

BASE_PV=$(get_version_component_range -3)
MY_P=${PN}-$(replace_version_separator 3 "-")-i386-linux

DESCRIPTION="Proprietary binary-only Python IDE, 'professional' edition"
HOMEPAGE="http://www.wingware.com/wingide"
SRC_URI="http://wingware.com/pub/${PN}/${BASE_PV}/${MY_P}.tar.gz
	http://wingware.com/pub/${PN}/${BASE_PV}/patches/html-lexer-crash-${BASE_PV}p1-all.tar"
LICENSE="wingide"
SLOT="0"
KEYWORDS="-* x86"

IUSE=""

RESTRICT="bindist mirror strip"

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
	x11-libs/gtk+:2"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	unpack ${A}; cd "${S}"

	# Fix path information in output, so users aren't confused
	sed -i '590s/bin_dir/&[len(build_root):]/' wing-install.py
}

src_install() {
	local instloc=${D}/opt/${PN}
	./wing-install.py --rpm-build-root "${D}" --winghome ${instloc} \
		--bin-dir "${D}"/usr/bin
	# Remove all traces of the standard package GTK+, as it is old,
	# unpatched for security issues and missing locale data.
	# Maybe there is some value to keeping some of the themes, but users can
	# install their own themes if they really want them.
	rm -rf ${instloc}/bin/gtk-bin
	# Remove {,un}install data and scripts
	rm -rf ${instloc}/{build-files,file-list.txt,wing-uninstall}

	pushd ..
	treecopy patches ${instloc}
	popd

	# Shouldn't be done during src_install, but binary installation
	# procedure is too dirty to do it earlier
	patch -i "${FILESDIR}"/${P}-use_system_gtk.patch "${D}"/opt/${PN}/wing

	make_desktop_entry /usr/bin/wing$(get_version_component_range -2) \
		"Wing IDE" /opt/${PN}/resources/wing-gnome-icon.png
}

pkg_postinst() {
	einfo "Unless somebody steps up to maintain the wingide ebuild for x86 soon,"
	einfo "the x86 keyword may unfortunately have to be dropped in a future"
	einfo "version."
}
