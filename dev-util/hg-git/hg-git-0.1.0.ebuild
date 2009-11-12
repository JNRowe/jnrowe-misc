# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit jnrowe-pypi

DESCRIPTION="Push and pull from a Git server using Mercurial"
HOMEPAGE="http://hg-git.github.com/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Against my better judgement depend on setuptools, even though it is optional
# for the sake of repeatability.
DEPEND="dev-python/setuptools"
RDEPEND="dev-python/dulwich"
