import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import CoreUI.Buttons
import CoreUI.Base
import CoreUI
CPage {
    id: control
    default property alias content: stack.data
    palette.window: CoreUI.color(CoreUI.Tab)
    padding: 20
    header: CTabBar{
        id: tabBar
        spacing: 0

        Repeater{

            model: stack.children
            delegate: CTabButton{
                text: model.title?? "N.A"
                icon.name: model.icon? model.icon.name?? "" : ""
                width: implicitWidth

            }

        }
    }

    StackLayout{
        id: stack
        anchors.fill: parent;
        Component.onCompleted: currentIndex= Qt.binding(function(){return tabBar.currentIndex})


    }
}
