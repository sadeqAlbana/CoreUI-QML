import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import "qrc:/CoreUI/components/forms"
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
        columnSpacing: 30
        rowSpacing: 30
        columns: 2

        Card{
            headerText: "Credit Card"
            //Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: FormGroup{

            }
        }

        Card{
            headerText: "Company"
            //Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 488
            Layout.preferredHeight: 170
            Layout.fillHeight: true
            Layout.fillWidth: true
            content: FormGroup{

            }
        }
    }
}
