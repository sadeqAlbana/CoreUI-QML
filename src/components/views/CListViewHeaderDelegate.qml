import QtQuick 2.0

Rectangle {
    id: control
    implicitWidth: 100
    implicitHeight: 60
    property string title;
    Text {
        anchors.centerIn: parent
        text: control.title
        horizontalAlignment: TextEdit.AlignHCenter
        verticalAlignment: TextEdit.AlignVCenter
        font.bold: true
    }

    color: "white"
    border.color: "#D8DBE0"
}
