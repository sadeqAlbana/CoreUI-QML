import QtQuick
import QtQuick.Controls.Basic

TabBar {
    id: control

    background: Rectangle{color: control.palette.base

        Rectangle{
            anchors{
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            color: control.palette.shadow
            height: 1
        }
    }
}
