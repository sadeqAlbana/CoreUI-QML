import Qt5Compat.GraphicalEffects
import QtQuick

OpacityMask {
    id: control
    property int radius: 5
    required property Item item;
    maskSource: Item {
        width: item.width
        height: item.height
        Rectangle {
            anchors.centerIn: parent
            width: item.width
            height: item.height
            radius: control.radius;
        }
    }
}
