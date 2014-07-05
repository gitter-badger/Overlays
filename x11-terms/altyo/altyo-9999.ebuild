# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="A drop-down terminal emulator, written in vala"
HOMEPAGE="https://github.com/linvinus/AltYo"
EGIT_REPO_URI="https://github.com/linvinus/AltYo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/vte-0.30.1
        >=x11-libs/gtk+-3.4
        >=dev-libs/glib-2.32
        >=dev-lang/vala-0.16"
RDEPEND="${DEPEND}"

src_prepare() {
    local valac=$(find /usr/bin/valac-*)
    sed "s|valac|$valac|g" -i Makefile
}

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" install 
}
