import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import QtQuick.Controls.impl as Impl
import QtQuick.Layouts
import CoreUI.Base
import CoreUI
import CoreUI.Palettes

CComboBox {
    id: control

    property Component leftDelegate: null
    property Component rightDelegate: null
    readonly property Item leftDelegateItem: null
    palette: CPalette{}

    leftPadding: padding +
                 (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing) + leftInset

    leftInset: (control.mirrored || !leftDelegateContainer.visible ? 0 : leftDelegateContainer.implicitWidth)





    background: RoundedRect {
        //border.width: 3
        implicitHeight: 40
        implicitWidth: 200
        topLeft: !leftDelegateContainer.visible
        bottomLeft: !leftDelegateContainer.visible
        topRight: true
        bottomRight: true

        color: control.palette.base
        border.color: control.palette.shadow
        radius: CoreUI.borderRadius
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
}
