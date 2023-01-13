import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
ToolButton {
    id: control
    HoverHandler {
        acceptedDevices: PointerDevice.Mouse
        cursorShape: control.enabled? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
