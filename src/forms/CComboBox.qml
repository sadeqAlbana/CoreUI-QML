/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
ComboBox{
    id:control
    palette.buttonText: "#3c4b64"
    palette.window: "#fff"
    flat: true
    property CIcon icon:CIcon{color: "#5C6873"}

    palette.highlight: "#8AD4EE"
    property CBorder border: CBorder{
        color: "#d8dbe0";
        radius: 4
    }
    property color glowColor : "#DCD9F9"
    background: RoundedRect{
        implicitHeight: 40
        implicitWidth: 200
        color : control.palette.window
        border.color: control.activeFocus? control.palette.highlight : control.border.color
        radius: control.border.radius
        topLeft: !sideDelegate.visible
        bottomLeft: !sideDelegate.visible
        layer.enabled: control.activeFocus
        layer.effect: Glow {
            spread: 1
            color: glowColor
            transparentBorder: true
            cached: true
        }
    }


    leftPadding: padding +
                 (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing) + leftInset

    leftInset: (control.mirrored || !sideDelegate || !sideDelegate.visible ? 0 : sideDelegate.width)
    rightPadding: padding +
                  (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing) +rightInset

    rightInset: (!control.mirrored || !sideDelegate || !sideDelegate.visible ? 0 : sideDelegate.width)



    delegate: ItemDelegate {
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex === index || hovered
        hoverEnabled: control.hoverEnabled
        palette.highlight: "#0078D7"
        palette.light: "#0078D7"
        palette.midlight: "#0078D7"
    }

    states: State{
        name: "active"
        PropertyChanges {target: control.border; color: "#8AD4EE";}
    }

    layer.enabled: false
    property Item sideDelegate: ItemDelegate{
        parent: control
        visible: control.icon.name || control.icon.source!=""
        icon.name: control.icon.name
        icon.width: control.icon.width
        icon.height: control.icon.height
        icon.color: control.icon.color
        x: !control.mirrored ? control.padding + control.border.width : control.width - width - control.padding - control.border.width
        y: control.topPadding + (control.availableHeight - height) / 2
        z: -2
        implicitHeight: parent.height
        background: RoundedRect{
            clip: true
            topRight: false
            bottomRight: false
            topLeft: true
            bottomLeft: true
            radius: control.border.radius
            color: "#F0F3F5"
            border.color: control.border.color
            border.width: control.border.width
        }
    }
}
