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
import CoreUI.Views
Page {
    id: page
    title: qsTr("Buttons")
    background: Rectangle {
        color: "transparent"
    }
    padding: 15
    function createPalette(pal, parent) {
        return Qt.createComponent(
                    "qrc:///CoreUI/Palettes/" + pal + ".qml").createObject(
                    parent)
    }

    property var buttons: [{
            "text": qsTr("Primary"),
            "palette": "BrandPrimary"
        }, {
            "text": qsTr("Secondary"),
            "palette": "BrandSecondary"
        }, {
            "text": qsTr("Success"),
            "palette": "BrandSuccess"
        }, {
            "text": qsTr("Danger"),
            "palette": "BrandDanger"
        }, {
            "text": qsTr("Warning"),
            "palette": "BrandWarning"
        }, {
            "text": qsTr("Info"),
            "palette": "BrandInfo"
        }, {
            "text": qsTr("Light"),
            "palette": "BrandLight"
        }, {
            "text": qsTr("Dark"),
            "palette": "BrandDark"
        }]

    Flickable {
        id: flickable
        anchors.fill: parent
        //implicitWidth: grildLayout.implicitWidth
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

                ColumnLayout {
                    anchors.fill: parent

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("CoreUI includes a bunch of predefined Bootstrap buttons, each serving its own semantic purpose. CoreUI also offers some unique buttons styles.\n\nButtons show what action will happen when the user clicks or touches it. Bootstrap buttons are used to initialize operations, both in the background or foreground of an experience.\n")
                        Layout.fillWidth: true
                    }

                    CTabView{
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 10
                            rowSpacing: 25
                            columnSpacing: 5

                            CLabel {
                                text: "Normal"
                                Layout.rightMargin: 150
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    palette: page.createPalette(modelData.palette,
                                                                this)
                                }
                            }

                            CLabel{
                                text: "<a href='https://google.com'> link</a>"
                            }

                            CLabel {
                                text: "Active State"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    down: true
                                    palette: page.createPalette(modelData.palette,
                                                                this)
                                }
                            }
                            CLabel{
                                text: "<a href='https://google.com'> link</a>"
                            }

                            CLabel {
                                text: "Disabled"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    enabled: false
                                    palette: page.createPalette(modelData.palette,
                                                                this)
                                }
                            }
                            CLabel{
                                text: "<a href='https://google.com'> link</a>"
                                enabled: false
                            }
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
                        Layout.rightMargin: 150

                    }

                    Repeater {
                        model: page.buttons
                        delegate: CButtonOutline {
                            text: modelData.text
                            palette: page.createPalette(modelData.palette, this)
                        }
                    }

                    CLabel {
                        text: "Active State"
                    }

                    Repeater {
                        model: page.buttons
                        delegate: CButtonOutline {
                            text: modelData.text
                            down: true
                            palette: page.createPalette(modelData.palette, this)
                        }
                    }

                    CLabel {
                        text: "Disabled"
                    }

                    Repeater {
                        model: page.buttons
                        delegate: CButtonOutline {
                            text: modelData.text
                            enabled: false
                            palette: page.createPalette(modelData.palette, this)
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
                        Layout.rightMargin: 150

                    }

                    Repeater {
                        model: page.buttons
                        delegate: CGhostButton {
                            text: modelData.text
                            palette: page.createPalette(modelData.palette, this)
                        }
                    }

                    CLabel {
                        text: "Active State"
                    }

                    Repeater {
                        model: page.buttons
                        delegate: CGhostButton {
                            text: modelData.text
                            down: true
                            palette: page.createPalette(modelData.palette, this)
                        }
                    }

                    CLabel {
                        text: "Disabled"
                    }

                    Repeater {
                        model: page.buttons
                        delegate: CGhostButton {
                            text: modelData.text
                            enabled: false
                            palette: page.createPalette(modelData.palette, this)
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

                    Repeater {
                        model: page.buttons
                        delegate: CPillButton {
                            text: modelData.text
                            palette: page.createPalette(modelData.palette, this)
                        }
                    }

                    CLabel {
                        text: "Active State"
                    }

                    Repeater {
                        model: page.buttons
                        delegate: CPillButton {
                            text: modelData.text
                            down: true
                            palette: page.createPalette(modelData.palette, this)
                        }
                    }

                    CLabel {
                        text: "Disabled"
                    }

                    Repeater {
                        model: page.buttons
                        delegate: CPillButton {
                            text: modelData.text
                            enabled: false
                            palette: page.createPalette(modelData.palette, this)
                        }
                    }
                }
            } //card end
        }
    }
}
