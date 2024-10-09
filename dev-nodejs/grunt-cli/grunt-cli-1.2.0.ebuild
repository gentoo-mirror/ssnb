# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="A package manager for the web"
HOMEPAGE="https://www.npmjs.com/package/bower"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="bin completion"

RDEPEND="dev-nodejs/findup-sync
	 dev-nodejs/grunt-known-options
	 dev-nodejs/nopt
	 dev-nodejs/resolve"
