# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit vim-plugin

DESCRIPTION="vim plugin: a concise script that implements some of Textmate's snippets"
HOMEPAGE="http://code.google.com/p/snipmate/"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=11006 -> ${P}.zip"
LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

VIM_PLUGIN_HELPFILES="snipMate"

S="${WORKDIR}"
