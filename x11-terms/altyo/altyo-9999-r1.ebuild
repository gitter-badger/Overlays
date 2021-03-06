# Lara Maia <dev@lara.click> 2015
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

RDEPEND="x11-libs/vte:2.91[introspection,vala]
         >=x11-libs/gtk+-3.4
         >=dev-libs/glib-2.32
         dev-lang/vala:0.26"

DEPEND="${RDEPEND}
        dev-vcs/git"

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
