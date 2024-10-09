# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_EXTRA_FILES="Gruntfile.js"

inherit npm

DESCRIPTION="A package manager for the web"
HOMEPAGE="https://www.npmjs.com/package/bower"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-nodejs/async dev-nodejs/exit dev-nodejs/getobject dev-nodejs/hooker dev-nodejs/lodash dev-nodejs/underscore-string dev-nodejs/which"
