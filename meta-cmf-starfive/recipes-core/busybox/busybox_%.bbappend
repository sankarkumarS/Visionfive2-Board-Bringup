FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
   file://nc.cfg \
   "

SRC_URI_remove = "file://enable_ps_wide.cfg"
SRC_URI_append_broadband = " file://rdk-b.cfg"
SRC_URI_append_extender = " file://timeout.cfg"

LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"

do_install_append() {
        rm ${D}${sysconfdir}/syslog.conf
}

FILES_${PN}-syslog_remove = "${sysconfdir}/syslog.conf"
