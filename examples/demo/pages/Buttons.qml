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
                title: qsTr("Ghost Buttons")
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
                title: qsTr("Pill Buttons")
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
                        delegate: CPillButton{
                            text: modelData.text
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                    CLabel {
                        text: "Active State"
                    }

                    Repeater{
                        model: page.buttons
                        delegate: CPillButton{
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
                        delegate: CPillButton{
                            text: modelData.text
                            enabled: false
                            palette: page.createPalette(modelData.palette,this)
                        }
                    }

                }
            } //card end
        }
    }
}
