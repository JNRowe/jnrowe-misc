# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/surfraw/surfraw-2.2.7.ebuild,v 1.7 2011/01/25 17:57:13 darkside Exp $

EAPI="3"

inherit autotools base bash-completion eutils git-2

EGIT_REPO_URI="git://git.debian.org/surfraw/surfraw.git"

DESCRIPTION="A fast unix command line interface to WWW"
HOMEPAGE="http://surfraw.alioth.debian.org/"
SRC_URI=""

SLOT="0"
LICENSE="public-domain"
KEYWORDS=""
IUSE=""
RESTRICT="test"

src_prepare() {
	epatch "${FILESDIR}"/${P}-gentoo_pkg_tools.patch
	# Man page symlinks shouldn't link to compressed files
	sed -i 's,\.gz,,g' links.IN

	eautoreconf
}

src_configure() {
	econf \
		--with-elvidir='$(datadir)'/surfraw \
		--disable-opensearch
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog HACKING NEWS README TODO

	dobashcompletion surfraw-bash-completion

	docinto examples
	dodoc examples/README
	insinto /usr/share/doc/${PF}/examples
	doins examples/uzbl_load_url_from_surfraw
}

pkg_preinst() {
	has_version "=${CATEGORY}/${PN}-1.0.7"
	upgrade_from_1_0_7=$?
}

pkg_postinst() {
	local moves f

	bash-completion_pkg_postinst
	einfo
	einfo "You can get a list of installed elvi by just typing 'surfraw' or"
	einfo "the abbreviated 'sr'."
	einfo
	einfo "You can try some searches, for example:"
	einfo "$ sr ask why is jeeves gay? "
	einfo "$ sr google -results=100 RMS, GNU, which is sinner, which is sin?"
	einfo "$ sr rhyme -method=perfect Julian"
	einfo
	einfo "The system configuration file is /etc/surfraw.conf"
	einfo
	einfo "Users can specify preferences in '~/.surfraw.conf'  e.g."
	einfo "SURFRAW_graphical_browser=mozilla"
	einfo "SURFRAW_text_browser=w3m"
	einfo "SURFRAW_graphical=no"
	einfo
	einfo "surfraw works with any graphical and/or text WWW browser"
	einfo
	if [[ $upgrade_from_1_0_7 = 0 ]] ; then
		ewarn "surfraw usage has changed slightly since version 1.0.7, elvi are now called"
		ewarn "using the 'sr' wrapper script as described above.  If you wish to return to"
		ewarn "the old behaviour you can add /usr/share/surfraw to your \$PATH"
	fi
	# This file was always autogenerated, and is no longer needed.
	if [ -f "${EROOT}"/etc/surfraw_elvi.list ]; then
		rm -f "${EROOT}"/etc/surfraw_elvi.list
	fi

	# Config file location changes in v2.2.6
	for f in /etc/surfraw.{bookmarks,conf}; do
		if [ -f "${EROOT}"${f} ]; then
			ewarn "${f} has moved to /etc/xdg/config/surfraw/${f##*.} in v2.2.6."
			moves=1
		fi
	done
	if [ "${moves}" == 1 ]; then
		ewarn "You must manually move, and update, the config files listed"
		ewarn "above for surfraw v2.2.6 and above to use them."
	fi
}
