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
    id: page
    title: qsTr("Colors")
    background: Rectangle {
        color: "transparent"
    }
    padding: 15
    leftPadding: width/8
    rightPadding: width/8
    function createPalette(pal, parent) {
        return Qt.createComponent(
                    "qrc:///CoreUI/Palettes/" + pal + ".qml").createObject(
                    parent)
    }

    property var buttons: [{
            "text": qsTr("Brand Primary Color"),
            "palette": "BrandPrimary",
            "hex": "#321fdb",
            "rgb": "rgb(50, 31, 219)"
        }, {
            "text": qsTr("Brand Secondary Color"),
            "palette": "BrandSecondary",
            "hex": "#9da5b1",
            "rgb": "rgb(157, 165, 177)"
        }, {
            "text": qsTr("Brand Success Color"),
            "palette": "BrandSuccess",
            "hex": "#2eb85c",
            "rgb": "rgb(46, 184, 92)"
        }, {
            "text": qsTr("Brand Danger Color"),
            "palette": "BrandDanger",
            "hex": "#e55353",
            "rgb": "rgb(229, 83, 83)"
        }, {
            "text": qsTr("Brand Warning Color"),
            "palette": "BrandWarning",
            "hex": "#f9b115",
            "rgb": "rgb(249, 177, 21)"
        }, {
            "text": qsTr("Brand Info Color"),
            "palette": "BrandInfo",
            "hex": "#3399ff",
            "rgb": "rgb(51, 153, 255)"
        }, {
            "text": qsTr("Brand Light Color"),
            "palette": "BrandLight",
            "hex": "#ebedef",
            "rgb": "rgb(235, 237, 239)"
        },
        {
            "text": qsTr("Brand Dark Color"),
            "palette": "BrandDark",
            "hex": "#4f5d73",
            "rgb": "rgb(79, 93, 115)"
        }
    ]

    Flickable {
        id: flickable
        anchors.fill: parent
        implicitWidth: card.implicitWidth
        contentHeight: card.implicitHeight

        Card {
            id: card
            anchors.fill: parent
            title: qsTr("Theme Colors")
            header.visible: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            padding: 25

            DynamicGridLayout {
                anchors.fill: parent
                columnSpacing: 15
                rowSpacing: 25
                Repeater {
                    model: page.buttons

                    delegate: Column {
                        spacing: 10
                        Layout.alignment: Qt.AlignCenter
                        Rectangle {
                            implicitWidth: 131
                            implicitHeight: implicitWidth
                            Layout.minimumWidth: 105
                            Layout.minimumHeight: 105
                            radius: 5
                            color: palette.inactive.button
                            palette: page.createPalette(modelData.palette, this)
                        }//rectangle
                        CLabel{
                            text: modelData.text
                        }

                        GridLayout{
                            columns: 2
                            rows: 2

                            CLabel{
                                text: qsTr("HEX:")
                                enabled: false
                            }
                            CLabel{
                                text: modelData.hex
                            }

                            CLabel{
                                text: qsTr("RGB:")
                                enabled: false
                            }
                            CLabel{
                                text: modelData.rgb
                            }
                        }
                    }
                }
            }
        } //card end
    }
}
