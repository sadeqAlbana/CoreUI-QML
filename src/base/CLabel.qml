import QtQuick
import QtQuick.Templates as T

T.Label {
    id: control
    color: control.enabled? control.palette.text : control.palette.disabled.text
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    linkColor: enabled? control.palette.link : control.palette.disabled.link
}

