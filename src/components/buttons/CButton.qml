import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
Button {
    id: control
    hoverEnabled: true
    property color color;

    onPressed: forceActiveFocus();



    property alias border: backgroundRect.border
    property color textColor
    property alias radius: backgroundRect.radius
    property bool outline: false
    property int shadowRadius: 4;
    property real shadowSpread: 0.1
    implicitHeight: 35
    implicitWidth: 120
    radius: 4

    layer.enabled: true
    layer.effect:  DropShadow{
        id: dropShadow
        radius: shadowRadius
        samples: 40
        verticalOffset: 1
        spread: 0.1
        color: "silver"
    }


    transitions: Transition {
        reversible: true
        from: "*"
        to: "hovered"
        ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }
    }


    //    MouseArea{
    //        anchors.fill: parent;
    //        cursorShape: Qt.PointingHandCursor
    //    }

    background: Rectangle{
        id: backgroundRect
        color: control.color
    }


    contentItem: Text {
        id: content
        text: control.text
        font: control.font
        color: control.textColor
        //opacity: enabled ? 1.0 : 0.3
        //color: control.down ? "#17a81a" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //elide: Text.ElideRight
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
