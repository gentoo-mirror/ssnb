# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( pypy3 python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="This is a fork of the ldif module from python-ldap with python3/unicode support."
HOMEPAGE="https://github.com/abilian/ldif"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/urllib3[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools_scm-1.15.0[${PYTHON_USEDEP}]
	test? (
		${RDEPEND}
		dev-python/path-py[${PYTHON_USEDEP}]
		dev-python/flake8
		dev-python/mypy
		dev-python/pytest
	)
"

S="${WORKDIR}/${P}"

distutils_enable_tests pytest

python_test() {
	# Ignore the module from ${S}, use the one from ${BUILD_DIR}
	# Otherwise, ImportMismatchError may occur
	# https://github.com/gentoo/gentoo/pull/1622#issuecomment-224482396
	# Override pytest options to skip flake8
	pytest -vv --ignore=rst --override-ini="addopts=--doctest-modules" \
		|| die "tests failed with ${EPYTHON}"
}

