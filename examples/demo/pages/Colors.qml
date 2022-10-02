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
        implicitWidth: card.implicitWidth
        contentHeight: card.implicitHeight

        Card {
            id: card
            anchors.fill: parent;
            title: qsTr("Ghost Buttons")
            header.visible: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            padding: 25

            GridLayout {
                anchors.fill: parent
                columnSpacing: 60
                rowSpacing: 5


                Repeater {
                    model: page.buttons
                    delegate: Rectangle {
                        implicitWidth: 131
                        implicitHeight: implicitWidth
                        Layout.minimumWidth: 105
                        Layout.minimumHeight: 105
                        Layout.fillWidth: true
                        radius: 5
                        color: palette.inactive.button
                        palette: page.createPalette(modelData.palette, this)
                    }
                }



            }
        } //card end
    }
}
