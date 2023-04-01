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
ListView {
    id: control
    clip: true
    property list<Action> actions;
    property string title;
    headerPositioning: control.OverlayHeader
    implicitWidth: 250
    implicitHeight: 400
    header: CListViewHeaderDelegate{
        title: control.title;
        width: control.width;

    }


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

//    Rectangle {
//        id: scrollbar
//        anchors.right: control.right
//        y: control.visibleArea.yPosition * control.height
//        width: 10
//        height: control.visibleArea.heightRatio * control.height
//        color: "#0078D7"
//        radius: width
//        visible: control.childrenRect.height > control.height
//    }
}
