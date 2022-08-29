import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
MenuItem {
    id: control
    palette.windowText: enabled? hovered? "#fff" : "#000" : "silver"
    //palette.window: hovered? "red" : "blue"
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20
        color: control.palette.highlight
        visible: control.enabled && (control.down  || control.hovered)
    }
}
