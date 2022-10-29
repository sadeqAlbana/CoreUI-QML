import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import CoreUI.Forms
import CoreUI.Buttons
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs
import CoreUI.Impl
import QtQuick.Controls.Basic
import CoreUI.Palettes
import CoreUI.Views
import CoreUI.Base

Page {
    id: page
    title: qsTr("Breadcrumb")
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
           spacing: 20

           Card{
               Layout.fillWidth: true

               ColumnLayout{
                   anchors.fill: parent
               CLabel{
                  text: qsTr("CoreUI Breadcrumb has been created as an extension of Bootstrap Breadcrumb. Breadcrumb is delivered with some new features, variants, and unique design that matches CoreUI Design System requirements.")
               }
               CLabel{
                   text: qsTr("For more information please visit our official documentation.")
               }
               }
           }//card

           Card{
               title: qsTr("<b>Breadcrumb</b>")
               header.visible: true
               Layout.fillWidth: true
               ColumnLayout{
                   anchors.fill: parent
                   CLabel{
                      text: qsTr("The breadcrumb navigation provides links back to each previous page the user navigated through and shows the current location in a website or an application. You don’t have to add separators, because they automatically added in CSS through ::before and content.")
                      Layout.fillWidth: true
                      wrapMode: Text.WordWrap
                      horizontalAlignment: Text.AlignLeft
                   }

                   CTabView{
                       Layout.fillWidth: true

                       ColumnLayout{
                           Breadcrumb{
                                model: ["Home"]
                                Layout.fillWidth: true
                           }
                           Breadcrumb{
                                model: ["Home","Library"]
                                Layout.fillWidth: true

                           }
                           Breadcrumb{
                                model: ["Home","Library","Data"]
                                Layout.fillWidth: true

                           }
                           Breadcrumb{
                                model: ["Home","Library","Data","Bootstrap"]
                                Layout.fillWidth: true

                           }
                       }
                   }

               }
           }//card

        }//column
    }//flickable
}
