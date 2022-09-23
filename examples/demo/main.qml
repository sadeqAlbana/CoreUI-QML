import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import CoreUI
import CoreUI.Impl
import CoreUI.Base
import CoreUI.Buttons
import CoreUI.Forms
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("CoreUI")
    visibility: Window.Maximized

    id: rootItem

    Loader{
        id: rootLoader
        anchors.fill: parent;

        sourceComponent: MainScreen{
            anchors.fill: parent;
        }
    }

    RoundedRect{

    }

    Card{

    }
    CButton{

    }

    CComboBox{

    }

}
