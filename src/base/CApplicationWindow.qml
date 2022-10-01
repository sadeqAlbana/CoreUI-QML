import QtQuick
import QtQuick.Controls.Basic
import CoreUI.Palettes
ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("CoreUI")
    visibility: Window.Maximized
    minimumWidth: rootLoader.implicitWidth
    minimumHeight: rootLoader.implicitHeight
    LayoutMirroring.enabled: (Qt.application.layoutDirection === Qt.RightToLeft ? true : false)
    LayoutMirroring.childrenInherit: true
    palette: CPalette{}

    property Loader rootLoader : Loader{
        parent: window.contentItem
        anchors.fill: parent;
    }
}
