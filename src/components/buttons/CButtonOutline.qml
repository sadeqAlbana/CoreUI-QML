/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: control
    property color color;
    property color textColor;
    property int   borderWidth : 1;
    property int   radius: 4;


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
        id: backgroundRect
        color: "white"
        radius: control.radius
        border.color: control.color
        border.width: control.borderWidth
    }

    layer.effect: Glow {
        id: glow
        samples: 8
        spread: 1
        color: lighterColor(1.5)
        transparentBorder: true
        source: control
        cached: true
    }
    contentItem: Text {
        id: content
        text: control.text
        font: control.font
        color: control.color
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
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
            PropertyChanges {target: backgroundRect; color: control.color}
            PropertyChanges {target: content; color: textColor}
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
