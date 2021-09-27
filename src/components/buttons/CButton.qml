import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
Button {
    id: control
    property color color;
    property color borderColor : "transparent"
    property int   borderWidth : 0;
    property color textColor
    property int radius: 4
    property int shadowRadius: 4;
    property real shadowSpread: 0.1
    implicitHeight: 35
    implicitWidth: 120
    hoverEnabled: true
    onPressed: forceActiveFocus();
    layer.enabled: true

    layer.effect:  DropShadow{
        id: dropShadow
        radius: shadowRadius
        samples: 40
        verticalOffset: 1
        spread: 0.1
        color: "silver"
        cached: true
    }

    transitions: Transition {
        reversible: true
        from: "*"
        to: "hovered"
        ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }
    }

    background: Rectangle{
        id: backgroundRect
        color: control.color
        radius: control.radius
        border.color: control.borderColor
        border.width: control.borderWidth
    }


    contentItem: Item {
        Text{
            anchors.fill: parent;
            //id: content
            text: control.text
            font: control.font
            color: control.textColor
            //opacity: enabled ? 1.0 : 0.3
            //color: control.down ? "#17a81a" : "#21be2b"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: control.text? true : false
            //elide: Text.ElideRight
        }
        Image{
            anchors.fill: parent;
            source: icon.source
            antialiasing: true
            sourceSize.width: icon.width
            sourceSize.height: icon.height
            layer.enabled: icon.color? true : false
            layer.effect: ColorOverlay{color: icon.color}
            visible: control.icon.source ? true : false
        }
    }

    states: [
        State{
            name: "pressed"
            when: pressed
            extend: "active"
            PropertyChanges {target: backgroundRect; color: darkerColor(1.3)}
        },

        State{
            name: "active"
            when: activeFocus
            extend: "hovered"
            PropertyChanges {target: control; shadowRadius: 16;}
            PropertyChanges {target: control; shadowSpread: 1;}
        },
        State{
            name: "hovered"
            when: hovered
            PropertyChanges {target: backgroundRect; color: darkerColor(1.1)}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: control; opacity: 0.6;}
        }
    ]

    function darkerColor(factor){
        return Qt.darker(control.color,factor);
    }

}
