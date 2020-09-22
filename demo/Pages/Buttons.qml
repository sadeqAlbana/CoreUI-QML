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
        columns: 1

        Card{
            headerComponent: CardLabel{
                text: "Standard Buttons"

            }
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10

            content: GridLayout {
                columns: 9
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
                    type: "primary"
                    text: "Primary"
                }

                CButton{
                    type: "secondary"
                    text: "Secondary"
                }

                CButton{
                    type: "success"
                    text: "Success"
                }

                CButton{
                    type: "warning"
                    text: "Warning"
                }

                CButton{
                    type: "danger"
                    text: "Danger"
                }

                CButton{
                    type: "info"
                    text: "Info"
                }

                CButton{
                    type: "light"
                    text: "Light"
                }

                CButton{
                    type: "dark"
                    text: "Dark"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Active State"
                }

                CButton{
                    type: "primary"
                    text: "Primary"


                }

                CButton{
                    type: "secondary"
                    text: "Secondary"
                }

                CButton{
                    type: "success"
                    text: "Success"
                }

                CButton{
                    type: "warning"
                    text: "Warning"
                }

                CButton{
                    type: "danger"
                    text: "Danger"
                }

                CButton{
                    type: "info"
                    text: "Info"
                }

                CButton{
                    type: "light"
                    text: "Light"
                }

                CButton{
                    type: "dark"
                    text: "Dark"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled"
                }

                CButton{
                    type: "primary"
                    text: "Primary"
                    enabled: false
                }

                CButton{
                    type: "secondary"
                    text: "Secondary"
                    enabled: false

                }

                CButton{
                    type: "success"
                    text: "Success"
                    enabled: false

                }

                CButton{
                    type: "warning"
                    text: "Warning"
                    enabled: false

                }

                CButton{
                    type: "danger"
                    text: "Danger"
                    enabled: false

                }

                CButton{
                    type: "info"
                    text: "Info"
                    enabled: false

                }

                CButton{
                    type: "light"
                    text: "Light"
                    enabled: false

                }

                CButton{
                    type: "dark"
                    text: "Dark"
                    enabled: false

                }


            }
        }//card end



        Card{
            headerComponent: CardLabel{
                text: "Outline Buttons"

            }
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10

            content: GridLayout {
                columns: 9
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
                    type: "primary"
                    text: "Primary"
                }

                CButton{
                    type: "secondary"
                    text: "Secondary"
                }

                CButton{
                    type: "success"
                    text: "Success"
                }

                CButton{
                    type: "warning"
                    text: "Warning"
                }

                CButton{
                    type: "danger"
                    text: "Danger"
                }

                CButton{
                    type: "info"
                    text: "Info"
                }

                CButton{
                    type: "light"
                    text: "Light"
                }

                CButton{
                    type: "dark"
                    text: "Dark"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Active State"
                }

                CButton{
                    type: "primary"
                    text: "Primary"


                }

                CButton{
                    type: "secondary"
                    text: "Secondary"
                }

                CButton{
                    type: "success"
                    text: "Success"
                }

                CButton{
                    type: "warning"
                    text: "Warning"
                }

                CButton{
                    type: "danger"
                    text: "Danger"
                }

                CButton{
                    type: "info"
                    text: "Info"
                }

                CButton{
                    type: "light"
                    text: "Light"
                }

                CButton{
                    type: "dark"
                    text: "Dark"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled"
                }

                CButton{
                    type: "primary"
                    text: "Primary"
                    enabled: false
                }

                CButton{
                    type: "secondary"
                    text: "Secondary"
                    enabled: false

                }

                CButton{
                    type: "success"
                    text: "Success"
                    enabled: false

                }

                CButton{
                    type: "warning"
                    text: "Warning"
                    enabled: false

                }

                CButton{
                    type: "danger"
                    text: "Danger"
                    enabled: false

                }

                CButton{
                    type: "info"
                    text: "Info"
                    enabled: false

                }

                CButton{
                    type: "light"
                    text: "Light"
                    enabled: false

                }

                CButton{
                    type: "dark"
                    text: "Dark"
                    enabled: false

                }


            }
        }//card end




    }
}
