# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PYTHON_USE_WITH=ncurses
inherit distutils

DESCRIPTION="A syntax colouring and autocomplete supporting Python REPL"
HOMEPAGE="http://www.bpython-interpreter.org/"
SRC_URI="${HOMEPAGE}/releases/${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools"
# setuptools is needed at runtime for the wrapper script
RDEPEND="${DEPEND}
	dev-python/pygments"

DOCS="sample.ini"
