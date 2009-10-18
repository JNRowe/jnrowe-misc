# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit eutils versionator

BASE_PV=$(get_version_component_range -3)
BASE_P=${PN}-$(replace_version_separator 3 "-")
BASE_URI=http://wingware.com/pub/${PN}/${BASE_PV}/
DESCRIPTION="Proprietary binary-only Python IDE, 'professional' edition"
HOMEPAGE="http://www.wingware.com/wingide"
SRC_URI="x86? ( ${BASE_URI}/${BASE_P}-i386-linux.tar.gz )
	amd64? ( ${BASE_URI}/${BASE_P}-x86_64-linux.tar.gz )"
LICENSE="wingide"
SLOT="0"
KEYWORDS="-* amd64 x86"

IUSE=""

RESTRICT="bindist mirror strip"

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
	x11-libs/gtk+:2"

QA_EXECSTACK="opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_ctypes.so"

if use x86; then
	S="${WORKDIR}/${BASE_P}-i386-linux"
elif use amd64; then
	S="${WORKDIR}/${BASE_P}-x86_64-linux"
fi

src_unpack() {
	unpack ${A}; cd "${S}"

	# Fix path information in output, so users aren't confused
	sed -i '618s/bin_dir/&[len(build_root):]/' wing-install.py
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

	# Must be uncommented when upstream patches are to be applied
	#pushd ..
	#treecopy patches ${instloc}
	#popd

	# Shouldn't be done during src_install, but binary installation
	# procedure is too dirty to do it earlier
	patch -p1 -i "${FILESDIR}"/${P}-use_system_gtk.patch "${D}"/opt/${PN}/wing \
		|| die "Patching run-wing failed"

	local ver_str=$(get_version_component_range -2)
	make_desktop_entry /usr/bin/wing${ver_str} \
		"Wing IDE Professional ${ver_str}"  /opt/${PN}/resources/wing32.png
}

pkg_postinst() {
	if use x86; then
		einfo "Unless somebody steps up to maintain the wingide ebuild for x86 soon,"
		einfo "the x86 keyword may unfortunately have to be dropped in a future"
		einfo "version."
	fi
}
