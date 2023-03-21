import QtQuick;
import QtQuick.Controls
import QtQuick.Controls.Basic;
import Qt.labs.platform
import QtQuick.Dialogs
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import CoreUI
import CoreUI.Buttons
import CoreUI.Palettes
CButton {
    id: control

    property color color: "#563D7C"
    padding: 7
    topPadding: 8
    rightPadding: padding
    leftPadding: padding
    bottomPadding: 8
    implicitWidth: 50
    ColorDialog{
        id: dlg

        onAccepted: control.color=selectedColor


    }


    background: Rectangle{
        //border.width: 3
        implicitHeight: 45
        implicitWidth: 200
        color : control.enabled? control.palette.base : control.palette.disabled.base
        border.color:  control.palette.shadow
        radius: CoreUI.borderRadius
        layer.enabled: control.activeFocus
        layer.effect: Glow {
            spread: 1
            color: CoreUI.boxShadow
            transparentBorder: true
            cached: true

        }
    }//background


    contentItem: Rectangle{
        color: control.color
        radius: CoreUI.borderRadius
    }

    onClicked: dlg.open();
}
