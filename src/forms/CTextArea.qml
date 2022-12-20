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
TextArea {
    id:control
    selectByMouse: true
    implicitHeight: 150
    layer.enabled: false

    property color glowColor : "#DCD9F9"
    property CBorder border: CBorder{
        color: "#d8dbe0";
        radius: 4
    }
    background: Rectangle{
        //border.width: 3
        implicitHeight: 40
        implicitWidth: 200
        color : control.palette.base
        border.color: control.border.color
        radius: control.border.radius
        layer.effect: Glow {
            //samples: 8
            spread: 1
            color: glowColor
            transparentBorder: true
            cached: true
        }


    }//background


    states: [
        State{
            name: "active"
            when: activeFocus
            PropertyChanges {target: control.border; color: "#8AD4EE";}
            PropertyChanges {target: background.layer; enabled: true;}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: control.palette; base: "#E4E7EA";}
        }
    ]
}
