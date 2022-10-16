import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import CoreUI.Buttons
import CoreUI.Base
import CoreUI
CPage {
    id: control
    default property alias content: stack.children
    palette.window: CoreUI.color(CoreUI.Tab)
    padding: 20
    header: CTabBar{
        spacing: 0
        id: tabBar
        CTabButton{
            text: qsTr("Preview");
            icon.name: "cil-media-play"
            width: implicitWidth

        }

        CTabButton{
            text: qsTr("Code");
            icon.name: "cil-code"
            width: implicitWidth
        }
    }

    StackLayout{
        id: stack
        anchors.fill: parent;
        currentIndex: tabBar.currentIndex
    }
}
