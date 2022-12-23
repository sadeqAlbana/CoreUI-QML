import QtQuick
import QtQuick.Layouts
import CoreUI.Base
import QtQuick.Controls
import QtQuick.Controls.Basic
import CoreUI.Forms
import CoreUI.Buttons
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs
import CoreUI.Impl
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

                    CLabel{
                        text: qsTr("Custom <code style='color: #D63384'>&lt;select&gt;</code> menus need only a custom class, <code style='color: #D63384'>.form-select</code> to trigger the custom styles. Custom styles are limited to the <code style='color: #D63384'>&lt;select&gt;</code>’s initial appearance and cannot modify the <code style='color: #D63384'>&lt;option&gt;</code>s due to browser limitations.");
                        textFormat: Text.RichText
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignLeft

                    }
                    CTabView {
                        Layout.fillWidth: true
                        GridLayout {
                            columns: 1
                            CComboBox{objectName: "select"; Layout.fillWidth: true;
                                model: [qsTr("Open this select menu"), "One", "Two", "Three"]
                            }
                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card


            Card {
                title: qsTr("<b>Select</b> Sizing")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel{
                        text: qsTr("You may also choose from small and large custom selects to match our similarly sized text inputs.");
                        textFormat: Text.RichText
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignLeft
                    }
                    CTabView {
                        Layout.fillWidth: true
                        GridLayout {
                            columns: 1
                            rowSpacing : 10
                            CComboBox{objectName: "select"; Layout.fillWidth: true;
                                implicitHeight: 45;
                                model: [qsTr("Open this select menu"), "One", "Two", "Three"]
                            }

                            CComboBox{objectName: "select"; Layout.fillWidth: true;
                                model: [qsTr("Open this select menu"), "One", "Two", "Three"]
                            }

                            CLabel{
                                text: qsTr("The <code style='color: #D63384'>&lt;multiple&gt;</code> attribute is also supported:");

                                textFormat: Text.RichText
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                                horizontalAlignment: Text.AlignLeft
                            }
                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card



            Card {
                title: qsTr("<b>Select</b> Disabled")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel{
                        text: qsTr("Add the The <code style='color: #D63384'>disabled</code> boolean attribute on a select to give it a grayed out appearance and remove pointer events.");
                        textFormat: Text.RichText
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        horizontalAlignment: Text.AlignLeft

                    }
                    CTabView {
                        Layout.fillWidth: true
                        GridLayout {
                            columns: 1
                            CComboBox{objectName: "select"; Layout.fillWidth: true;
                                model: [qsTr("Open this select menu"), "One", "Two", "Three"]
                                enabled: false
                            }
                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card

        }//ColumnLayout
    }
}
