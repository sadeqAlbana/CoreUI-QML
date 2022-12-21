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
import QtQuick.Dialogs
StyledTextField {
    id: control
    property alias dialog: dlg
    function openDialog(){
        dlg.open();
    }

    FileDialog{
        id: dlg

        onAccepted: {
            switch(fileMode){
            case FileDialog.OpenFile: control.text=selectedFile; break;
            case FileDialog.OpenFiles: {
            let files=""

                for(let i=0; i<selectedFiles.length; i++){
                    files=files+selectedFiles[i]+","
                }

                files.slice(0,-1)

                control.text=files;

            } break;
            default: break;
            }
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
