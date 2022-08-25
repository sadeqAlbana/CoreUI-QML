/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "qrc:/CoreUI/components/SharedComponents"

Button {
    id: control

    property int   radius: 4;
    property CBorder border: CBorder{
        color: "white";
    }

    implicitHeight: 35
    implicitWidth: 120
    hoverEnabled: true
    onPressed: forceActiveFocus();
    layer.enabled: false

    transitions: Transition {
        reversible: true
        from: "*"
        to: "hovered,activeHovered"
        ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }
    }

    background: Rectangle{
        color: control.border.color
        radius: control.radius
        border.color: control.palette.button
        border.width: control.border.width
    }

    layer.effect: Glow {
        id: glow
        //samples: 8
        spread: 1
        color: lighterColor(1.5)
        transparentBorder: true
        source: control
        cached: true
    }
    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked || control.highlighted ? control.palette.brightText :
               control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
    }

    states: [
        State{
            name: "activeHovered"
            when:  hovered && activeFocus
            extend: "hovered"
            PropertyChanges {target: control.layer; enabled: true}


        },

        State{
            name: "active"
            when: activeFocus || focus
            PropertyChanges {target: control.layer; enabled: true}

        },
        State{
            name: "hovered"
            when: hovered
            PropertyChanges {target: control.border; color: control.color}
            PropertyChanges {target: content; color: control.palette.buttonText}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: control; opacity: 0.65;}
        }
    ]

    function lighterColor(factor){
        return Qt.lighter(control.color,factor);
    }
}
