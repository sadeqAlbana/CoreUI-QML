

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
    property HelpBlock helpBlock: HelpBlock {color: CoreUI.danger; visible: !control.acceptableInput && control.__firstTimeFocus}
    property bool passwordToggleMask: false;
    bottomInset: helpBlockLabel.visible ? helpBlockLabel.implicitHeight : 0
    bottomPadding: bottomInset + padding
    readonly property int passwordMaskWidth: passwordToggle.visible? passwordToggle.width : 0


    leftInset: LayoutMirroring.enabled? rightDelegateContainer.visible ? rightDelegateContainer.implicitWidth : 0
                 : leftDelegateContainer.visible ? leftDelegateContainer.implicitWidth : 0
    leftPadding: LayoutMirroring.enabled? rightDelegateContainer.visible ? leftInset + padding + passwordMaskWidth : padding + passwordMaskWidth
                   :leftDelegateContainer.visible ? leftInset + padding : leftPadding

    rightInset: LayoutMirroring.enabled? leftDelegateContainer.visible ? leftDelegateContainer.implicitWidth : 0
                  : rightDelegateContainer.visible ? rightDelegateContainer.implicitWidth : 0

    rightPadding: LayoutMirroring.enabled? leftDelegateContainer.visible ? rightInset + padding : rightPadding
                    : rightDelegateContainer.visible ? rightInset + padding + passwordMaskWidth : padding + passwordMaskWidth

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
        implicitHeight: 45
        implicitWidth: 200
        color : control.enabled? control.palette.base : control.palette.disabled.base
        border.color: control.validator && __firstTimeFocus? control.acceptableInput && __firstTimeFocus? CoreUI.success : CoreUI.danger :
                                                                        control.palette.shadow
        radius: CoreUI.borderRadius
        topLeft: !leftDelegateContainer.visible
        bottomLeft: !leftDelegateContainer.visible
        topRight: !rightDelegateContainer.visible
        bottomRight: !rightDelegateContainer.visible
        layer.enabled: control.activeFocus

        layer.effect: Glow {
            spread: 1
            color: control.validator&& __firstTimeFocus? control.acceptableInput ? CoreUI.rgba(CoreUI.success,64) :
                                                               CoreUI.rgba(CoreUI.danger,64) : CoreUI.boxShadow
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
        visible: control.helpBlock.visible && text.length
        topPadding: 5
        font.pixelSize: 14
        font.italic: true
        text: helpBlock.text
        color: helpBlock.color
    }

    Button{
        id: passwordToggle
        visible: passwordToggleMask
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: control.mirrored? undefined: parent.right
        anchors.left: control.mirrored? parent.left: undefined
        background: Rectangle{color: "transparent"}
        icon.name: control.echoMode==TextInput.Password? "cis-eye" : "cis-eye-slash"
        icon.color: control.palette.text
        checkable: true
        checked: false
        flat: true
        onCheckedChanged: {
            tf.echoMode= checked? TextInput.Normal : TextInput.Password
        }
    }
}
