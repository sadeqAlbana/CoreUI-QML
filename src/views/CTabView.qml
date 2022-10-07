import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


Page {
    id: control
    default property alias content: stack.children
    padding: 20
    header: TabBar{

        TabButton{
            text: qsTr("Test");
                    width: implicitWidth
        }
    }

    StackLayout{
        id: stack
        anchors.fill: parent;
    }
}
