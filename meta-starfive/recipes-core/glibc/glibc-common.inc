SUMMARY = "GLIBC (GNU C Library)"
DESCRIPTION = "The GNU C Library is used as the system C library in most systems with the Linux kernel."
HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
SECTION = "libs"
LICENSE = "GPL-2.0-only & LGPL-2.1-only"

LIC_FILES_CHKSUM ?= "file://LICENSES;md5=1541fd8f5e8f1579512bf05f533371ba \
      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
      file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"

CVE_PRODUCT = "glibc"

INHIBIT_DEFAULT_DEPS = "1"

#
# We will skip parsing glibc when target system C library selection is not glibc
# this helps in easing out parsing for non-glibc system libraries
#
#COMPATIBLE_HOST:libc-musl:class-target = "null"

PV = "2.36"
