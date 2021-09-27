import QtQuick 2.15

Rectangle {
    implicitWidth: 100
    implicitHeight: 60
    Text {
        anchors.centerIn: parent
        text: display
        horizontalAlignment: TextEdit.AlignHCenter
        verticalAlignment: TextEdit.AlignVCenter
        font.bold: true
    }

    color: "white"
    border.color: "#D8DBE0"
}
