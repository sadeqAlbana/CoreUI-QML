import QtQuick
import QtQuick.Templates as T

import QtQuick.Controls.impl as Impl
T.AbstractButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    spacing: 6
    property bool visited: false
    icon.width: control.height * 0.5
    icon.height: control.height * 0.5
    icon.color: control.visited? control.palette.linkVisited : control.palette.link

    opacity: enabled? 1 : 0.65
    contentItem: Impl.IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font: control.font

        color: control.visited? control.palette.linkVisited : control.palette.link

    } //contentItem

    background: Item{
        implicitHeight: 35
        implicitWidth: 40
    }

    HoverHandler {
        acceptedDevices: PointerDevice.Mouse
        cursorShape: Qt.PointingHandCursor
    }

    onClicked: {
        visited=true
        forceActiveFocus();
    }
}
