import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
TextField {
    id:textField
    selectByMouse: true

    background: Rectangle{
        id: rect;
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4

    }

    layer.enabled: false
    layer.effect: Glow {
        id: glow
        samples: 8
        spread: 1
        color: "#DCD9F9"
        transparentBorder: true
    }

    states: State{
        name: "active"
        when: activeFocus
        PropertyChanges {target: rect.border; color: "#8AD4EE";}
        PropertyChanges {target: layer; enabled: true;}
    }
}
