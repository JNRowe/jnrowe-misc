# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

case "${EAPI:-0}" in
	0|1|2|3) ;;
	*) die "EAPI=${EAPI} is not supported" ;;
esac

# @ECLASS: jnrowe-pypi.eclass
# @MAINTAINER:
# jnrowe@gmail.com
# @AUTHOR:
# jnrowe@gmail.com
# @BLURB: Simplify ebuilds for pypi hosted packages
# @DESCRIPTION:
# This eclass is a simple wrapper around the distutils eclass, to remove some of
# the boilerplate necessary for ebuilds for packages on PyPI.

HOMEPAGE="http://pypi.python.org/pypi/${MY_PN:-${PN}}/"

# @VARIABLE: PYPI_ARCHIVE_SUFFIX
# @DESCRIPTION:
# Archive suffix for package source, defaults to "tar.gz".
# Can be redefined.
: ${PYPI_ARCHIVE_SUFFIX:=tar.gz}

# Unfortunately, you can't use ${MY_PN::1:-${PN::1}} [without switching to zsh ;)]
_PYPI_PN=${MY_PN:-${PN}}
_PYPI_P=${MY_P:-${_PYPI_PN}-${MY_PV:-${PV}}}
SRC_URI="mirror://pypi/${_PYPI_PN::1}/${_PYPI_PN}/${_PYPI_P}.${PYPI_ARCHIVE_SUFFIX}"

# Override S for PN mangling.
S="${WORKDIR}"/${_PYPI_P}
