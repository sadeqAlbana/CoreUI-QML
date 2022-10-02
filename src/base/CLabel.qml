import QtQuick
import QtQuick.Templates as T

T.Label {
    id: control
    color: control.enabled? control.palette.text : control.palette.disabled.text
    linkColor: control.palette.link
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
}

