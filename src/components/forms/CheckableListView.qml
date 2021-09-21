import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../SharedComponents"
Control{ //use Container instead ?
    id: control
    clip: true
    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"
    property alias list : list;
//    MouseArea {
//        anchors.fill: parent
//        acceptedButtons: Qt.LeftButton
//        propagateComposedEvents: true
//        onClicked: {
//            console.log("clicked control")
//            mouse.accepted = false
//            control.forceActiveFocus();
//        }
//    }
    padding: 10
    //hoverEnabled: true
    //wheelEnabled: true

    background: RoundedRect{
        anchors.fill: parent;
        id: backgroundRect;
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4

    }

    layer.effect: Glow {
        id: glowItem
        samples: 8
        spread: 1
        color: glowColor
        transparentBorder: true
        cached: true
    }

    states: [
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

    contentItem: ListView{
        id : list
        clip: true
        delegate: CheckDelegate{
            id: listDelegate
            onCheckedChanged: model.checked=checked
            width: parent.width;
            leftInset: backgroundRect.border.width
            rightInset: backgroundRect.border.width
            background: RoundedRect{
                color : "#fff"
                radius: 4
            }
            text: model.display
            highlighted: ListView.isCurrentItem;
            onClicked: {
                control.forceActiveFocus();
                if (list.currentIndex !== index) {
                    list.currentIndex = index
                }
            }

        }
    }

}
