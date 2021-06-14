import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
ComboBox{
    id:control
    background: Rectangle{
        implicitHeight: 40
        id: rect;
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4

    }

    delegate: ItemDelegate {
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
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
        source: control
        cached: true
    }
    onActiveFocusChanged: {
        state=activeFocus ? "active" : ""
        layer.enabled=activeFocus ? true : false
    }
}
