import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4 as TT
import QtQuick.Controls.Styles 1.4 as TS

Control {
    id: delegate
    clip: true
    property color textColor : "#4F5D73"
    property color color : styleData.row%2==0 ? "#F2F2F3" : "white";
    property color borderColor : "#D8DBE0"

    background: Rectangle{
        color: delegate.color
        border.color: borderColor
    }

    contentItem: Text {
        id: textEdit
        anchors.centerIn: parent
        text: styleData.value
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: textColor
        font.pixelSize: 18

    }


    states: [
        State{
            name: "selected"
            when: styleData.selected
            PropertyChanges {  target: delegate; textColor: "white"; }
            PropertyChanges {  target: delegate; color: "#0078D7"; }
            PropertyChanges {  target: delegate; borderColor: "#0078D7"; }
        }
    ]

}
