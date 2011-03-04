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
# @BLURB: Simplify ebuilds for pypi hosted packages and remove setuptools deps
# @DESCRIPTION:
# This eclass is a simple wrapper around the distutils eclass, to remove some of
# the boilerplate necessary for ebuilds for packages on PyPI.

HOMEPAGE="http://pypi.python.org/pypi/${MY_PN:-${PN}}/"

# @ECLASS-VARIABLE: PYPI_ARCHIVE_SUFFIX
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

# Based on make_wrapper from eutils.eclass
# @FUNCTION: module_script_wrapper
# @USAGE: [<wrapper>] [<module>] [function] [installpath]
# @DESCRIPTION:
# Create a Python wrapper script named wrapper(defaults to ${PN}) in installpath
# (defaults to bindir) to execute function(defaults to main) from
# module(defaults to ${PN}).  The main purpose is to wrap modules that require
# setuptools purely for their scripts, allowing us to remove setuptools.
module_script_wrapper() {
	local wrapper=${1:-${PN}} module=${2:-${PN}} function=${3:-main} path=$4
	local tmpwrapper=$(emktemp)

	ewarn "${FUNCNAME}: Deprecated, please use setuptools entry_points!" >&2

	cat << EOF > "${tmpwrapper}"
#! /usr/bin/python

import ${module}

${module}.${function:-main}()
EOF
	python_convert_shebangs $(python_get_version) ${tmpwrapper}
	chmod go+rx "${tmpwrapper}"
	if [[ -n ${path} ]]; then
		(
			exeinto "${path}"
			newexe "${tmpwrapper}" "${wrapper}"
		) || die
	else
		newbin "${tmpwrapper}" "${wrapper}" || die
	fi
}

