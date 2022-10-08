import QtQuick
import QtQuick.Controls.Basic
import CoreUI
import CoreUI.Impl
import CoreUI.Palettes
TabButton {
    id: control
    property int radius: 6
    background: Rectangle{
        radius: control.radius
        color: "transparent"
        border.color: control.down? control.palette.shadow: "transparent"
    }
}
