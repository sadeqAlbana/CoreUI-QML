import QtQuick 2.0

Rectangle{
    id: mainRect
    property bool topLeft: true
    property bool topRight: true
    property bool bottomLeft: true
    property bool bottomRight: true



    Rectangle{
        anchors.margins: mainRect.border.width
        radius: topLeft ? mainRect.radius : 0
        height: mainRect.radius*2
        width: mainRect.radius*2

        color: mainRect.color
        anchors.top: parent.top
        anchors.left: parent.left
    }

    Rectangle{
        anchors.margins: mainRect.border.width
        radius: topRight ? mainRect.radius : 0
        height: mainRect.radius*2
        width: mainRect.radius*2
        color: mainRect.color
        anchors.top: parent.top
        anchors.right: parent.right
    }

    Rectangle{
        anchors.margins: mainRect.border.width
        radius: bottomLeft ? mainRect.radius : 0
        height: mainRect.radius*2
        width: mainRect.radius*2
        color: mainRect.color
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    Rectangle{
        anchors.margins: mainRect.border.width
        radius: bottomRight ? mainRect.radius : 0
        height: mainRect.radius*2
        width: mainRect.radius*2
        color: mainRect.color
        anchors.bottom: parent.bottom
        anchors.right: parent.right

    }
}
