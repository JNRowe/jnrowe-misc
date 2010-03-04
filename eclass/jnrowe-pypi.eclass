# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

#
# Original Author: James Rowe <jnrowe@gmail.com>
# Purpose: Simplify ebuilds for pypi hosted packages and remove setuptools deps
#

HOMEPAGE="http://pypi.python.org/pypi/${MY_PN:-${PN}}/"

# @ECLASS-VARIABLE: PYPI_ARCHIVE_SUFFIX
# @DESCRIPTION:
# Archive suffix for package source, defaults to "tar.gz".
# Can be redefined.
: ${PYPI_ARCHIVE_SUFFIX:=tar.gz}

# Unfortunately, you can't use ${MY_PN::1:-${PN::1}} so...
if [[ -n "${MY_P}" && -n "${MY_PN}" ]]; then
	debug-print "Using MY_P SRC_URI override"
	SRC_URI="http://pypi.python.org/packages/source/${MY_PN::1}/${MY_PN}/${MY_P}.${PYPI_ARCHIVE_SUFFIX}"
else
	SRC_URI="http://pypi.python.org/packages/source/${PN::1}/${PN}/${P}.${PYPI_ARCHIVE_SUFFIX}"
fi

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
	cat << EOF > "${tmpwrapper}"
#! /usr/bin/python

import ${module}

${module}.${function:-main}()
EOF
	python_version
	python_convert_shebangs ${PYVER} ${tmpwrapper}
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

