# Copyright © 2009-2017  James Rowe <jnrowe@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit systemd

DESCRIPTION="Wrapper to make XOrg function as a proper systemd unit"
HOMEPAGE="https://github.com/sofar/${PN}"
SRC_URI="http://foo-projects.org/~sofar/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-apps/systemd"
RDEPEND="${DEPEND}"

src_configure() {
	econf --with-systemduserunitdir=$(systemd_get_userunitdir)
}
