FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
                    
SRC_URI_append += " ${@bb.utils.contains('DISTRO_FEATURES', 'webconfig_bin', 'file://webconfig_metadata.json', '', d)}" 

#inherit breakpad-wrapper
#DEPENDS += "breakpad breakpad-wrapper"
BREAKPAD_BIN_append = " webconfig"

LDFLAGS += " -lpthread -lstdc++"
CFLAGS += "-UINCLUDE_BREAKPAD"

# generating minidumps
#PACKAGECONFIG_append = "breakpad"
