# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT="python2_5 python2_6 python2_7"

inherit jnrowe-pypi

DESCRIPTION="Twitter library for python"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
# We should depend on dev-python/oauth, and strip the bundled versions but the
# ebuild in the main tree has no support for multiple Python versions.
RDEPEND="dev-python/oauth
	python_targets_python2_5? ( dev-python/simplejson )
	python_targets_python2_6? ( dev-python/simplejson )"

DOCS=(README)

PATCHES=("${FILESDIR}"/${P}-Use_system_oauth.patch)

python_prepare_all() {
	# Remove bundled library
	rm ${PN}/oauth.py
}
