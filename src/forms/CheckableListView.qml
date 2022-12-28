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
Control{ //use Container instead ?
    id: control
    clip: true

    property CBorder border: CBorder{
        color: "#d8dbe0";
        radius: 4
    }


    property color glowColor : "#DCD9F9"
    property alias list : list;
//    MouseArea {
//        anchors.fill: parent
//        acceptedButtons: Qt.LeftButton
//        propagateComposedEvents: true
//        onClicked: {
//            console.log("clicked control")
//            mouse.accepted = false
//            control.forceActiveFocus();
//        }
//    }
    padding: 10
    //hoverEnabled: true
    //wheelEnabled: true

    background: RoundedRect{
        anchors.fill: parent;
        color : control.palette.base
        border.color: control.border.color
        radius: control.border.radius

    }

    layer.effect: Glow {
        //samples: 8
        spread: 1
        color: glowColor
        transparentBorder: true
        cached: true
        samples: radius+1

    }

    states: [
        State{
            name: "active"
            when: activeFocus
            PropertyChanges {target: control.border; color: "#8AD4EE";}
            PropertyChanges {target: layer; enabled: true;}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: control.palette; base: "#E4E7EA";}
        }
    ]

    contentItem: ListView{
        clip: true
        delegate: CheckDelegate{
            onCheckedChanged: model.checked=checked
            width: parent.width;
            leftInset: control.border.width
            rightInset: control.border.width
            background: RoundedRect{
                color : "#fff"
                radius: control.border.radius
            }
            text: model.display
            highlighted: ListView.isCurrentItem;
            onClicked: {
                control.forceActiveFocus();
                if (ListView.view.currentIndex !== index) {
                    ListView.view.currentIndex = index
                }
            }

        }
    }

}
