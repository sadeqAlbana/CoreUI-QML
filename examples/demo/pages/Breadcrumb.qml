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


           Card{
               ColumnLayout{
                   anchors.fill: parent
               CLabel{
                  text: qsTr("CoreUI Breadcrumb has been created as an extension of Bootstrap Breadcrumb. Breadcrumb is delivered with some new features, variants, and unique design that matches CoreUI Design System requirements.")
               }
               CLabel{
                   text: qsTr("For more information please visit our official documentation.")
               }
               }
           }

        }//column
    }//flickable
}
