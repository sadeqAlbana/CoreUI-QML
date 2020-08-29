import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import "qrc:/CoreUI/components/forms"
ScrollView{
    id:scrollView
    clip: true
    anchors.fill: parent;
    GridLayout {
        id:grildLayout
        width: parent.parent.width
        height: parent.parent.height
        columnSpacing: 30
        rowSpacing: 30
        columns: 2

        Card{
            headerText: "Credit Card"
            Layout.fillWidth: true
            content: ColumnLayout {

                Label{
                    text: "Name";
                    verticalAlignment: Qt.AlignBottom
                    Layout.fillHeight: true
                    Layout.margins: 10
                    color: "#3c4b64"

                }
                CTextInput{
                    placeholderText: "Enter your name"
                    Layout.fillWidth: true
                    Layout.margins: 10
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10

                }

                Label{
                    text: "Credit Card Number";
                    verticalAlignment: Qt.AlignBottom
                    Layout.fillHeight: true
                    Layout.margins: 10
                    color: "#3c4b64"

                }
                CTextInput{
                    placeholderText: "0000 0000 0000 0000"
                    Layout.fillWidth: true
                    Layout.margins: 10
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10

                }

                CComboBox{
                    Layout.fillWidth: true
                    Layout.margins: 10
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                }
            }
        }

        Card{
            headerText: "Company"
            //Layout.alignment: Qt.AlignHCenter
//            Layout.preferredWidth: 488
//            Layout.preferredHeight: 170
            //Layout.fillHeight: true
            Layout.fillWidth: true
            content: FormGroup{

            }
        }
    }
}
