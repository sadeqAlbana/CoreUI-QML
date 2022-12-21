

/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import QtQuick.Controls.impl as Impl
import QtQuick.Layouts
import CoreUI.Base
import CoreUI
CTextField {
    id: control

    property Component leftDelegate: null
    property Component rightDelegate: null
    readonly property Item leftDelegateItem: null
    readonly property Item rightDelegateItem: null
    property string helpBlock;





    bottomInset: helpBlockLoader.visible ? helpBlockLoader.implicitHeight : 0
    bottomPadding: bottomInset + padding

    leftInset: leftDelegateContainer.visible ? leftDelegateContainer.implicitWidth : 0
    leftPadding: leftDelegateContainer.visible ? leftInset + padding : leftPadding

    rightInset: rightDelegateContainer.visible ? rightDelegateContainer.implicitWidth : 0
    rightPadding: rightDelegateContainer.visible ? rightInset + padding : rightPadding

    component Delegate: ItemDelegate {
        //change to item delegate ?
        visible: (icon.name !== "")
        //padding: height/2
        anchors.fill: parent
        implicitHeight: 50
        implicitWidth: implicitHeight
        icon.color: "#5C6873"
    }

    component HelpBlockDelegate: CLabel {
        topPadding: 5
        font.pixelSize: 14
        font.italic: true
    }

    background: RoundedRect {
        //border.width: 3
        implicitHeight: 40
        implicitWidth: 200
        color: control.palette.base
        border.color: control.palette.shadow
        radius: CoreUI.borderRadius
        topLeft: !leftDelegateContainer.visible
        bottomLeft: !leftDelegateContainer.visible

        topRight: !rightDelegateContainer.visible
        bottomRight: !rightDelegateContainer.visible
        layer.effect: Glow {
            //samples: 8
            spread: 1
            color: glowColor
            transparentBorder: true
            cached: true
        }
    } //background

    RoundedRect {
        id: leftDelegateContainer
        clip: true
        topRight: false
        bottomRight: false
        radius: CoreUI.borderRadius
        visible: true
        anchors {
            top: control.top
            bottom: control.bottom
            left: control.left
            right: control.background.left
            bottomMargin: control.bottomInset
            rightMargin: -1 * (CoreUI.borderWidth)
        }
        implicitWidth: leftDelegateLoader.implicitWidth
        implicitHeight: leftDelegateLoader.implicitHeight
        color: control.palette.disabled.base
        z: visible ? -2 : 0

        border.color: control.palette.shadow
        border.width: CoreUI.borderWidth

        Loader {
            id: leftDelegateLoader
            anchors.fill: parent
            visible: sourceComponent !== undefined
            sourceComponent: leftDelegate

        }


    }

    RoundedRect {
        id: rightDelegateContainer
        clip: true
        topLeft: false
        bottomLeft: false
        radius: CoreUI.borderRadius
        anchors{
            top: control.top
            bottom: control.bottom
            right: control.right
            bottomMargin: control.bottomInset
            leftMargin: -1 * (CoreUI.borderWidth)
            left: background.right
        }

        implicitHeight: parent.height
        implicitWidth: rightDelegateLoader.implicitWidth
        color: control.palette.disabled.base
        z: visible ? -2 : 0

        border.color: control.palette.shadow
        border.width:CoreUI.borderWidth

        Loader {
            id: rightDelegateLoader
            visible: sourceComponent !== undefined
            anchors.fill: parent;
            sourceComponent: rightDelegate
        }
    }

    Loader {
        id: helpBlockLoader
        visible: sourceComponent !== undefined
        anchors.bottom: control.bottom
        anchors.left: control.left
        anchors.right: control.right
    }
}
