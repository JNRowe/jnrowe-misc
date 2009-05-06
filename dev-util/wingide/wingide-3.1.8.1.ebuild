# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit versionator

MY_P=${PN}-$(replace_version_separator 3 "-")-i386-linux

DESCRIPTION="Proprietary binary-only Python IDE, 'professional' edition"
HOMEPAGE="http://www.wingware.com/wingide"
SRC_URI="http://wingware.com/pub/${PN}/$(get_version_component_range -3)/${MY_P}.tar.gz"
LICENSE="wingide"
SLOT="0"
KEYWORDS="-* ~x86"

IUSE=""

RESTRICT="bindist mirror strip"

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
	x11-libs/gtk+:2"

S="${WORKDIR}/${MY_P}"

src_compile() {
	:
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

	# Shouldn't be done during src_install, but binary installation
	# procedure is too dirty to do it earlier
	patch -i "${FILESDIR}"/${P}-use_system_gtk.patch "${D}"/opt/${PN}/wing
}
