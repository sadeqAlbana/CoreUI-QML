import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import QtQuick.Controls
import CoreUI
import CoreUI.Impl
import CoreUI.Palettes
import Qt5Compat.GraphicalEffects

//https://stackoverflow.com/questions/50644627/qml-rounded-rectangle-with-border
T.TabButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 9
    leftPadding: 12
    rightPadding: 12
    spacing: 6

    icon.width: 18
    icon.height: 18
    icon.color: control.checked? "#768192" : control.palette.link
    property int radius : 6

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked? "#768192" : control.palette.link
    }
    background: RoundedRect{
        radius: control.radius
        color: control.palette.base
        border.color: control.palette.shadow
        visible: control.checked || control.hovered
        bottomLeft: false
        bottomRight: false
        border.width: 1
    }
    Rectangle{
        color: control.palette.base
        height: 2
        anchors.bottom: parent.bottom
        width: control.width-2
        visible: control.checked || control.hovered

        anchors.horizontalCenter: parent.horizontalCenter
    }

    HoverHandler {
        acceptedDevices: PointerDevice.Mouse
        cursorShape: control.enabled? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
