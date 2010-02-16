# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils versionator

BASE_PV=$(get_version_component_range -3)
BASE_P=${PN}-$(replace_version_separator 3 "-")
BASE_URI=http://wingware.com/pub/${PN}/${BASE_PV}/
DESCRIPTION="Proprietary binary-only Python IDE, 'professional' edition"
HOMEPAGE="http://www.wingware.com/wingide"
SRC_URI="${BASE_URI}/${BASE_P}-x86_64-linux.tar.gz"
LICENSE="wingide"
SLOT="0"
KEYWORDS="-* ~amd64"

IUSE=""

RESTRICT="bindist mirror strip"

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
	x11-libs/gtk+:2
	x11-libs/libXinerama"

QA_EXECSTACK="opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_ctypes.so"
QA_DT_HASH="/opt/wingide/bin/2.0/src/debug/tserver/tdbgtracer20.so
	/opt/wingide/bin/2.0/src/debug/tserver/tdbgtracer20pydebug.so
	/opt/wingide/bin/2.1/src/debug/tserver/tdbgtracer21.so
	/opt/wingide/bin/2.1/src/debug/tserver/tdbgtracer21pydebug.so
	/opt/wingide/bin/2.2/src/debug/tserver/tdbgtracer22.so
	/opt/wingide/bin/2.2/src/debug/tserver/tdbgtracer22pydebug.so
	/opt/wingide/bin/2.3/src/debug/tserver/tdbgtracer23pydebug.so
	/opt/wingide/bin/2.3/src/debug/tserver/tdbgtracer23.so
	/opt/wingide/bin/2.4/src/debug/tserver/tdbgtracer24pydebugstackless.so
	/opt/wingide/bin/2.4/src/debug/tserver/tdbgtracer24.so
	/opt/wingide/bin/2.4/src/debug/tserver/tdbgtracer24stackless.so
	/opt/wingide/bin/2.4/src/debug/tserver/tdbgtracer24pydebug.so
	/opt/wingide/bin/2.5/src/wingutils/posixmisc.so
	/opt/wingide/bin/2.5/src/wingutils/pyvalwriter.so
	/opt/wingide/bin/2.5/src/wingutils/statops.so
	/opt/wingide/bin/2.5/src/wingutils/destroyableops.so
	/opt/wingide/bin/2.5/src/wingutils/searchopts.so
	/opt/wingide/bin/2.5/src/debug/tserver/tdbgtracer25.so
	/opt/wingide/bin/2.5/src/debug/tserver/tdbgtracer25pydebugstackless.so
	/opt/wingide/bin/2.5/src/debug/tserver/tdbgtracer25pydebug.so
	/opt/wingide/bin/2.5/src/debug/tserver/tdbgtracer25stackless.so
	/opt/wingide/bin/2.5/src/pysource/pysource_impl.so
	/opt/wingide/bin/2.5/src/process/ctlutil.so
	/opt/wingide/bin/2.5/src/profile/tracer_impl.so
	/opt/wingide/bin/2.5/opensource/parsetools/logicalline.so
	/opt/wingide/bin/2.5/external/pyscintilla2/_scintilla.so
	/opt/wingide/bin/2.5/external/pygtk/gtk/_gtk.so
	/opt/wingide/bin/2.5/external/pygtk/pango.so
	/opt/wingide/bin/2.5/external/pygtk/atk.so
	/opt/wingide/bin/2.5/external/pygtk/gobject.so
	/opt/wingide/bin/2.5/external/pysqlite/pysqlite2/_sqlite.so
	/opt/wingide/bin/2.6/src/debug/tserver/tdbgtracer26stackless.so
	/opt/wingide/bin/2.6/src/debug/tserver/tdbgtracer26.so
	/opt/wingide/bin/2.6/src/debug/tserver/tdbgtracer26pydebug.so
	/opt/wingide/bin/2.6/src/debug/tserver/tdbgtracer26pydebugstackless.so
	/opt/wingide/bin/3.0/src/debug/tserver/tdbgtracer30.so
	/opt/wingide/bin/3.0/src/debug/tserver/tdbgtracer30stackless.so
	/opt/wingide/bin/3.0/src/debug/tserver/tdbgtracer30pydebug.so
	/opt/wingide/bin/3.0/src/debug/tserver/tdbgtracer30pydebugstackless.so
	/opt/wingide/bin/3.1/src/debug/tserver/tdbgtracer31.so
	/opt/wingide/bin/3.1/src/debug/tserver/tdbgtracer31pydebugstackless.so
	/opt/wingide/bin/3.1/src/debug/tserver/tdbgtracer31stackless.so
	/opt/wingide/bin/3.1/src/debug/tserver/tdbgtracer31pydebug.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/cStringIO.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_ctypes.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/parser.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_functools.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/select.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_weakref.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/collections.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/resource.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/unicodedata.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_heapq.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_struct.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/math.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/cPickle.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/zlib.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_md5.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/time.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/datetime.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/bz2.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/mmap.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_random.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_sha.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/grp.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/fcntl.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/termios.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_hotshot.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_sha256.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_sha512.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_locale.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/array.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_elementtree.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_bisect.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/binascii.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/pyexpat.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/_socket.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/strop.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/itertools.so
	/opt/wingide/bin/PyCore/lib/python2.5/lib-dynload/operator.so
	/opt/wingide/bin/PyCore/python"

S="${WORKDIR}/${BASE_P}-x86_64-linux"

src_prepare() {
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
	patch -p1 -i "${FILESDIR}"/${PN}-3.2.0.1-use_system_gtk.patch \
		"${D}"/opt/${PN}/wing \
		|| die "Patching run-wing failed"

	local ver_str=$(get_version_component_range -2)
	make_desktop_entry /usr/bin/wing "Wing IDE Professional ${ver_str}" \
		/opt/${PN}/resources/wing32.png
}
