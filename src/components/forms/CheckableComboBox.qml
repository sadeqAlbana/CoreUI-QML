import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
ComboBox{
    id:cb
    background: Rectangle{
        implicitHeight: 40
        id: rect;
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4

    }

    states: State{
        name: "active"
        PropertyChanges {target: rect.border; color: "#8AD4EE";}
    }

    layer.enabled: false
    layer.effect: Glow {
        id: glow
        samples: 8
        spread: 1
        color: "#DCD9F9"
        transparentBorder: true
        source: cb
        cached: true
    }
    onActiveFocusChanged: {
        state=activeFocus ? "active" : ""
        layer.enabled=activeFocus ? true : false
    }

    model: ListModel {
        id: model
        ListElement { text: "Banana" }
        ListElement { text: "Apple" }
        ListElement { text: "Coconut" }
    }

    delegate: CheckDelegate{

    }

}
