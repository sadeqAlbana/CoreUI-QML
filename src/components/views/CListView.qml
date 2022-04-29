/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import "qrc:/CoreUI/components/tables/"

ListView {
    id: listView
    clip: true
    property list<Action> actions;
    property string title;
    headerPositioning: ListView.OverlayHeader

    header: CListViewHeaderDelegate{
        title: listView.title;
        width: ListView.view.width;

    }


    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton


        enabled: listView.currentIndex>=0
        onClicked: {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup()
        }
        onPressAndHold: {
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
                border.color: "silver"
                radius: 2
            }
            Repeater{
                model: listView.actions.length
                CMenuItem{ action: listView.actions[index]}
            }
        }
    } //end MouseArea


    delegate: CListViewDelegate{
        width: ListView.view.width;

    }

//    Rectangle {
//        id: scrollbar
//        anchors.right: listView.right
//        y: listView.visibleArea.yPosition * listView.height
//        width: 10
//        height: listView.visibleArea.heightRatio * listView.height
//        color: "#0078D7"
//        radius: width
//        visible: listView.childrenRect.height > listView.height
//    }
}
