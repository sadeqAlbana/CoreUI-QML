import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../SharedComponents"
TextField {
    id:textField
    selectByMouse: true
    implicitHeight: 35
    layer.enabled: false
    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"

    background: RoundedRect{
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
            name: "rejected and active"
            when: validator!==null && !acceptableInput && activeFocus
            PropertyChanges {target: backgroundRect.border; color: "red";}
            PropertyChanges {target: layer; enabled: true;}
            PropertyChanges {target: textField; glowColor: "#F2A8A8";}
        },
        State{
            name: "rejected"
            when: validator!==null && !acceptableInput
            PropertyChanges {target: backgroundRect.border; color: "red";}
        },
        State{
            name: "active"
            when: activeFocus
            PropertyChanges {target: backgroundRect.border; color: "#8AD4EE";}
            PropertyChanges {target: layer; enabled: true;}
        }
    ]

    Component.onCompleted: {
        console.log(validator);
    }


}
