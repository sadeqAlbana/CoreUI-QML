/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls.impl 2.15
T.RoundButton {
    id: control

    property alias color : control.palette.button
    property alias textColor : control.palette.buttonText
    property color borderColor : "transparent"
    property int   borderWidth : 0;
    //property int radius: 4
    property int shadowRadius: 4;
    property real shadowSpread: 0.1


    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    horizontalPadding: padding + 2
    spacing: 6


    icon.width: 24
    icon.height: 24
    icon.color: control.checked || control.highlighted ? control.palette.brightText :
                control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText



    radius: 4


    clip: true
    palette.shadow: "silver"

    hoverEnabled: true
    onPressed: forceActiveFocus();
    layer.enabled: true

    layer.effect:  DropShadow{
        id: dropShadow
        radius: shadowRadius
        samples: 40
        verticalOffset: 1
        spread: 0.1
        color: palette.shadow
        cached: true
    }

    transitions: Transition {
        reversible: true
        from: "*"
        to: "hovered"
        ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }
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


    background: Rectangle{
        implicitWidth: 100
        implicitHeight: 40
//        color: palette.button
        radius: control.radius
//        border.color: control.borderColor
//        border.width: control.borderWidth

        visible: !control.flat || control.down || control.checked || control.highlighted
        color: Color.blend(control.checked || control.highlighted ? control.palette.dark : control.palette.button,
                                                                    control.palette.mid, control.down ? 0.5 : 0.0)
        border.color: control.palette.highlight
        border.width: control.visualFocus ? 2 : 0
    }




    states: [
        State{
            name: "pressed"
            when: pressed
            extend: "active"
            PropertyChanges {target: control; palette.button: darkerColor(1.3); explicit: true}
        },

        State{
            name: "active"
            when: activeFocus
            extend: "hovered"
            PropertyChanges {target: control; shadowRadius: 16; explicit: true}
            PropertyChanges {target: control; shadowSpread: 1; explicit: true}
        },
        State{
            name: "hovered"
            when: hovered
            PropertyChanges {target: control; palette.button: darkerColor(1.1); explicit: true}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: control; opacity: 0.6; explicit: true}
        }
    ]

    function darkerColor(factor){
        return Qt.darker(palette.button,factor);
    }

}
