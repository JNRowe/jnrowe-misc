# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
PYTHON_DEPEND="*"

inherit jnrowe-pypi

DESCRIPTION="A Given/When/Then BDD stories parser"
HOMEPAGE="http://github.com/hugobr/story_parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools
	test? ( dev-python/should_dsl )"
RDEPEND=""

src_prepare() {
	ln -s src ${PN}
	sed -i 's,@python src/,@cd src; PYTHONPATH=$(shell pwd) python ,' Makefile
}
