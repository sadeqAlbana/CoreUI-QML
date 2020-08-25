import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/forms"
import QtQuick.Controls 2.5
ColumnLayout {
    //spacing: 8

    Label{
        text: "Name";
        verticalAlignment: Qt.AlignBottom
        Layout.fillHeight: true
        Layout.margins: 10
        color: "#3c4b64"
//        Rectangle{
//            anchors.fill: parent;
//            color: "red"
//        }
    }
    CTextInput{
        placeholderText: "Enter your name"
        Layout.fillWidth: true
        Layout.margins: 10
        Layout.leftMargin: 10
        Layout.rightMargin: 10

//        Rectangle{
//            anchors.fill: parent;
//            color: "red"
//        }
    }
}
