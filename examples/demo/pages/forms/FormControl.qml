import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Dialogs
import CoreUI.Base
import CoreUI.Forms
import CoreUI.Buttons
import Qt5Compat.GraphicalEffects
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
                title: qsTr("<b>Form Control</b> Basic example")
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
                                items: parent?.children;
                                applyHandler: function(data){}
                            }

                            CLabel{text: qsTr("Email Address");}
                            CTextField{objectName: "email"; placeholderText: "name@example.com";Layout.fillWidth: true;}

                            CLabel{text: qsTr("Example textarea");}
                            CTextArea{objectName: "textarea"; Layout.fillWidth: true;}
                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card


            Card {
                title: qsTr("<b>Form Control</b> Sizing")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20
                    CLabel{
                        text: qsTr("Set heights using classes like <code style='color: #D63384'>.form-control-lg</code> and <code style='color: #D63384'>.form-control-sm</code>.")
                        textFormat: Text.RichText
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAnywhere
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 1

                            CTextField{objectName: "email"; placeholderText: ".form-control-lg"; Layout.fillWidth: true; implicitHeight:50;}
                            CTextField{objectName: "email"; placeholderText: "Default input";    Layout.fillWidth: true; }
                            CTextField{objectName: "email"; placeholderText: ".form-control-sm"; Layout.fillWidth: true; implicitHeight: 30;}

                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card


            Card {
                title: qsTr("<b>Form Control</b> Disabled")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20
                    CLabel{
                        text: qsTr("Add the <code style='color: #D63384'>disabled</code> boolean attribute on an input to give it a grayed out appearance and remove pointer events.")
                        textFormat: Text.RichText
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAnywhere
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 1

                            CTextField{objectName: "input"; placeholderText: qsTr("Disabled input");  enabled: false;  Layout.fillWidth: true; implicitHeight:50;}
                            CTextField{objectName: "input2"; placeholderText: qsTr("Disabled readonly input"); enabled: false;  readOnly: true;    Layout.fillWidth: true; }

                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card

            Card {
                title: qsTr("<b>Form Control</b> Readonly")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20
                    CLabel{
                        text: qsTr("Add the <code style='color: #D63384'>readonly</code> boolean attribute on an input to prevent modification of the input’s value. Read-only inputs appear lighter (just like disabled inputs), but retain the standard cursor.")
                        textFormat: Text.RichText
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAnywhere
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 1

                            CTextField{objectName: "input2"; placeholderText: qsTr("Readonly input here..."); readOnly: true;    Layout.fillWidth: true; }

                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card


            Card {
                title: qsTr("<b>Form Control</b> Readonly plain text")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20
                    CLabel{
                        text: qsTr("If you want to have <code style='color: #D63384'>&lt;input readonly&gt;</code> elements in your form styled as plain text, use the <code style='color: #D63384'>.form-control-plaintext</code> class to remove the default form field styling and preserve the correct margin and padding.")
                        textFormat: Text.RichText
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAnywhere
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 2
                            columnSpacing: 100
                            rowSpacing: 25
                            CLabel{text: qsTr("Email Address");}
                            CLabel{objectName: "email"; text: "email@example.com";Layout.fillWidth: true; horizontalAlignment: Text.AlignLeft}

                            CLabel{text: qsTr("Password");}
                            CTextField{objectName: "password"; Layout.fillWidth: true; echoMode: TextInput.Password}
                        }//GridLayout
                    } //CTabView

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 2
                            columnSpacing: 100
                            rowSpacing: 25
                            CLabel{text: "email@example.com"}
                            CTextField{objectName: "password";  echoMode: TextInput.Password; text: "1234"}

                            CButton{
                                palette: BrandPrimary{}
                                text: qsTr("Confirm identity")

                            }
                        }//GridLayout
                    } //CTabView

                }//ColumnLayout
            } //Card

            Card {
                title: qsTr("<b>Form Control</b> File input")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 1
                            rowSpacing: 10

                            CLabel{text: qsTr("Default file input example");}
                            FileInput{objectName: "file";      Layout.fillWidth: true; }

                            CLabel{text: qsTr("Multiple files input example");}
                            FileInput{objectName: "multiple";  Layout.fillWidth: true; dialog.fileMode: FileDialog.OpenFiles}

                            CLabel{text: qsTr("Disabled file input example");}
                            FileInput{objectName: "disabled";  Layout.fillWidth: true; enabled: false;}

                            CLabel{text: qsTr("Small file input example");}
                            FileInput{objectName: "small";     Layout.fillWidth: true; implicitHeight: 30;}

                            CLabel{text: qsTr("Large file input example");}
                            FileInput{objectName: "large";     Layout.fillWidth: true; implicitHeight: 50;}


                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card

            Card {
                title: qsTr("<b>Form Control</b> Color")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 1
                            rowSpacing: 10

                            CLabel{text: qsTr("Color picker");}

                            ColorPicker{

                            }


                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card

            Card {
                title: qsTr("<b>Form Control</b> Datalists")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 1
                            rowSpacing: 10

                            CLabel{
                                textFormat: Text.RichText
                                text: qsTr("Datalists allow you to create a group of <code style='color: #D63384'>&lt;option&gt;</code>s that can be accessed (and autocompleted) from within an <code style='color: #D63384'>&lt;input&gt;</code>. These are similar to <code style='color: #D63384'>&lt;select&gt;</code> elements, but come with more menu styling limitations and differences. While most browsers and operating systems include some support for <code style='color: #D63384'>&lt;datalist&gt;</code> elements, their styling is inconsistent at best.");
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                                horizontalAlignment: Text.AlignLeft

                            }

                            CLabel{
                                textFormat: Text.RichText
                                text: qsTr("Learn more about <a href='https://caniuse.com/datalist'>support for datalist elements</a>.");
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                                horizontalAlignment: Text.AlignLeft
                            }


                            CTabView {
                                Layout.fillWidth: true

                                GridLayout {
                                    columns: 1
                                    rowSpacing: 10

                                    CLabel{text: qsTr("Datalist example");}

                                    CTextField{placeholderText: qsTr("Type to search..."); Layout.fillWidth: true;}


                                }//GridLayout
                            } //CTabView


                        }//GridLayout
                    } //CTabView
                }//ColumnLayout
            } //Card

        }//ColumnLayout
    }
}
