SUMMARY = "Python Jinja2 Template Engine"
DESCRIPTION = "Jinja2 is a modern and designer-friendly templating engine for Python."
LICENSE = "BSD-3-Clause"
SRC_URI = "https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-2.11.3.tar.gz"

S = "${WORKDIR}/Jinja2-2.11.3"

#inherit python3native setuptools
inherit python3native 

# Ensure that python3-jinja2 is cross-compiled for riscv64
python3_depends = "python3"
RDEPENDS_${PN} = "${python3_depends}"

do_compile_append() {
    # Custom compilation steps if needed for riscv64
    :
}

do_install_append() {
    # Custom installation steps if needed
    :
}

