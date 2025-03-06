require ccsp_common_rpi.inc

LDFLAGS_append = " -Wl,--no-as-needed"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://ccsp-lmlite-telemetry-fix.patch \
"

