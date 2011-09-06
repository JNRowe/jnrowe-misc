# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit vim-plugin

DESCRIPTION="vim plugin: RoR - easy file navigation, enhanced syntax highlighting"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=1567"
SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=16429 -> ${P}.zip"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

VIM_PLUGIN_HELPFILES="${PN}"

S="${WORKDIR}"
