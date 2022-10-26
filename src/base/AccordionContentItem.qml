import QtQuick

Item{
    id: control
    required property bool expanded
        implicitHeight: header.implicitHeight + (control.expanded? content.implicitHeight : 0)
        implicitWidth: Math.max(header.implicitWidth, control.expanded? content.implicitWidth : 0)

        Text{
            id: header
//            implicitHeight: 50
//            implicitWidth: 200

            anchors.left: parent.left
            anchors.right: parent.right;
            anchors.top: parent.top
            text: "test"
        }



        Rectangle{
            id: content
            visible: control.expanded

            implicitHeight: control.expanded? 100: 0
            implicitWidth: 250
            width: 200
            color: "red"
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right: parent.right;
        }
    }
