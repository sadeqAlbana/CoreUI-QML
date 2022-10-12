import QtQuick
import QtQuick.Templates as T

T.Label {
    id: control
    property bool visited: false
    color: control.enabled? control.palette.text : control.palette.disabled.text
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter

    linkColor: visited? control.palette.linkVisited : control.palette.link
    opacity: enabled? 1 : 0.65
    MouseArea{
        anchors.fill: parent;
        onClicked: visited=true
    }
}

