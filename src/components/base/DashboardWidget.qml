import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
Rectangle{
    id : widget
    clip: true
    property alias text : textLabel.text
    property alias  value: valueLabel.text
    radius: 5
    implicitHeight: 150
    //implicitWidth: textLabel.paintedWidth > valueLabel.paintedWidth ?  textLabel.paintedWidth*1.5 : valueLabel.paintedWidth*1.5
    implicitWidth: 300

    Layout.fillWidth: true
    Layout.preferredHeight: 150
    Layout.preferredWidth: 300

    Layout.minimumWidth: implicitWidth/1.25
    color: "#DD4141"
    layer.enabled: true
    layer.effect:  DropShadow{
        radius: 5
        samples: 40
        verticalOffset: 1
        spread: 0.1
        color: "silver"
        cached: true
    }

    Label{
        id: textLabel
        font.pixelSize: 20
        font.family: "Verdana"
        //font.bold: true
        text: ""
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 10
        color: "white"
    }

    Label{
        id: valueLabel
        font.pixelSize: 35
        font.family: "Arial"
        font.bold: true
        text: "0"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 15
        color: "white"
    }
}

