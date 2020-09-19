import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../SharedComponents"
Control{
    id: control
    clip: true
    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"
    padding: 10
    hoverEnabled: true
    wheelEnabled: true


    focus: true
    Keys.onPressed: {
        console.log("key event");

        if(event.key==Qt.Key_Left){
            console.log("key A was pressed");
            event.accepted=true
        }
    }

    focusPolicy: Qt.ClickFocus
    onActiveFocusChanged: {
        console.log(activeFocus);
    }

    onFocusChanged: {
        console.log(focus);
    }



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

    contentItem:     FocusScope {
        id: focusScope
        focus: true

        Rectangle {
            id: input
            focus: true
            color: "red"
            anchors.fill: parent;
            Keys.onPressed: {
                console.log("key event");

                if(event.key==Qt.Key_Left){
                    console.log("key A was pressed");
                    event.accepted=true
                }
            }

            onActiveFocusChanged: {
                console.log(activeFocus);
            }

            onFocusChanged: {
                console.log(focus);
            }
        }
    }

//    contentItem: ListView{
//        id : list
//        clip: true
//        delegate: CheckDelegate{
//            id: listDelegate
//            onCheckedChanged: model.checked=checked
//            width: parent.width;
//            leftInset: backgroundRect.border.width
//            rightInset: backgroundRect.border.width
//            background: RoundedRect{
//                color : "#fff"
//                radius: 4
//            }
//            text: model.text
//            highlighted: ListView.isCurrentItem;
//            onClicked: {
//                if (list.currentIndex !== index) {
//                    list.currentIndex = index
//                }
//            }

//        }
//        model: ListModel {

//            ListElement { text: "Option #1"; checked : false;}
//            ListElement { text: "Option #2"; checked : false;}
//            ListElement { text: "Option #3"; checked : false;}
//            ListElement { text: "Option #4"; checked : false;}
//            ListElement { text: "Option #5"; checked : false;}
//            ListElement { text: "Option #6"; checked : false;}
//            ListElement { text: "Option #7"; checked : false;}
//            ListElement { text: "Option #8"; checked : false;}
//            ListElement { text: "Option #9"; checked : false;}
//            ListElement { text: "Option #10"; checked : false;}
//        }
//    }
}
