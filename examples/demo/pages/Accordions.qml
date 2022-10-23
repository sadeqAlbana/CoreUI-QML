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
    title: qsTr("Accordion")
    background: Rectangle {
        color: "transparent"
    }
    padding: 15

    Flickable {
        id: flickable
        anchors.fill: parent
        implicitWidth: layout.implicitWidth
        contentHeight: layout.implicitHeight

        ColumnLayout{
            id: layout
           anchors.fill: parent;

           Card {
               id: card
               header.visible: false
               Layout.fillWidth: true
               Layout.alignment: Qt.AlignTop
               padding: 25

               ColumnLayout{
                   anchors.fill: parent;
                   spacing: 50
                   CLabel{
                       text: qsTr("CoreUI Accordion has been created as an extension of Bootstrap Accordion. Accordion is delivered with some new features, variants, and unique design that matches CoreUI Design System requirements.")
                       horizontalAlignment: Text.AlignLeft
                       wrapMode: Text.WordWrap
                       Layout.fillWidth: true


                   }

                   CLabel{
                       text: qsTr("For more information please visit our official <a href='https://coreui.io/docs/components/accordion'>documentation.</a>")
                       horizontalAlignment: Text.AlignLeft
                       wrapMode: Text.WordWrap
                       Layout.fillWidth: true
                   }
               }
           } //card end


           Card{
               header.visible: true
               title: qsTr("<b>Accordion</b>")
               Layout.fillWidth: true
               padding: 25

               ColumnLayout{
                   anchors.fill: parent;
                   CLabel{
                       text: qsTr("Click the accordions below to expand/collapse the accordion content.")
                   }

                   CTabView{
                       Layout.fillWidth: true

                       Accordion{

                       }
                   }
               }
           }

        }
    }
}
