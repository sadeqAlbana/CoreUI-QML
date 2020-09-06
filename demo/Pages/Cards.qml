import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
ScrollView{
    id:scrollView
    clip: true
    anchors.fill: parent;
    property string cardText: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.";
    GridLayout {
        id:grildLayout
        width: parent.parent.width
        columnSpacing: 30
        rowSpacing: 30
        columns: 3
        Card{
            headerText: "Card title"
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            footerText: "Card footer"
            headerVisible: false
            footerVisible: true
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with icon"
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with switch"
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with label"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with label"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }

        //repeated
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"



            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
    }

    Component {
        id : contentTextArea

        TextArea{
            width: parent.width
            height: parent.height
            text: cardText
            readOnly: true
            wrapMode: Text.WordWrap

        }
    }

}
