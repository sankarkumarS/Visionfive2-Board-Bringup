require ccsp_common_rpi.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
  file://hotspot-fix.patch \
"

LDFLAGS_remove = "-lbreakpadwrapper"
LDFLAGS_remove = "-ltelemetry_msgsender"

CFLAGS_append = " -UINCLUDE_BREAKPAD"
DEPENDS_append = " webconfig-framework"
do_compile_prepend () {
    # Config files and scripts
        install -d ${D}/usr/ccsp
        install -d ${D}/usr/ccsp/hotspot
        install -d ${D}/usr/include/ccsp

        install -m 644 ${S}/source/hotspotfd/include/dhcpsnooper.h ${D}/usr/include/ccsp
        install -m 644 ${S}/source/hotspotfd/include/hotspotfd.h ${D}/usr/include/ccsp
        install -m 777 ${S}/source/HotspotApi/libHotspotApi.h ${D}/usr/include/ccsp
        ln -sf /usr/bin/CcspHotspot ${D}${prefix}/ccsp/hotspot/CcspHotspot
}

