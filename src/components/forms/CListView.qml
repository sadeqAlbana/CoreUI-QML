import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../SharedComponents"
ListView{
    layer.enabled: false
    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"

     RoundedRect{
         anchors.fill: parent;
        id: backgroundRect;
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4
        z:-1
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




    delegate: CheckDelegate{
        onCheckedChanged: model.checked=checked
        width: parent.width
        text: model.text

    }
    model: ListModel {

        ListElement { text: "Option #1"; checked : false;}
        ListElement { text: "Option #2"; checked : false;}
        ListElement { text: "Option #3"; checked : false;}
        ListElement { text: "Option #4"; checked : false;}
        ListElement { text: "Option #5"; checked : false;}
        ListElement { text: "Option #6"; checked : false;}
        ListElement { text: "Option #7"; checked : false;}
        ListElement { text: "Option #8"; checked : false;}
        ListElement { text: "Option #9"; checked : false;}
        ListElement { text: "Option #10"; checked : false;}
    }
}
