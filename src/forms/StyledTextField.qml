

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
    property HelpBlock helpBlock: HelpBlock {}

    bottomInset: helpBlockLabel.visible ? helpBlockLabel.implicitHeight : 0
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

    background: RoundedRect {
        implicitHeight: 40
        implicitWidth: 200
        color: control.palette.base
        border.color: control.palette.shadow
        radius: CoreUI.borderRadius
        topLeft: !leftDelegateContainer.visible
        bottomLeft: !leftDelegateContainer.visible
        topRight: !rightDelegateContainer.visible
        bottomRight: !rightDelegateContainer.visible
        layer.enabled: control.activeFocus

        layer.effect: Glow {
            spread: 1
            color: CoreUI.boxShadow
            transparentBorder: true
            cached: true
        }
    } //background

    Control {
        id: leftDelegateContainer
        clip: true
        padding: 10
        background: RoundedRect{
            topRight: false
            bottomRight: false
            radius: CoreUI.borderRadius
            color: control.palette.disabled.base
            border.color: control.palette.shadow
            border.width: CoreUI.borderWidth

        }

        visible: contentItem.implicitWidth
        anchors {
            top: control.top
            bottom: control.bottom
            left: control.left
            right: control.background.left
            bottomMargin: control.bottomInset
            rightMargin: -1 * (CoreUI.borderWidth)
        }

        z: visible ? -2 : 0



        contentItem: Loader {
            visible: sourceComponent !== undefined
            sourceComponent: leftDelegate
        }
    }

    Control {
        id: rightDelegateContainer
        clip: true
        padding: 10
        background: RoundedRect{
            topLeft: false
            bottomLeft: false
            radius: CoreUI.borderRadius
            border.color: control.palette.shadow
            border.width: CoreUI.borderWidth
            color: control.palette.disabled.base

        }

        anchors {
            top: control.top
            bottom: control.bottom
            left: control.background.right
            right: control.right
            bottomMargin: control.bottomInset
            leftMargin: -1 * (CoreUI.borderWidth)
        }




        implicitHeight: parent.height
        z: visible ? -2 : 0

        visible: contentItem.implicitWidth
        contentItem: Loader {
            visible: sourceComponent !== undefined
            anchors.fill: parent
            sourceComponent: rightDelegate
        }
    }

    CLabel {
        id: helpBlockLabel
        anchors.bottom: control.bottom
        anchors.left: control.left
        anchors.right: control.right
        visible: text.length
        topPadding: 5
        font.pixelSize: 14
        font.italic: true
        text: helpBlock.text
        color: helpBlock.color
    }
}
