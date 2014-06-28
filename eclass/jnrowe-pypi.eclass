# Copyright © 2009, 2010, 2011, 2012, 2013, 2014  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

if [[ -z ${__ECLASS_IMPORTED_JNROWE_PYPI} ]]; then
	__ECLASS_IMPORTED_JNROWE_PYPI=1

inherit eutils

if [[ -n ${PYPI_OLD_DISTUTILS} ]]; then
	inherit distutils

	case "${EAPI:-0}" in
		0|1|2|3|4|5) ;;
		*) die "EAPI=${EAPI} is not supported" ;;
	esac
else
	inherit distutils-r1

	case "${EAPI:-0}" in
		4|5) ;;
		*) die "EAPI=${EAPI} is not supported" ;;
	esac
fi

# @ECLASS: jnrowe-pypi.eclass
# @MAINTAINER:
# jnrowe@gmail.com
# @AUTHOR:
# jnrowe@gmail.com
# @BLURB: Simplify ebuilds for pypi hosted packages
# @DESCRIPTION:
# This eclass is a simple wrapper around the python eclasses, to remove some of
# the boilerplate necessary in maintaining ebuilds for packages on PyPI.
# @EXAMPLE:
#
# @CODE
# EAPI=3
#
# PYPI_ARCHIVE_SUFFIX="zip"
# MY_PN="CapitalisedName"
#
# inherit jnrowe-pypi
# @CODE

HOMEPAGE="https://pypi.python.org/pypi/${MY_PN:-${PN}}/"

# @VARIABLE: PYPI_OLD_DISTUTILS
# @DEFAULT_UNSET
# @DESCRIPTION:
# If set use distutils.eclass, else distutils-r1.eclass

# @VARIABLE: PYPI_ARCHIVE_SUFFIX
# @DESCRIPTION:
# Archive suffix for package source, defaults to "tar.gz".
# Can be redefined.
: ${PYPI_ARCHIVE_SUFFIX:=tar.gz}

if [[ ${PYPI_ARCHIVE_SUFFIX} == zip ]]; then
	DEPEND="${DEPEND} app-arch/unzip"
fi

# Unfortunately, you can't use ${MY_PN::1:-${PN::1}} [without switching to zsh ;)]
_PYPI_PN=${MY_PN:-${PN}}
_PYPI_P=${MY_P:-${_PYPI_PN}-${MY_PV:-${PV}}}
SRC_URI="mirror://pypi/${_PYPI_PN::1}/${_PYPI_PN}/${_PYPI_P}.${PYPI_ARCHIVE_SUFFIX}"

# Override S for PN mangling.
S="${WORKDIR}"/${_PYPI_P}

fi
