EXTRA_OECONF_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'CPUPROCANALYZER_BROADBAND', ' --enable-procanalyzer-broadband', '', d)}"
DEPENDS += "telemetry json-c"
 
CFLAGS_append = " -DPROCANALYZER_BROADBAND"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append = " \
    file://cpuproc-telemetry-fix.patch \
"

