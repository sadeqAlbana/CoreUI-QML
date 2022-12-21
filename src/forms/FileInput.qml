/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import QtQuick.Controls.impl as Impl
import QtQuick.Layouts
import CoreUI.Base

StyledTextField {

    id: control

    leftDelegate: CLabel{
        text: qsTr("Browse...")
        leftPadding: 10
        rightPadding: 10
    }

    readOnly: true
    placeholderText: qsTr("No Files Selected.");

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse
        cursorShape: Qt.PointingHandCursor
    }
}
