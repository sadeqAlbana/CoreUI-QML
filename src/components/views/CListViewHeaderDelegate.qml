/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick

Rectangle {
    id: control
    implicitWidth: 100
    implicitHeight: 60
    property string title;
    Text {
        anchors.centerIn: parent
        text: control.title
        horizontalAlignment: TextEdit.AlignHCenter
        verticalAlignment: TextEdit.AlignVCenter
        font.bold: true
    }

    color: "white"
    border.color: "#D8DBE0"
}
