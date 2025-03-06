require ccsp_common_rpi.inc
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://dmcli-telemetry-fix.patch \
"

LDFLAGS_remove = "-ltelemetry_msgsender"

do_install_append () {
    ln -sf ${bindir}/dmcli ${D}${bindir}/ccsp_bus_client_tool
    ln -sf ${bindir}/dmcli ${D}/usr/ccsp/ccsp_bus_client_tool
}
