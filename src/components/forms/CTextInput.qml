import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../SharedComponents"
TextField {
    id:textField
    selectByMouse: true
    layer.enabled: false
    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"

    background: RoundedRect{
        id: backgroundRect;
        implicitHeight: 35

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
}
