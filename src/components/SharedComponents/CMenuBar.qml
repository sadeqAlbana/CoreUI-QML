/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.impl as Impl

MenuBar {
    id: control
    property color color : "#3399ff"

    delegate: MenuBarItem {
        id: controlItem

        contentItem: Row{
            spacing: 5
            Impl.IconImage{
                anchors.verticalCenter: parent.verticalCenter
                name: controlItem.menu.icon
                sourceSize.width: parent.height*0.5
                sourceSize.height: parent.height*0.5
                fillMode: Image.PreserveAspectFit
                color: "#FFFFFF"

            }

            Text {
                text: controlItem.text
                font: controlItem.font
                anchors.verticalCenter: parent.verticalCenter
                opacity: enabled ? 1.0 : 0.3
                color: controlItem.highlighted ? "#ffffff" : "white"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        background: Rectangle {
            implicitWidth: 55
            implicitHeight: 55
            opacity: enabled ? 1 : 0.3
            radius: 5
            color: controlItem.highlighted ? control.color : Qt.darker(control.color,1.1)
        }
    }

//    background: Rectangle {
//        implicitWidth: 55
//        implicitHeight: 55
//        color: control.highlighted ? control.color : Qt.darker(control.color,1.1)

//    }
} //end menu bar
