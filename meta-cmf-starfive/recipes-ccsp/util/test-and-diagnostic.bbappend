require recipes-ccsp/ccsp/ccsp_common_rpi.inc


FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://TandD-breakpad-fix.patch \
"

do_install_append () {
    # Test and Diagonastics XML 
       install -m 644 ${S}/config/TestAndDiagnostic_arm.XML ${D}/usr/ccsp/tad/TestAndDiagnostic.XML
       install -m 644 ${S}/scripts/selfheal_reset_counts.sh ${D}/usr/ccsp/tad/selfheal_reset_counts.sh
       install -m 0755 ${S}/scripts/selfheal_aggressive.sh ${D}/usr/ccsp/tad
       install -m 0664 ${S}/scripts/log_*.sh ${D}/usr/ccsp/tad
       install -m 0664 ${S}/scripts/uptime.sh ${D}/usr/ccsp/tad
       sed -i "/corrective_action.sh/a source /lib/rdk/t2Shared_api.sh" ${D}/usr/ccsp/tad/log_mem_cpu_info.sh 
       sed -i "/corrective_action.sh/a source /lib/rdk/t2Shared_api.sh" ${D}/usr/ccsp/tad/uptime.sh 
}
FILES_${PN}-ccsp += " \
                    ${prefix}/ccsp/tad/* \
                    /fss/gw/usr/ccsp/tad/* \
                    "
