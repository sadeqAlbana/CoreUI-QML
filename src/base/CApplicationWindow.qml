import QtQuick
import QtQuick.Controls.Basic
import CoreUI.Palettes
import QtQuick.Window

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("CoreUI")
    visibility: Window.Maximized
    //minimumWidth: Math.min(rootLoader.implicitWidth, Screen.width)
//    minimumHeight: rootLoader.implicitHeight
    LayoutMirroring.enabled: (Qt.application.layoutDirection === Qt.RightToLeft ? true : false)
    LayoutMirroring.childrenInherit: true
    palette: CPalette {}
    property bool mobileLayout: height > width
    property alias rootLoader: loader


    Loader {
        id: loader
        parent: window.contentItem
        anchors.fill: parent
    }
}
