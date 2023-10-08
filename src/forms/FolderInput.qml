/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Dialogs
import CoreUI.Base
StyledTextField {
    id: control
    property alias dialog: dlg
    function openDialog(){
        dlg.open();
    }

    FolderDialog{
        id: dlg
        acceptLabel: qsTr("Select")

        onSelectedFolderChanged: {
            control.text=dlg.selectedFolder
        }
    }

    leftDelegate: CLabel{
        text: qsTr("Browse...")
        leftPadding: 10
        rightPadding: 10
    }

    readOnly: true
    placeholderText: qsTr("No Files Selected.");

    MouseArea {
        id: mouse
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: control.openDialog();
    }
}
