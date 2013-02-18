# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_{5,6,7},3_{1,2,3}})

inherit python-r1

DESCRIPTION="A virtual for the Python argparse module"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Two targets is probably the limit before a loop is cleaner…
RDEPEND="python_targets_python2_5? (
		dev-python/importlib[python_targets_python2_5]
	)
	python_targets_python2_6? (
		dev-python/importlib[python_targets_python2_6]
	)"
