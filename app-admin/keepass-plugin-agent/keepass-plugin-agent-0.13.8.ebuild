# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit git-r3

MAIN_PN="keepass"
MY_PN="KeeAgent"
DESCRIPTION="ssh agent plugin for KeePass 2.x"
HOMEPAGE="https://github.com/dlech/KeeAgent"
#SRC_URI="https://github.com/dlech/${MY_PN}/archive/refs/tags/v${PV}.zip"
SRC_URI="https://lechnology.com/wp-content/uploads/2024/05/${MY_PN}_v${PV}.zip"
#EGIT_REPO_URI="https://github.com/dlech/KeeAgent.git"
#EGIT_COMMIT="v${PV}"
#EGIT_SUBMODULES=( '*' )

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="dev-lang/mono"
#DEPEND="${COMMON_DEPEND}
#	app-arch/unzip
#	>=dev-dotnet/nuget-2.12
#"
DEPEND="${COMMON_DEPEND}
	app-arch/unzip
"
RDEPEND="${COMMON_DEPEND}
	app-admin/keepass
"

S="${WORKDIR}"

src_prepare() {
	default
	#cd ${S}/${MY_PN}-${PV} || die "Cloudn't access source directory: ${S}/${MY_PN}-${PV}"
	#nuget restore KeeAgent.sln
}

src_compile() {
	#cd ${S}/${MY_PN}-${PV} || die "Cloudn't access source directory: ${S}/${MY_PN}-${PV}"
	#xbuild /property:Configuration=ReleasePlgx KeeAgent.sln
	true
}

src_install() {
	dodir /usr/$(get_libdir)/${MAIN_PN}/Plugins
	insinto /usr/$(get_libdir)/${MAIN_PN}/Plugins
	#doins KeeAgent/bin/ReleasePlgx/KeeAgent.plgx
	doins KeeAgent.plgx
	fperms 644 /usr/$(get_libdir)/${MAIN_PN}/Plugins/KeeAgent.plgx
}

