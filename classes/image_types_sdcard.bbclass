#############################################################################
##
## Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
##
## This file is part of the Qt Enterprise Embedded Scripts of the Qt
## framework.
##
## $QT_BEGIN_LICENSE$
## Commercial License Usage Only
## Licensees holding valid commercial Qt license agreements with Digia
## with an appropriate addendum covering the Qt Enterprise Embedded Scripts,
## may use this file in accordance with the terms contained in said license
## agreement.
##
## For further information use the contact form at
## http://www.qt.io/contact-us.
##
##
## $QT_END_LICENSE$
##
#############################################################################

IMAGE_ROOTFS_EXTRA_SPACE = "100000"
SDCARD_ROOTFS = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext3"
SDCARD_GENERATION_COMMAND_ti33x = "generate_imx_sdcard"

IMAGE_CMD_sdcard_append() {
    parted -s ${SDCARD} set 1 boot on

    rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.img
    ln -s ${IMAGE_NAME}.rootfs.sdcard ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.img
}

IMAGE_CMD_rpi-sdimg_append() {
    rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.img
    ln -s ${IMAGE_NAME}.rootfs.rpi-sdimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.img
}

build_hddimg_append() {
    rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.img
    ln -s ${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.img
}
