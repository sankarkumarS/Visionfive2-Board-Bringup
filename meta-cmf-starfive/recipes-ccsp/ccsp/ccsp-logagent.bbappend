require ccsp_common_rpi.inc

export PLATFORM_RASPBERRYPI_ENABLED="yes"

CFLAGS_remove = "${@bb.utils.contains('DISTRO_FEATURES','rdkb_wan_manager','',bb.utils.contains('DISTRO_FEATURES', 'fwupgrade_manager', '-DFEATURE_FWUPGRADE_MANAGER -DFEATURE_RDKB_FWUPGRADE_MANAGER', '', d),d)}"
