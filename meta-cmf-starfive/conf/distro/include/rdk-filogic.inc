
#DISTRO_FEATURES_append = " rdk-oss-ssa"
#DISTRO_FEATURES_remove_dunfell = "telemetry2_0"

# RDKBDEV-73 : Dynamic DNS : Standardization based on broadband-forum.
#DISTRO_FEATURES_append = " ddns_broadband"

# RDKBDEV-83 : Device Gateway Association using Managed Device
#DISTRO_FEATURES_append = " device_gateway_association"

# RDKBDEV-50: Adding DSLite Functionality and related TR-181 DataModel Parameters
#DISTRO_FEATURES_append = " dslite"

# REFPLTV-1137: DLNA support for xupnp
#DISTRO_FEATURES_append = " dlna"

#DISTRO_FEATURES_append = " webconfig_bin"

# RDKB-44824: CoreNetLib move bb file location
DISTRO_FEATURES_append = " core-net-lib"

# RDKB-48800: Install DHCP Manager service file
#DISTRO_FEATURES_append_broadband = " dhcp_manager"

# Fix MeshAgent build errors
#DISTRO_FEATURES_append_broadband = " WanFailOverSupportEnable"

DISTRO_FEATURES_append_kirkstone = " kirkstone"
DISTRO_FEATURES_NATIVE_append_kirkstone = " kirkstone"

#DISTRO_FEATURES_append = " meshwifi"
#DISTRO_FEATURES_append = " ipv6"
#DISTRO_FEATURES_append = " rdkb_wan_manager"
##DISTRO_FEATURES_append = " filogic"
##DISTRO_FEATURES_append = " easymesh-controller"
##DISTRO_FEATURES_append = " emmc"
##DISTRO_FEATURES_append = " samba"
HOSTTOOLS += " python"

