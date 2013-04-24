# Copyright © 2009, 2010, 2011, 2012, 2013  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

if [[ -z ${__ECLASS_IMPORTED_JNROWE_GITHUB} ]]; then
	__ECLASS_IMPORTED_JNROWE_GITHUB=1

inherit vcs-snapshot

case "${EAPI:-0}" in
	2|3|4|5) ;;
	*) die "EAPI=${EAPI} is not supported" ;;
esac

# @ECLASS: jnrowe-github.eclass
# @MAINTAINER:
# jnrowe@gmail.com
# @AUTHOR:
# jnrowe@gmail.com
# @BLURB: Simplify ebuilds for GitHub hosted packages
# @DESCRIPTION:
# This eclass is designed to to remove some of the duplication necessary
# in supporting packages hosted on Github.
# @EXAMPLE:
#
# @CODE
# EAPI=4
#
# GITHUB_USER=JNRowe
# GITHUB_TAG=v0.4.1
#
# inherit jnrowe-github
# @CODE

# @ECLASS-VARIABLE: GITHUB_USER
# @DEFAULT_UNSET
# @REQUIRED
# @DESCRIPTION:
# GitHub user account the project is hosted within

# @ECLASS-VARIABLE: GITHUB_TAG
# @DEFAULT_UNSET
# @DESCRIPTION:
# Tag to download tarball for, if unset defaults to ${PV}

HOMEPAGE="https://github.com/${GITHUB_USER}/${MY_PN:-${PN}}/"
SRC_URI="https://github.com/${GITHUB_USER}/${MY_PN:-${PN}}/archive/${GITHUB_TAG:-${PV}}.tar.gz -> ${P}.tar.gz"

fi
