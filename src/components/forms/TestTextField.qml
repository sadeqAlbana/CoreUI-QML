import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../SharedComponents"
TextField {
    id:control
    selectByMouse: true
    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"
    property alias leftRectContent: leftRectLoader.sourceComponent
    property alias rightRectContent: rightRectLoader.sourceComponent
    bottomInset: helpBlockLoader.visible ? helpBlockLoader.implicitHeight : 0
    bottomPadding:bottomInset+padding

    leftInset: leftRect.visible ? leftRect.implicitWidth : 0
    leftPadding:leftRect.visible ? leftInset+padding : leftPadding

    rightInset: rightRect.visible ? rightRect.implicitWidth : 0
    rightPadding:rightRect.visible ? rightInset+padding : rightPadding
    property alias helpBlock: helpBlockLoader.sourceComponent



    background: RoundedRect{
        id: backgroundRect;
        implicitHeight: 35
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4

        layer.effect: Glow {
           id: glowItem
           samples: 8
           spread: 1
           color: glowColor
           transparentBorder: true
       }


    }

    RoundedRect{
        id: leftRect;
        clip: true
        visible: leftRectLoader.sourceComponent!==null
        topRight: false
        bottomRight: false
        radius: control.background.radius
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: control.bottomInset
        anchors.leftMargin: -1*(control.border.width+control.radius)
        color: "red"
        //implicitWidth: leftRectLoader.implicitWidth
        implicitHeight: parent.height-1
        implicitWidth: leftRectLoader.implicitWidth ? leftRectLoader.implicitWidth : 35
        //color: "#F0F3F5"
        z:-2

        Component.onCompleted: {
            control.background.topLeft=Qt.binding(function(){return !visible })
            control.background.bottomLeft=Qt.binding(function(){return !visible })
            border.color= control.border.color
        }

        Loader{
            id:leftRectLoader
            clip: true
            anchors.fill: parent;
            anchors.margins: leftRect.border.width*2
        }
    }

    RoundedRect{
        id: rightRect;
        visible: leftRectLoader.sourceComponent!==null
        topLeft: false
        bottomLeft: false
        radius: control.background.radius
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: control.bottomInset
        //implicitWidth: leftRectLoader.implicitWidth
        color: "#F0F3F5"
        z:-1
        Component.onCompleted: {
            control.background.topRight=Qt.binding(function(){return !visible })
            control.background.bottomRight=Qt.binding(function(){return !visible })
            border.color= control.border.color
        }

        Loader{
            id:rightRectLoader
            anchors.fill: parent;
        }
    }



    states: [
        State{
            name: "rejected and active"
            when:  !acceptableInput && activeFocus
            PropertyChanges {target: backgroundRect.border; color: "red";}
            PropertyChanges {target: layer; enabled: true;}
            PropertyChanges {target: textField; glowColor: "#F2A8A8";}
        },
        State{
            name: "rejected"
            when: !acceptableInput
            PropertyChanges {target: backgroundRect.border; color: "red";}
        },
        State{
            name: "active"
            when: activeFocus
            PropertyChanges {target: backgroundRect.border; color: "#8AD4EE";}
            PropertyChanges {target: backgroundRect.layer; enabled: true;}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: backgroundRect; color: "#E4E7EA";}
        }
    ]

    Loader{
        id: helpBlockLoader
        visible: sourceComponent!==null
        anchors.bottom: parent.bottom;
        anchors.left: parent.left
        anchors.right: parent.right
    }




}
