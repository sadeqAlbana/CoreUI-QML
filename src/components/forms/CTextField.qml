import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../SharedComponents"

TextField {
    id:control
    selectByMouse: true

    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"
    property string leftIcon
    property string rightIcon



    property alias helpBlock: helpBlockLoader.sourceComponent
    signal entered(var text)
    onAccepted: entered(control.text)

    bottomInset: helpBlockLoader.visible ? helpBlockLoader.implicitHeight : 0
    bottomPadding:bottomInset+padding

    leftInset: leftDelegateContainer.visible ? leftDelegateContainer.implicitWidth : 0
    leftPadding:leftDelegateContainer.visible ? leftInset+padding : leftPadding

    rightInset: rightDelegateContainer.visible ? rightDelegateContainer.implicitWidth : 0
    rightPadding:rightDelegateContainer.visible ? rightInset+padding : rightPadding




    component Delegate :
        ItemDelegate { //change to item delegate ?
        visible: (icon.source!="")
        //padding: height/2
        anchors.fill: parent;
        implicitWidth: 50
        implicitHeight: parent.height
        contentItem: Image{
            anchors.centerIn: parent
            source: icon.source;
            sourceSize.width: parent.height*0.5
            sourceSize.height: parent.height*0.5
            fillMode: Image.PreserveAspectFit
            layer.enabled: true
            layer.effect: ColorOverlay{
                color:"#5C6873"
            }
        }
    }



    component HelpBlockDelegate:    Label{
        topPadding: 5
        font.pixelSize: 14
        font.italic: true
    }



    background: RoundedRect{
        //border.width: 3
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
            cached: true
        }


    }

    RoundedRect{
        id: leftDelegateContainer;
        clip: true
        visible: leftDelegate.visible;
        topRight: false
        bottomRight: false
        radius: control.background.radius
        anchors.top: control.top
        anchors.bottom: control.bottom
        anchors.left: control.left
        anchors.bottomMargin: control.bottomInset
        anchors.rightMargin: -1*(control.border.width)

        anchors.right: backgroundRect.left
        //color: "red"
        //implicitWidth: leftDelegateLoader.implicitWidth
        implicitHeight: parent.height
        implicitWidth: leftDelegate.implicitWidth
        color: "#F0F3F5"
        z: visible ? -2 : 0

        Component.onCompleted: {
            control.background.topLeft=Qt.binding(function(){return !visible })
            control.background.bottomLeft=Qt.binding(function(){return !visible })
            border.color= control.border.color
            border.width=control.border.width
        }

        Delegate{
            id: leftDelegate
            icon.source: control.leftIcon;
            onClicked: control.entered(control.text)

        }
    }

    RoundedRect{
        id: rightDelegateContainer;
        clip: true
        visible: rightDelegate.visible
        topLeft: false
        bottomLeft: false
        radius: control.background.radius
        anchors.top: control.top
        anchors.bottom: control.bottom
        anchors.right: control.right
        anchors.bottomMargin: control.bottomInset
        anchors.leftMargin: -1*(control.border.width)
        anchors.left: backgroundRect.right
        implicitHeight: parent.height
        implicitWidth: rightDelegate.implicitWidth
        color: "#F0F3F5"
        z: visible ? -2 : 0
        Component.onCompleted: {
            control.background.topRight=Qt.binding(function(){return !visible })
            control.background.bottomRight=Qt.binding(function(){return !visible })
            border.color= control.border.color
        }

        //children[0]:rightDelegate

        Delegate{
            id: rightDelegate
            icon.source: control.rightIcon
            onClicked: control.entered(control.text)
        }
    }



    states: [
        State{
            name: "rejected and active"
            when:  !acceptableInput && activeFocus
            PropertyChanges {target: backgroundRect.border; color: "red";}
            PropertyChanges {target: backgroundRect.layer; enabled: true;}
            PropertyChanges {target: control; glowColor: "#F2A8A8";}
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
        anchors.bottom: control.bottom;
        anchors.left: control.left
        anchors.right: control.right
    }
}
