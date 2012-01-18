# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

if [[ -z ${__ECLASS_IMPORTED_JNROWE_GITHUB} ]]; then
	__ECLASS_IMPORTED_JNROWE_GITHUB=1

inherit eutils

case "${EAPI:-0}" in
	2|3|4) ;;
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
# in supporting packages hosed on Github.

# @VARIABLE: GITHUB_USER
# @DEFAULT-UNSET
# @REQUIRED
# @DESCRIPTION:
# GitHub user account the project is hosted within

# @VARIABLE: GITHUB_TAG
# @DEFAULT-UNSET
# @DESCRIPTION:
# Tag to download tarball for, if unset defaults to ${PV}

HOMEPAGE="https://github.com/${GITHUB_USER}/${MY_PN:-${PN}}/"
SRC_URI="https://github.com/${GITHUB_USER}/${MY_PN:-${PN}}/tarball/${GITHUB_TAG:-${PV}} -> ${P}.tar.gz"

EXPORT_FUNCTIONS src_unpack

jnrowe-github_src_unpack() {
	default

	mv ${GITHUB_USER}-${MY_PN:-${PN}}-*/ "${S}" \
		|| die "Moving unpacked tarball failed"
}

fi
