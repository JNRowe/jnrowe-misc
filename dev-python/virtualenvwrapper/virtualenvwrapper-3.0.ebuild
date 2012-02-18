# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*:2.6"
# 2.{4,5} is restricted due to 0o octal syntax
RESTRICT_PYTHON_ABIS="2.[45]"

LANGS="en es"

inherit base jnrowe-pypi

DESCRIPTION="Extensions for virtualenv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
for _lang in ${LANGS}; do
	IUSE="${IUSE} linguas_${_lang}"
done

DEPEND="dev-python/setuptools"
# setuptools is required in RDEPEND for plugin functionality.
RDEPEND="${DEPEND}
	dev-python/virtualenv"

PATCHES=("${FILESDIR}"/${PN}-2.6.1-fix_script_location.patch)

# Testsuite is really quite faulty, restrict it until it is fixed
RESTRICT="test"

src_prepare() {
	base_src_prepare
	distutils_src_prepare
}

src_install() {
	distutils_src_install

	for lang in ${LANGS}; do
		has ${lang} ${LINGUAS} || continue
		docinto ${lang}
		dodoc docs/${lang}/*
		docinto html/${lang}
		dohtml -r docs/html/${lang}/
	done
}

pkg_postinst() {
	distutils_pkg_postinst

	# Note: This location is different from upstream's default as installing the
	# script in /usr/bin is a massive FHS violation
	einfo "To enable ${PN}'s shell functions, source"
	einfo "	'/usr/share/${PN}/${PN}.sh'"
	einfo "from your shell's startup files."
}
