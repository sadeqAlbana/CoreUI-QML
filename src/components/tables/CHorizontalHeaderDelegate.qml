/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15

Rectangle {
    implicitWidth: 100
    implicitHeight: 60
    Text {
        anchors.centerIn: parent
        text: display
        horizontalAlignment: TextEdit.AlignHCenter
        verticalAlignment: TextEdit.AlignVCenter
        font.bold: true
    }

    color: "white"
    border.color: "#D8DBE0"

    MouseArea{
        width: 2
        anchors.left: parent.left
        height: parent.height
        cursorShape: Qt.SplitHCursor
    }
    MouseArea{
        width: 2
        anchors.right: parent.right
        height: parent.height
        cursorShape: Qt.SplitHCursor

        //work on drag !
    }
}
