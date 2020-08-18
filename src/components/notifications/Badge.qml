import QtQuick 2.12
import QtQuick.Layouts 1.12
Rectangle{

    property alias textColor: badgeText.color
    property alias text: badgeText.text
    radius: 4
    antialiasing: true
    clip: true
    color: "silver"
    Text {
        id: badgeText
        anchors.fill: parent;
        padding: 1
        antialiasing: true
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 1
        color: "white"
        text: "badge"
    }
}
