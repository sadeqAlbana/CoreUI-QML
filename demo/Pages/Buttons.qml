import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import "qrc:/CoreUI/components/forms"
import "qrc:/CoreUI/components/buttons"
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.3
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
            headerComponent: CardLabel{
                text: "Standard Buttons"

            }
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10

            content: GridLayout {
                columns: 10
                rowSpacing: 30
                columnSpacing: 45

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Normal"
                    //bottomPadding: 25
                }

                CButton{
                    //text: "test"
                    type: "primary"
                    text: "Primary"
                }

            }
        }//card end


    }
}
