import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
MenuItem {
    id: control
    palette.windowText: hovered? "#fff" : "#000"
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20

        color: Fusion.highlight(control.palette)
        visible: control.down || control.highlighted || control.hovered
    }
}
