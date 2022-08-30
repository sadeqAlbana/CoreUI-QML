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
import QtQuick.Controls.impl as Impl
import "qrc:/CoreUI/palettes"

MenuBar {

    delegate: MenuBarItem {
        id: control
        property color color : "#3399ff"

        contentItem: Row{
            spacing: 5
            Impl.IconImage{
                anchors.verticalCenter: parent.verticalCenter
                name: control.menu.icon
                sourceSize.width: parent.height*0.5
                sourceSize.height: parent.height*0.5
                fillMode: Image.PreserveAspectFit
                color: control.palette.buttonText

            }

            Text {
                text: control.text
                font: control.font
                anchors.verticalCenter: parent.verticalCenter
                opacity: enabled ? 1.0 : 0.3
                color: control.palette.buttonText
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        background: Rectangle {
            implicitWidth: 55
            implicitHeight: 45
            opacity: enabled ? 1 : 0.3
            radius: 5
            color: control.highlighted ? control.color : Qt.darker(control.color,1.1)
        }
    }


} //end menu bar
