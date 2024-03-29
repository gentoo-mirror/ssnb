# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
WX_GTK_VER=3.0
inherit wxwidgets

DESCRIPTION="C++ library to create, manipulate and render SVG files"
HOMEPAGE="http://wxsvg.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="wxWinLL-3"
SLOT="0/3" # based on SONAME of libwxsvg.so
KEYWORDS="~amd64 ~x86"
IUSE="static-libs libav"

RDEPEND=">=dev-libs/expat-2:=
	media-libs/libexif:=
	>=dev-libs/glib-2.28:2=
	dev-libs/libxml2:=
	media-libs/fontconfig:=
	media-libs/freetype:2=
	x11-libs/cairo:=
	x11-libs/pango:=
	x11-libs/wxGTK:${WX_GTK_VER}=[X]
	libav? ( >=virtual/ffmpeg-9:0=[libav=] )
	!libav? ( >=media-video/ffmpeg-2.6:0= )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS ChangeLog TODO )

src_configure() {
	need-wxwidgets base-unicode
	econf \
		$(use_enable static-libs static) \
		--with-wx-config=${WX_CONFIG}
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die "Error pruning libraries!"
}
