/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "../SharedComponents"
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
    background: RoundedRect{
        color : "#fff"
        border.color: control.border.color
        radius: control.border.radius
    }
    layer.effect: Glow {
        //samples: 8
        spread: 1
        color: glowColor
        transparentBorder: true
        cached: true
    }

    states: [
        State{
            name: "rejected and active"
            when:  !acceptableInput && activeFocus
            PropertyChanges {target: control.border; color: "red";}
            PropertyChanges {target: layer; enabled: true;}
            PropertyChanges {target: control; glowColor: "#F2A8A8";}
        },
        State{
            name: "rejected"
            when: !acceptableInput
            PropertyChanges {target: control.border; color: "red";}
        },
        State{
            name: "active"
            when: activeFocus
            PropertyChanges {target: control.border; color: "#8AD4EE";}
            PropertyChanges {target: layer; enabled: true;}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: control; color: "#E4E7EA";}
        }
    ]
}
