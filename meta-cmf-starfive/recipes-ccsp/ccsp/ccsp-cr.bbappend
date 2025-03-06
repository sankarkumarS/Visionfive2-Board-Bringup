require ccsp_common_rpi.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://cr-deviceprofile_rpi.xml \
    file://telemetry-fix-ccsp-cr.patch \
"
CFLAGS_remove = "-ltelemetry_msgsender"
DEPENDS_remove = "-ltelemetry_msgsender"
do_install_append() {
    # Config files and scripts
    install -m 644 ${WORKDIR}/cr-deviceprofile_rpi.xml ${D}/usr/ccsp/cr-deviceprofile.xml
    install -m 644 ${WORKDIR}/cr-deviceprofile_rpi.xml ${D}/usr/ccsp/cr-ethwan-deviceprofile.xml
}
