# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

GCONF_DEBUG="no"
inherit gnome2

DESCRIPTION="Canonical's on-screen-display notification agent"
HOMEPAGE="https://launchpad.net/notify-osd"
SRC_URI="http://launchpad.net/${PN}/lucid/ubuntu-10.04-beta-2/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="dev-libs/dbus-glib
	gnome-base/gconf
	x11-libs/gtk+
	>=x11-libs/libnotify-0.4.5
	x11-libs/libwnck
	!x11-misc/notification-daemon
	!x11-misc/xfce4-notifyd"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

# Tests are poorly defined, and poorly sandboxed.  Should probably fix the build
# system as it builds many unused tools for tests too.
RESTRICT="test"

DOCS="AUTHORS NEWS README TODO"

# This should be the default, as it hides all kinds of warnings and errors.
G2CONF="--disable-silent-rules"

src_install() {
	gnome2_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		# Just install the Python examples, they do the same as the C/C#
		# examples anyway.
		doins examples/*.py
	fi
}
