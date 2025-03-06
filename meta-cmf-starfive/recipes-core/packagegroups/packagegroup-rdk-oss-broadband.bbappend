
# linux-firmware-ralink provides /lib/firmware/rt*.bin (which includes
# /lib/firmware/rt2870.bin, which is required by hostapd on RPi).

RDEPENDS_packagegroup-rdk-oss-broadband_append = " \
    iw \
    wireless-tools \
    ${@bb.utils.contains('DISTRO_FEATURES', 'OneWifi', ' ', ' hostapd', d)} \
    linux-firmware-ralink \
    crda \
    ebtables \
    ethtool \
    ntpstat \
    ${@bb.utils.contains('DISTRO_FEATURES', 'dac', 'speedtest-cli', '', d)} \
"

RDEPENDS_packagegroup-rdk-oss-broadband_remove_aarch64 = "alljoyn"
