require ccsp_common_rpi.inc

#export PLATFORM_RASPBERRYPI_ENABLED="yes"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://ccsp-gwprovapp-telemetry-fix.patch \
"
LDFLAGS_remove = "-ltelemetry_msgsender"
DEPENDS_remove = "telemetry"

FILES_${PN} += " \
    /usr/bin/gw_prov_utopia \
"
