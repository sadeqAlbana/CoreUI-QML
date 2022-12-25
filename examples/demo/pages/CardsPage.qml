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
    title: qsTr("Cards")
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
                title: qsTr("<b>Card</b> Example")
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel{
                        text: qsTr("Cards are built with as little markup and styles as possible but still manage to deliver a bunch of control and customization. Built with flexbox, they offer easy alignment and mix well with other Bootstrap components. Cards have no top, left, and right margins by default, so use spacing utilities as needed. They have no fixed width to start, so they’ll fill the full width of its parent.")
                        textFormat: Text.RichText
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAnywhere
                        Layout.fillWidth: true
                    }

                    CLabel{
                        text: qsTr("Below is an example of a basic card with mixed content and a fixed width. Cards have no fixed width to start, so they’ll naturally fill the full width of its parent element. This is easily customized with our varioussizing options.")
                        textFormat: Text.RichText
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAnywhere
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true


                    } //CTabView
                }//ColumnLayout
            } //Card




        }//ColumnLayout
    }
}
