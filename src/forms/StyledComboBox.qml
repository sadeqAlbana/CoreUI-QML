import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import QtQuick.Controls.impl as Impl
import QtQuick.Layouts
import CoreUI.Base
import CoreUI

CComboBox {
    id: control

    property Component leftDelegate: null
    property Component rightDelegate: null
    readonly property Item leftDelegateItem: null
    readonly property Item rightDelegateItem: null


    leftPadding: padding +
                 (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing) + leftInset

    leftInset: (control.mirrored || !leftDelegateContainer.visible ? 0 : leftDelegateContainer.implicitWidth)
    rightPadding: padding +
                  (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing) +rightInset

    rightInset: (control.mirrored || !rightDelegateContainer.visible ? 0 : rightDelegateContainer.implicitWidth)


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
        anchors{
            top: control.top
            bottom: control.bottom
            right: control.right
            bottomMargin: control.bottomInset
            leftMargin: -1 * (CoreUI.borderWidth)
            left: control.background.right
        }


        background: RoundedRect{
            topLeft: false
            bottomLeft: false
            radius: CoreUI.borderRadius
            border.color: control.palette.shadow
            border.width:CoreUI.borderWidth
            color: control.palette.disabled.base

        }


        z: visible ? -2 : 0



        contentItem: Loader {
            visible: sourceComponent !== undefined
            sourceComponent: rightDelegate
        }
    }

}
