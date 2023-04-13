/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import CoreUI.Menus
import CoreUI
ListView {
    id: control
    clip: true
    implicitWidth: 250
    implicitHeight: 400
    property list<Action> actions;
    property string title;
    property Item background: Rectangle{
        parent: control
        anchors.fill: parent
        radius: CoreUI.borderRadius
        z:-1
        border.color: control.palette.shadow
    }

    headerPositioning: ListView.OverlayHeader


    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton

        enabled: control.currentIndex>=0
        onClicked:(mouse)=> {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup()
        }
        onPressAndHold:(mouse)=> {
            if (mouse.source === Qt.MouseEventNotSynthesized)
                contextMenu.popup()
        }
        onDoubleClicked: console.log("double clicked")

        Menu {
            id: contextMenu
            modal: true
            dim: false

            background: Rectangle{
                implicitWidth: 300
                border.color: control.palette.shadow
                radius: 2
            }
            Repeater{
                model: control.actions.length
                CMenuItem{ action: control.actions[index]}
            }
        }
    } //end MouseArea


    delegate: CListViewDelegate{
        width: ListView.view.width;

    }

    ScrollBar.vertical: ScrollBar{}
}
