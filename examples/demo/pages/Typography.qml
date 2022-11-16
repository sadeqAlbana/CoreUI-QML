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
    title: qsTr("Typography")
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
                title: qsTr("Headings")
                header.visible: true
                Layout.alignment: Qt.AlignTop
                padding: 25
                Layout.fillWidth: true

                ColumnLayout {
                    anchors.fill: parent
                    CLabel {
                        text: qsTr("Documentation and examples for Bootstrap typography, including global settings, headings, body text, lists, and more.")
                    }

                    CTableView {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        implicitHeight: contentHeight
                        model: JsonModel {
                            JsonModelColumn {
                                key: "heading"
                                displayName: "<b>Heading</b>"
                            }
                            JsonModelColumn {
                                key: "example"
                                displayName: "<b>Example</b>"
                            }

                            records: [{
                                    "heading": "<code style='color: #D63384'>&lt;h1&gt;&lt;/h1&gt;</code>",
                                    "example": "<h1>h1. Bootstrap heading</h1>"
                                }, {
                                    "heading": "<code style='color: #D63384'>&lt;h2&gt;&lt;/h2&gt;</code>",
                                    "example": "<h2>h2. Bootstrap heading</h2>"
                                }, {
                                    "heading": "<code style='color: #D63384'>&lt;h3&gt;&lt;/h3&gt;</code>",
                                    "example": "<h3>h3. Bootstrap heading</h3>"
                                }, {
                                    "heading": "<code style='color: #D63384'>&lt;h4&gt;&lt;/h4&gt;</code>",
                                    "example": "<h4>h4. Bootstrap heading</h4>"
                                }, {
                                    "heading": "<code style='color: #D63384'>&lt;h5&gt;&lt;/h5&gt;</code>",
                                    "example": "<h5>h5. Bootstrap heading</h5>"
                                }, {
                                    "heading": "<code style='color: #D63384'>&lt;h6&gt;&lt;/h6&gt;</code>",
                                    "example": "<h6>h6. Bootstrap heading</h6>"
                                }]
                        }

                        rowHeightProvider: function () {
                            return 65
                        }

                        headerDelegate: CLabel {
                            text: display ?? " "
                            horizontalAlignment: Text.AlignLeft
                            textFormat: Text.RichText

                            background: Rectangle {
                                color: palette.base
                            }

                            Rectangle {
                                width: parent.width
                                color: palette.shadow
                                height: 1
                                anchors.bottom: parent.bottom
                            }
                        }
                        delegate: CLabel {
                            text: display ?? " "
                            horizontalAlignment: Text.AlignLeft
                            textFormat: Text.RichText
                            Rectangle {
                                width: parent.width
                                color: palette.shadow
                                height: 1
                                anchors.bottom: parent.bottom
                            }
                        }
                    }
                }
            } //card end

            Card {
                title: qsTr("Headings")
                header.visible: true
                Layout.alignment: Qt.AlignTop
                padding: 25
                Layout.fillWidth: true

                ColumnLayout {
                    anchors.fill: parent
                    CLabel {
                        text: qsTr("<code style='color: #D63384'>.h1</code> through<code style='color: #D63384'>.h6</code> classes are also available, for when you want to match the font styling of a heading but cannot use the associated HTML element.")
                        textFormat: Text.RichText
                    }

                    CLabel{text: qsTr("<h1>h1. Bootstrap heading</h1>")}
                    CLabel{text: qsTr("<h2>h2. Bootstrap heading</h2>")}
                    CLabel{text: qsTr("<h3>h3. Bootstrap heading</h3>")}
                    CLabel{text: qsTr("<h4>h4. Bootstrap heading</h4>")}
                    CLabel{text: qsTr("<h5>h5. Bootstrap heading</h5>")}
                    CLabel{text: qsTr("<h6>h6. Bootstrap heading</h6>")}
                }
            } //card end

            Card {
                title: qsTr("Headings")
                header.visible: true
                Layout.alignment: Qt.AlignTop
                padding: 25
                Layout.fillWidth: true

                ColumnLayout {
                    anchors.fill: parent
                    CLabel {
                        text: qsTr("Traditional heading elements are designed to work best in the meat of your page content. When you need a heading to stand out, consider using adisplay heading—a larger, slightly more opinionated heading style.")
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true

                    }

                    CLabel{text: qsTr("<h1>Display 1</h1>")}
                    CLabel{text: qsTr("<h2>Display 2</h2>")}
                    CLabel{text: qsTr("<h3>Display 3</h3>")}
                    CLabel{text: qsTr("<h4>Display 4</h4>")}
                }
            } //card end
        }
    }
}
