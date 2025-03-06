# ----------------------------------------------------------------------------

SYSTEMD_TOOLS = "systemd-analyze systemd-bootchart"

# systemd-bootchart doesn't currently build with musl libc
SYSTEMD_TOOLS_remove_libc-musl = "systemd-bootchart"

IMAGE_INSTALL_append = " ${SYSTEMD_TOOLS}"

#REFPLTB-349 Needed for Firmware upgrade - to create file system of dual partition
#IMAGE_INSTALL_append = " e2fsprogs breakpad-staticdev"
IMAGE_INSTALL_append = " e2fsprogs"
IMAGE_INSTALL_append = " bridge-utils"

#Opensync Integration 
#IMAGE_INSTALL_append =" ${@bb.utils.contains('DISTRO_FEATURES', 'Opensync', ' mt76 opensync openvswitch', '', d)}"

#Beegol agent Support
#IMAGE_INSTALL_append =" ${@bb.utils.contains('DISTRO_FEATURES', 'beegol_agent', ' ba', '', d)}"

#Asterisk Support
#IMAGE_INSTALL_append =" ${@bb.utils.contains('DISTRO_FEATURES', 'Asterisk', ' hal-voice-asterisk', '', d)}"

#require image-exclude-files.inc

remove_unused_file() {
    for i in ${REMOVED_FILE_LIST} ; do rm -rf ${IMAGE_ROOTFS}/$i ; done
}

ROOTFS_POSTPROCESS_COMMAND_append = "remove_unused_file; "


ROOTFS_POSTPROCESS_COMMAND_append = "add_busybox_fixes; "

#IMAGE_INSTALL += " u-boot-visionfive linux-starfive-visionfive"
#IMAGE_INSTALL += " u-boot-visionfive"

#do_rootfs[depends] += "u-boot-visionfive:do_image"  # Ensure U-Boot is built before the image
#do_rootfs[depends] += "linux-starfive-visionfive:do_image"  # Ensure the kernel is built before the image

add_busybox_fixes() {
                if [  -d ${IMAGE_ROOTFS}/bin ]; then
			cd  ${IMAGE_ROOTFS}/bin
                        rm ${IMAGE_ROOTFS}/bin/ps
			ln -sf  /bin/busybox.nosuid  ps
			ln -sf  /bin/busybox.nosuid  ${IMAGE_ROOTFS}/usr/bin/awk
			cd -
                fi
}

KERNEL_DEVICETREE_remove_kirkstone = " \
               overlays/vc4-fkms-v3d-pi4.dtbo \
               overlays/wm8960-soundcard.dtbo \
"
# ----------------------------------------------------------------------------

TARGET_ARCH = "riscv64"
TUNE_FEATURES = "riscv64"
DEPENDS_remove = "breakpad-wrapper"
LDFLAGS_remove = "-lbreakpadwrapper"
CFLAGS_remove = "-lbreakpadwrapper"
PREFERRED_PROVIDER_virtual/kernel = "linux-starfive-dev"
CFLAGS_append = " -UINCLUDE_BREAKPAD"


RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "rdk-wifi-hal"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "xupnp"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "rdk-fwupgrade-manager"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "breakpad-wrapper"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "ccsp-adv-security"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "ccsp-one-wifi"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "start-parodus"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "rdk-ledmanager"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "jst"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "parodus"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "harvester"
RDEPENDS_packagegroup-rdk-ccsp-broadband_remove = "parodus2ccsp"
DEPENDS_remove = "breakpad-native"
DEPENDS_remove = "breakpad"
MACHINE_IMAGE_NAME = "rdkb-generic-broadband-image"

DISTRO_FEATURES_append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"


RDEPENDS:${PN}_remove = "nativesdk-qemu"
RDEPENDS:${PN}_remove = "virglrenderer-native"

