import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import CoreUI
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
}
