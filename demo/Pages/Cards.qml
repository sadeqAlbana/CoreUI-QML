import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
ScrollView{
    anchors.fill: parent;
    property string cardText: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.";
    GridLayout {
        columnSpacing: 30
        rowSpacing: 30
        columns: 3
        rows: 10
        Card{
            headerText: "Card title"
            Layout.alignment: Qt.AlignHCenter
            width: 488
            height: 170
            content: contentTextArea
        }

        Card{
            footerText: "Card footer"
            headerVisible: false
            footerVisible: true
            Layout.alignment: Qt.AlignHCenter
            width: 488
            height: 170
            content: contentTextArea
        }

        Card{
            headerText: "Card with icon"
            Layout.alignment: Qt.AlignHCenter
            width: 488
            height: 170
            content: contentTextArea
        }

        Card{
            headerText: "Card with switch"
            Layout.alignment: Qt.AlignHCenter
            width: 488
            height: 170
            content: contentTextArea
        }

        Card{
            headerText: "Card with label"
            Layout.alignment: Qt.AlignHCenter
            width: 488
            height: 170
            content: contentTextArea
        }

        Card{
            headerText: "Card with label"
            Layout.alignment: Qt.AlignHCenter
            width: 488
            height: 170
            content: contentTextArea
        }

        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            width: 488
            height: 170
            content: contentTextArea
            border.color: "blue"
        }
    }

    Component {
        id : contentTextArea

        TextArea{
            anchors.fill: parent;
            anchors.margins: 5
            text: cardText
            readOnly: true
            wrapMode: Text.WordWrap

        }
    }

}
