# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic toolchain-funcs

DESCRIPTION="Oils is a Unix shell with JSON-compatible structured data. It's our upgrade path from bash to a better language and runtime."
HOMEPAGE="https://www.oilshell.org/"

SRC_URI="https://www.oilshell.org/download/${P}.tar.gz"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"
DEPEND="
	sys-libs/readline
"
RDEPEND="
	${DEPEND}
"

src_compile() {
	_build/oils.sh
}

src_install() {
	DESTDIR=${D} ./install
}

pkg_postinst() {
	# If /bin/sh does not exist, provide it
	if [[ ! -e ${EROOT}/bin/sh ]] ; then
		ln -sf /usr/bin/oils-for-unix "${EROOT}"/bin/sh
	fi
}
