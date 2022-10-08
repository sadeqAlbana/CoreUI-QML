import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import CoreUI.Buttons
import CoreUI.Base
Page {
    id: control
    default property alias content: stack.children
    padding: 20
    header: CTabBar{

        CTabButton{
            text: qsTr("Test");
            width: implicitWidth

        }
    }

    StackLayout{
        id: stack
        anchors.fill: parent;
    }
}
