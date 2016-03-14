##############################################################################
##
## Copyright (C) 2016 The Qt Company Ltd.
## Contact: http://www.qt.io/licensing/
##
## This file is part of the Boot to Qt meta layer.
##
## $QT_BEGIN_LICENSE:COMM$
##
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see http://www.qt.io/terms-conditions. For further
## information use the contact form at http://www.qt.io/contact-us.
##
## $QT_END_LICENSE$
##
##############################################################################

### Unfortunately the kernel module recipes in meta-renesas/meta-rcar-gen2
### are fairly broken, as they tend to install their include files into the
### staging area. That breaks when recompiling the kernel and is just flaky
### in general. Try to make things work reliably.

inherit module
addtask shared_workdir after do_compile

EXTRA_OEMAKE += "ARCH=${ARCH}"

export BUILDDIR = "${STAGING_DIR_HOST}"
export LIBSHARED = "${STAGING_LIBDIR}"
export KERNELSRC = "${STAGING_KERNEL_DIR}"
export CROSS_COMPILE = "${TARGET_PREFIX}"
export KERNELDIR = "${STAGING_KERNEL_BUILDDIR}"
export LDFLAGS = ""
export CP = "cp"

MODULE_SOURCE_DIR ?= "${S}/drv/"

do_compile() {
    cd ${MODULE_SOURCE_DIR}
    module_do_compile
    cd -
}

deploy_build_deps() {
    targetdir="$1"

    install -d ${targetdir}/include
    install ${MODULE_SOURCE_DIR}/Module.symvers $targetdir/include/${MODULE_NAME}.symvers

    for header in ${MODULE_HEADERS} ; do
        install -t ${targetdir}/include ${S}/${header}
    done
}

do_shared_workdir () {
    deploy_build_deps ${STAGING_KERNEL_BUILDDIR}
}

do_install() {
    install -D ${MODULE_SOURCE_DIR}/${MODULE_NAME}${KERNEL_OBJECT_SUFFIX} ${D}/lib/modules/${KERNEL_VERSION}/extra/${MODULE_NAME}${KERNEL_OBJECT_SUFFIX}
    deploy_build_deps ${D}/usr/src/kernel
}

FILES_${PN}-dev = " \
    /usr/src/kernel/include/${MODULE_NAME}.symvers \
    /usr/src/kernel/include/*.h \
"
