import QtQuick 2.0

Rectangle{
    id: mainRect
    property bool topLeft: true
    property bool topRight: true
    property bool bottomLeft: true
    property bool bottomRight: true

    border.color: color

    Rectangle{
        width: mainRect.radius
        height: mainRect.radius
        color: topLeft ?  'transparent' : mainRect.border.color
        clip: true
        anchors.top: parent.top
        anchors.left: parent.left
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: topLeft ? mainRect.radius : 0
            width: parent.width + radius
            height: parent.height + radius
            color: mainRect.color
            anchors.top: parent.top
            anchors.left: parent.left
        }
    }


    Rectangle{
        width: mainRect.radius
        height: mainRect.radius
        color: topRight ?  'transparent' : mainRect.border.color
        clip: true
        anchors.top: parent.top
        anchors.right: parent.right
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: topRight ? mainRect.radius : 0
            width: parent.width + radius
            height: parent.height + radius
            color: mainRect.color
            anchors.top: parent.top
            anchors.right: parent.right
        }
    }


    Rectangle{
        width: mainRect.radius
        height: mainRect.radius
        color: bottomLeft ?  'transparent' : mainRect.border.color
        clip: true
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: bottomLeft ? mainRect.radius : 0
            width: parent.width + radius
            height: parent.height + radius
            color: mainRect.color
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }
    }


    Rectangle{
        width: mainRect.radius
        height: mainRect.radius
        color: bottomRight ?  'transparent' : mainRect.border.color
        clip: true
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: bottomRight ? mainRect.radius : 0
            width: parent.width + radius
            height: parent.height + radius
            color: mainRect.color
            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }
    }
}
