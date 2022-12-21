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
import Qt.labs.qmlmodels
import JsonModels

Page {
    id: page
    title: qsTr("Form Control")
    background: Rectangle {
        color: "transparent"
    }
    padding: 15

    Flickable {
        id: flickable
        anchors.fill: parent
        implicitWidth: layout.implicitWidth
        contentHeight: layout.implicitHeight

        ColumnLayout {
            id: layout
            anchors.fill: parent

            Card {
                title: qsTr("<b>Select</b> Default")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 1
                            CForm{
                                items: parent.children
                            }

                            CLabel{text: qsTr("Email Address");}
                            CTextField{objectName: "email"; placeholderText: "name@example.com";Layout.fillWidth: true;}

                            CLabel{text: qsTr("Example textarea");}
                            CTextArea{objectName: "textarea"; Layout.fillWidth: true;}
                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card




        }//ColumnLayout
    }
}
