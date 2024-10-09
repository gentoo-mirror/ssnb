# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fs.realpath"
NPM_PN_URI="fs.realpath"
NPM_EXTRA_FILES="old.js"

inherit npm

DESCRIPTION="A package manager for the web"
HOMEPAGE="https://www.npmjs.com/package/bower"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

