/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.RoundButton {
    id: control
    property color borderColor : "transparent"
    property int   borderWidth : 0;
    //property int radius: 4
    property int  shadowRadius: control.enabled? (control.down? 20 : (control.hovered? 16 : 4)) : 0


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


    layer.enabled: control.enabled
    layer.effect:  DropShadow{
        radius: control.shadowRadius
        verticalOffset: 1
        spread: 0.1
        color: palette.shadow
        cached: true
        transparentBorder: true
    }


    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        radius: control.radius

        Behavior on color{
            ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }

        }

        visible: !control.flat || control.down || control.checked || control.highlighted
        color: {
            if(!control.enabled)
                return control.palette.button.lighter(1.3)

            if(control.down && control.hovered){
                return control.palette.button.lighter(1.2)
            }

            if(control.down || control.checkable){
                return control.palette.button.darker(1.4)

            }

            if(control.visualFocus){
                return control.palette.button.darker(1.1)
            }

            if(control.hovered){
                return control.palette.button.darker(1.1)
            }



            return control.palette.button
        }

        //border.color: control.palette.highlight
        //border.width: control.visualFocus ? 2 : 0
    }//background

//    onHighlightedChanged: {
//        console.log("highlighted: " + highlighted)
//    }
//    onPressedChanged: {
//        console.log("pressed: " + pressed)

//    }

//    onCheckedChanged: {
//        console.log("checked: " + checked)
//    }

//    onHoveredChanged: {
//        console.log("hovered: " + hovered)

//    }

//    onActiveFocusChanged: {
//        console.log("activeFocus: " + activeFocus)

//    }

//    onVisualFocusChanged: {
//        console.log("visualFocus: " + visualFocus)

//    }


}
