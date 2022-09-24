import QtQuick
import QtQuick.Layouts
import CoreUI.Base
import QtQuick.Controls
import CoreUI.Forms
import CoreUI.Buttons
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs
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
            title: "Standard Buttons"
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            padding: 25

             GridLayout {
                columns: 9
                rowSpacing: 30
                columnSpacing: 45
                anchors.fill: parent;

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Normal"
                    //bottomPadding: 25
                }

                CButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }

                CButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Active State"
                }

                CButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }

                CButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled"

                }

                CButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                    enabled: false

                }

                CButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                    enabled: false
                }



            }
        }//card end



        Card{
            title: "Outline Buttons"
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            padding: 25

             GridLayout {
                columns: 9
                rowSpacing: 30
                columnSpacing: 45
                anchors.fill: parent

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Normal"
                    //bottomPadding: 25
                }

                CButtonOutline{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }



                CButtonOutline{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CButtonOutline{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CButtonOutline{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Active State"
                }

                CButtonOutline{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }

                CButtonOutline{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CButtonOutline{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CButtonOutline{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CButtonOutline{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled"

                }

                CButtonOutline{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButtonOutline{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                    enabled: false

                }

                CButtonOutline{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButtonOutline{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CButtonOutline{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButtonOutline{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                    enabled: false

                }

                CButtonOutline{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CButtonOutline{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                    enabled: false
                }

            }
        }//card end


        Card{
            title: "Ghost Buttons"
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            padding: 25
             GridLayout {
                columns: 9
                rowSpacing: 30
                columnSpacing: 45
                anchors.fill: parent

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Normal"
                    //bottomPadding: 25
                }

                CGhostButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                    //borderWidth: 0
                }

                CGhostButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }



                CGhostButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CGhostButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CGhostButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CGhostButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CGhostButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CGhostButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Active State"
                }

                CGhostButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                }

                CGhostButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }

                CGhostButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CGhostButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CGhostButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CGhostButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CGhostButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CGhostButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled"

                }

                CGhostButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                    enabled: false

                }

                CGhostButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                    enabled: false

                }

                CGhostButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                    enabled: false

                }

                CGhostButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CGhostButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                    enabled: false

                }

                CGhostButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                    enabled: false

                }

                CGhostButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CGhostButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                    enabled: false
                }

            }
        }//card end



        Card{
            title: "Pill Buttons"
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            padding: 25
             GridLayout {
                columns: 9
                rowSpacing: 30
                columnSpacing: 45
                anchors.fill: parent;

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Normal"
                    //bottomPadding: 25
                }

                CPillButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                    radius: height
                }

                CPillButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }

                CPillButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CPillButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CPillButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CPillButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CPillButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CPillButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Active State"
                }

                CPillButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                }

                CPillButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                }

                CPillButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                }

                CPillButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                }

                CPillButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                }

                CPillButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                }

                CPillButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                }

                CPillButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled"

                }

                CPillButton{
                    text: "Primary"
                    color: "#321fdb"
                    textColor: "#ffffff"
                    enabled: false

                }

                CPillButton{
                    text: "Secondary"
                    color: "#ced2d8"
                    textColor: "#4F5D73"
                    enabled: false

                }

                CPillButton{
                    text: "Success"
                    color: "#2eb85c"
                    textColor: "#ffffff"
                    enabled: false

                }

                CPillButton{
                    text: "Warning"
                    color: "#f9b115"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CPillButton{
                    text: "Danger"
                    color: "#e55353"
                    textColor: "#ffffff"
                    enabled: false

                }

                CPillButton{
                    text: "Info"
                    color: "#39f"
                    textColor: "#ffffff"
                    enabled: false

                }

                CPillButton{
                    text: "Light"
                    color: "#ebedef"
                    textColor: "#4f5d73"
                    enabled: false

                }

                CPillButton{
                    text: "Dark"
                    color: "#636f83"
                    textColor: "#ffffff"
                    enabled: false

                }



            }
        }//card end
    }
}
