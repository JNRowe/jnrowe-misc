# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

#
# Original Author: James Rowe <jnrowe@gmail.com>
# Purpose: To remove duplication in packages that are hosted on pypi
#

HOMEPAGE="http://pypi.python.org/pypi/${PN}/"
SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.tar.gz"

