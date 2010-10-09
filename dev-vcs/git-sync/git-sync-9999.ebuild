# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

# Not using perl-module eclass, because it breaks builds on parasys.
inherit git

EGIT_REPO_URI="git://github.com/bestpractical/${PN}.git"

DESCRIPTION="A tool to synchronize multiple git repositories"
HOMEPAGE="http://github.com/bestpractical/git-sync"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="dev-perl/JSON-Any
	dev-perl/libwww-perl
	dev-vcs/git
	virtual/perl-Getopt-Long
	virtual/perl-PodParser
	virtual/perl-Term-ANSIColor"

src_compile() {
	pod2man ${PN} >${PN}.1
}

src_install() {
	dobin ${PN} || die "dobin ${PN} failed"
	doman ${PN}.1 || die "doman ${PN}.1 failed"
}
