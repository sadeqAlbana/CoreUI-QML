/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Controls
ItemDelegate {
//    implicitWidth: 100
    id: control
    clip: true
    implicitHeight: 60
    text: model.display
    font.bold: true
    display: AbstractButton.TextUnderIcon //simple trick to center the text in IconLabel without having to use a custom contentItem
    background: Rectangle{
    color: control.palette.base
    border.color: control.palette.shadow
    border.width: 0



    Rectangle{
        width: parent.width
        height: 1
        anchors.bottom: parent.bottom
        color: control.palette.shadow
    }
    }

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
