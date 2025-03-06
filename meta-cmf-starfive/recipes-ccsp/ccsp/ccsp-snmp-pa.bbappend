require ccsp_common_rpi.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	  file://snmpd.conf \
          file://snmp-compiler-issue-fix.patch;apply=no \
          file://snmp-pa-breakpad-fix.patch \
	  "

do_configure_prepend() {
	sed -i "/135290 RESOURCE_LEAK/, +2g" ${S}/source/custom/rg_wifi_handler.c
}
do_install_append(){
	 install -m 0664 ${WORKDIR}/snmpd.conf ${D}/usr/ccsp/snmp/	
	 sed -i "s/<mibFile>Ccsp_SA-RG-MIB-MoCA.xml<\/mibFile>/<\!--<mibFile>Ccsp_SA-RG-MIB-MoCA.xml<\/mibFile>-->/g" ${D}/usr/ccsp/snmp/CcspMibList.xml
	 sed -i "s/<mibFile>Ccsp_RDKB-RG-MIB-MoCA.xml<\/mibFile>/<\!--<mibFile>Ccsp_RDKB-RG-MIB-MoCA.xml<\/mibFile>-->/g" ${D}/usr/ccsp/snmp/CcspRDKBMibList.xml 
}
