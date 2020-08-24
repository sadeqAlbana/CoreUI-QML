import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
ScrollView{
    id:scrollView
    clip: true
    anchors.fill: parent;
//    contentWidth: grildLayout.width    // The important part
//    contentHeight: grildLayout.height
    property string cardText: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.";
    GridLayout {
        id:grildLayout
        //anchors.fill: parent;
//        width: Math.max(implicitWidth, scrollView.availableWidth)
//        height: Math.max(implicitHeight, scrollView.availableHeight)

        width: parent.parent.width
        //height: parent.parent.height
        columnSpacing: 30
        rowSpacing: 30
        columns: 3

        //rows: 10


        Card{
            headerText: "Card title"
            //Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            footerText: "Card footer"
            headerVisible: false
            footerVisible: true
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with icon"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with switch"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with label"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card with label"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
        }

        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }

        //repeated
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: contentTextArea
            border.color: "blue"
        }
        Card{
            headerText: "Card Outline"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
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
