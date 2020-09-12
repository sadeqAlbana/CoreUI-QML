import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../SharedComponents"
TextField {
    id:control
    selectByMouse: true
    layer.enabled: false


    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"

//    property alias leftRectContent: leftRectLoader.sourceComponent
//    property alias rightRectContent: rightRectLoader.sourceComponent


    text: "test"
    bottomInset: helpBlockLoader.visible ? helpBlockLoader.implicitHeight : 0
    bottomPadding:bottomInset+padding

    leftInset: leftRect.visible ? leftRect.implicitWidth : 0
    leftPadding:leftRect.visible ? leftInset+padding : leftPadding
//    leftInset: 35
//    leftPadding: 35
    property alias helpBlock: helpBlockLoader.sourceComponent



    background: RoundedRect{
        id: backgroundRect;
        implicitHeight: 35
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4



    }

    RoundedRect{
        id: leftRect;
        //visible: leftRectLoader.sourceComponent!==null
        visible: true
        topRight: false
        bottomRight: false
        radius: control.background.radius
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: control.bottomInset
        //implicitWidth: leftRectLoader.implicitWidth
        implicitWidth: 35
        color: "#F0F3F5"
        z:-1
        Component.onCompleted: {
            control.background.topLeft=Qt.binding(function(){return !visible })
            control.background.bottomLeft=Qt.binding(function(){return !visible })
            border.color= control.border.color
        }
    }

     Glow {
        id: glowItem
        samples: 8
        spread: 1
        //color: glowColor
        transparentBorder: true
        anchors.fill: background
        color: "transparent"
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
            PropertyChanges {target: layer; enabled: true;}
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
