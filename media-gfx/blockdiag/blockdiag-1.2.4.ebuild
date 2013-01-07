# Copyright © 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# 2.5 is required for funcparserlib dependency, 3.x is not supported because of
# print syntax.
# <2.7 is required to ignore the OrderedDict dependency, if you really need
# support for earlier Python version open an issue
PYTHON_COMPAT=(python2_7)

inherit eutils jnrowe-pypi

DESCRIPTION="Generate block-diagram image files from text(like dot)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="examples pdf test"

# dev-python/imaging has to be in DEPEND, because of the automagic
# foolishness that occurs in setup.py
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/imaging"
	#test? (
	#	dev-python/pep8
	#	dev-python/reportlab
	#)
RDEPEND="dev-python/funcparserlib[${PYTHON_USEDEP}]
	dev-python/imaging
	dev-python/webcolors[${PYTHON_USEDEP}]
	pdf? ( dev-python/reportlab )"

DOCS=(src/README.txt src/TODO.txt)

# Some tests are currently broken upstream, and others span the network
# boundary.
RESTRICT="test"

python_test() {
	PYTHONPATH="$PWD/src" nosetests-${PYTHON_ABI} src \
		|| die "nosetests failed"
}

src_install() {
	distutils-r1_src_install

	doman ${PN}.1
	insinto /usr/share/doc/${PF}
	if use examples ; then
		doins -r examples || die "doins failed"
	fi
}
