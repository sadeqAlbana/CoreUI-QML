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
                    model: TableModel{
                        TableModelColumn { display: "heading"; edit: "Test" }
                        TableModelColumn { display: "example" }
                        rows:[
                            {heading:"<h1></h1>",example:"<h1>h1. Bootstrap heading</h1>"},
                            {heading:"<h2></h2>",example:"<h2>h2. Bootstrap heading</h2>"},
                            {heading:"<h3></h3>",example:"<h3>h3. Bootstrap heading</h3>"},
                            {heading:"<h4></h4>",example:"<h4>h4. Bootstrap heading</h4>"},
                            {heading:"<h5></h5>",example:"<h5>h5. Bootstrap heading</h5>"},
                            {heading:"<h6></h6>",example:"<h6>h6. Bootstrap heading</h6>"},

                        ]
                    }

                    rowHeightProvider: function(){return 65}

                    horizontalHeaderView: HorizontalHeaderView{
                        reuseItems: false
                        syncView: tableView
                        implicitHeight: 60
                        parent: tableView
                        anchors.left: parent.left
                        z:100
                        height: 60
                        clip: tableView.clip
                        boundsBehavior: tableView.boundsBehavior

                        delegate: Text{
                            text: model.edit
                            color: "red"
                        }
                    }

                    delegate: CLabel{
                        text: display?? " "
                        textFormat: column===0? Text.PlainText : Text.RichText
                        horizontalAlignment: Text.AlignLeft

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
