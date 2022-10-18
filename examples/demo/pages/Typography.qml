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
        implicitWidth: card.implicitWidth
        contentHeight: card.implicitHeight

        Card {
            id: card
            anchors.fill: parent
            title: qsTr("Headings")
            header.visible: true
            Layout.alignment: Qt.AlignTop
            padding: 25

            ColumnLayout{
                anchors.fill: parent
                CLabel{
                    text: qsTr("Documentation and examples for Bootstrap typography, including global settings, headings, body text, lists, and more.")

                }

                CTableView{
                    id: tableView
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    implicitHeight: contentHeight*4
                    model: JsonModel{
                        JsonModelColumn { key: "heading";  displayName: "Heading"}
                        JsonModelColumn { key: "example";  displayName: "Example"}

                        records:[
                            {heading:"<code style='color: #D63384'>&lt;h1&gt;&lt;/h1&gt;</code>",example:"<h1>h1. Bootstrap heading</h1>"},
                            {heading:"<code style='color: #D63384'>&lt;h2&gt;&lt;/h2&gt;</code>",example:"<h2>h2. Bootstrap heading</h2>"},
                            {heading:"<code style='color: #D63384'>&lt;h3&gt;&lt;/h3&gt;</code>",example:"<h3>h3. Bootstrap heading</h3>"},
                            {heading:"<code style='color: #D63384'>&lt;h4&gt;&lt;/h4&gt;</code>",example:"<h4>h4. Bootstrap heading</h4>"},
                            {heading:"<code style='color: #D63384'>&lt;h5&gt;&lt;/h5&gt;</code>",example:"<h5>h5. Bootstrap heading</h5>"},
                            {heading:"<code style='color: #D63384'>&lt;h6&gt;&lt;/h6&gt;</code>",example:"<h6>h6. Bootstrap heading</h6>"},

                        ]
                    }

                    rowHeightProvider: function(){return 65}

//                    horizontalHeaderView: HorizontalHeaderView{
//                        reuseItems: false
//                        syncView: tableView
//                        implicitHeight: 60
//                        parent: tableView
//                        anchors.left: parent.left
//                        z:100
//                        height: 60
//                        clip: tableView.clip
//                        boundsBehavior: tableView.boundsBehavior

//                        delegate: Text{
//                            text: display
//                        }
//                    }

                    delegate: CLabel{
                        text: display?? " "
                        horizontalAlignment: Text.AlignLeft
                        textFormat: Text.RichText
                        Rectangle{
                            width: parent.width
                            color: palette.shadow
                            height: 1
                            anchors.bottom: parent.bottom
                        }
                    }
                }
            }

        } //card end
    }
}
