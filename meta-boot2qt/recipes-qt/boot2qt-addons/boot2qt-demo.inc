############################################################################
##
## Copyright (C) 2020 The Qt Company Ltd.
## Contact: https://www.qt.io/licensing/
##
## This file is part of the Boot to Qt meta layer.
##
## $QT_BEGIN_LICENSE:GPL$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see https://www.qt.io/terms-conditions. For further
## information use the contact form at https://www.qt.io/contact-us.
##
## GNU General Public License Usage
## Alternatively, this file may be used under the terms of the GNU
## General Public License version 3 or (at your option) any later version
## approved by the KDE Free Qt Foundation. The licenses are as published by
## the Free Software Foundation and appearing in the file LICENSE.GPL3
## included in the packaging of this file. Please review the following
## information to ensure the GNU General Public License requirements will
## be met: https://www.gnu.org/licenses/gpl-3.0.html.
##
## $QT_END_LICENSE$
##
############################################################################

inherit qmake5
require recipes-qt/qt5/qt5-git.inc

QT_GIT = "git://codereview.qt-project.org/${QT_GIT_PROJECT}"
QT_GIT_PROTOCOL = "http"
QT_GIT_PROJECT = "qt-apps"
QT_MODULE = "boot2qt-demos"
QT_MODULE_BRANCH = "5.15"

FILESEXTRAPATHS_prepend := "${THISDIR}/boot2qt-demos:"

BRANCH = "5.15"

SRCREV = "52c48a0818f20ea3d56c9261c926425596cd7aa2"

FILES_${PN} += " \
    /data/user \
    "
FILES_${PN}-dbg += " \
    /data/user/qt/qmlplugins/*/.debug/ \
    "
FILES_${PN}-staticdev += " \
    /data/user/qt/qmlplugins/*/*.a \
    "
