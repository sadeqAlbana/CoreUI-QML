import QtQuick
import QtQuick.Layouts
import CoreUI.Base
import QtQuick.Controls
import CoreUI.Forms
import CoreUI.Buttons
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs
import CoreUI.Impl
import QtQuick.Controls.Basic
import CoreUI.Palettes
Page {
    id: page;
    title: qsTr("Dashboard")
    background: Rectangle{color:"transparent";}
    padding: 15
    function createPalette(pal,parent){
        return Qt.createComponent("qrc:///CoreUI/Palettes/"+pal+".qml").createObject(parent)
    }

    property var buttons: [{"text":qsTr("Primary"), "palette":"BrandPrimary"},
        {"text":qsTr("Secondary"), "palette":"BrandSecondary"},
        {"text":qsTr("Success"), "palette":"BrandSuccess"},
            {"text":qsTr("Danger"), "palette":"BrandDanger"},
            {"text":qsTr("Warning"), "palette":"BrandWarning"},
            {"text":qsTr("Info"), "palette":"BrandInfo"},
            {"text":qsTr("Light"), "palette":"BrandLight"},
            {"text":qsTr("Dark"), "palette":"BrandDark"}
        ]


    Flickable {
        id: flickable;
        anchors.fill: parent;
        implicitWidth: grildLayout.implicitWidth
        contentHeight: grildLayout.implicitHeight

        GridLayout {
            id: grildLayout
            width: parent.parent.width
            height: parent.parent.height
            Layout.minimumWidth: implicitWidth
            columnSpacing: 30
            rowSpacing: 30
            columns: 1

            Card {
                title: "Buttons"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                GridLayout {
                    anchors.fill: parent
                    columns: 9
                    rowSpacing: 25
                    columnSpacing: 5

                    CLabel {
                        text: "Normal"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CButton{
                            text: modelData.text
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                    CLabel {
                        text: "Active State"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CButton{
                            text: modelData.text
                            down: true
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                    CLabel {
                        text: "Disabled"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CButton{
                            text: modelData.text
                            enabled: false
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                }
            } //card end

            Card {
                title: "Outline Buttons"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                GridLayout {
                    anchors.fill: parent
                    columns: 9
                    rowSpacing: 25
                    columnSpacing: 5

                    CLabel {
                        text: "Normal"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CButtonOutline{
                            text: modelData.text
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                    CLabel {
                        text: "Active State"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CButtonOutline{
                            text: modelData.text
                            down: true
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                    CLabel {
                        text: "Disabled"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CButtonOutline{
                            text: modelData.text
                            enabled: false
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                }
            } //card end

            Card {
                title: "GhostButtons"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                GridLayout {
                    anchors.fill: parent
                    columns: 9
                    rowSpacing: 25
                    columnSpacing: 5

                    CLabel {
                        text: "Normal"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CGhostButton{
                            text: modelData.text
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                    CLabel {
                        text: "Active State"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CGhostButton{
                            text: modelData.text
                            down: true
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                    CLabel {
                        text: "Disabled"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CGhostButton{
                            text: modelData.text
                            enabled: false
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                }
            } //card end

            Card {
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
                    anchors.fill: parent

                    Label {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        //color: "#3c4b64"
                        text: "Normal"
                        //bottomPadding: 25
                    }

                    CPillButton {
                        text: "Primary"
                        //color: "#321fdb"
                        //text//color: "#ffffff"
                        radius: height
                    }

                    CPillButton {
                        text: "Secondary"
                        //color: "#ced2d8"
                        //text//color: "#4F5D73"
                    }

                    CPillButton {
                        text: "Success"
                        //color: "#2eb85c"
                        //text//color: "#ffffff"
                    }

                    CPillButton {
                        text: "Warning"
                        //color: "#f9b115"
                        //text//color: "#4f5d73"
                    }

                    CPillButton {
                        text: "Danger"
                        //color: "#e55353"
                        //text//color: "#ffffff"
                    }

                    CPillButton {
                        text: "Info"
                        //color: "#39f"
                        //text//color: "#ffffff"
                    }

                    CPillButton {
                        text: "Light"
                        //color: "#ebedef"
                        //text//color: "#4f5d73"
                    }

                    CPillButton {
                        text: "Dark"
                        //color: "#636f83"
                        //text//color: "#ffffff"
                    }

                    Label {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        //color: "#3c4b64"
                        text: "Active State"
                    }

                    CPillButton {
                        text: "Primary"
                        //color: "#321fdb"
                        //text//color: "#ffffff"
                    }

                    CPillButton {
                        text: "Secondary"
                        //color: "#ced2d8"
                        //text//color: "#4F5D73"
                    }

                    CPillButton {
                        text: "Success"
                        //color: "#2eb85c"
                        //text//color: "#ffffff"
                    }

                    CPillButton {
                        text: "Warning"
                        //color: "#f9b115"
                        //text//color: "#4f5d73"
                    }

                    CPillButton {
                        text: "Danger"
                        //color: "#e55353"
                        //text//color: "#ffffff"
                    }

                    CPillButton {
                        text: "Info"
                        //color: "#39f"
                        //text//color: "#ffffff"
                    }

                    CPillButton {
                        text: "Light"
                        //color: "#ebedef"
                        //text//color: "#4f5d73"
                    }

                    CPillButton {
                        text: "Dark"
                        //color: "#636f83"
                        //text//color: "#ffffff"
                    }

                    Label {
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        //color: "#3c4b64"
                        text: "Disabled"
                    }

                    CPillButton {
                        text: "Primary"
                        //color: "#321fdb"
                        //text//color: "#ffffff"
                        enabled: false
                    }

                    CPillButton {
                        text: "Secondary"
                        //color: "#ced2d8"
                        //text//color: "#4F5D73"
                        enabled: false
                    }

                    CPillButton {
                        text: "Success"
                        //color: "#2eb85c"
                        //text//color: "#ffffff"
                        enabled: false
                    }

                    CPillButton {
                        text: "Warning"
                        //color: "#f9b115"
                        //text//color: "#4f5d73"
                        enabled: false
                    }

                    CPillButton {
                        text: "Danger"
                        //color: "#e55353"
                        //text//color: "#ffffff"
                        enabled: false
                    }

                    CPillButton {
                        text: "Info"
                        //color: "#39f"
                        //text//color: "#ffffff"
                        enabled: false
                    }

                    CPillButton {
                        text: "Light"
                        //color: "#ebedef"
                        //text//color: "#4f5d73"
                        enabled: false
                    }

                    CPillButton {
                        text: "Dark"
                        //color: "#636f83"
                        //text//color: "#ffffff"
                        enabled: false
                    }
                }
            } //card end
        }
    }
}
