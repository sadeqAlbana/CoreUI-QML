import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls.impl 2.15
RoundButton {
    id: control
    property alias color : control.palette.button
    property color borderColor : "transparent"
    property int   borderWidth : 0;
    property alias textColor : control.palette.buttonText
    //property int radius: 4
    property int shadowRadius: 4;
    property real shadowSpread: 0.1
    radius: 4
//    leftPadding: implicitContentWidth/2
//    rightPadding: implicitContentWidth/2

    clip: true
    palette.shadow: "silver"
    //implicitHeight: 35
    //implicitWidth: 120
    hoverEnabled: true
    onPressed: forceActiveFocus();
    layer.enabled: true

    layer.effect:  DropShadow{
        id: dropShadow
        radius: shadowRadius
        samples: 40
        verticalOffset: 1
        spread: 0.1
        color: palette.shadow
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
        color: palette.button
        radius: control.radius
        border.color: control.borderColor
        border.width: control.borderWidth
    }


//    contentItem: IconLabel{
//        spacing: control.spacing
//        mirrored: control.mirrored
//        display: control.display

//        icon: control.icon
//        text: control.text
//        font: control.font
//        color: control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText
//    }




    states: [
        State{
            name: "pressed"
            when: pressed
            extend: "active"
            PropertyChanges {target: control; palette.button: darkerColor(1.3); explicit: true}
        },

        State{
            name: "active"
            when: activeFocus
            extend: "hovered"
            PropertyChanges {target: control; shadowRadius: 16; explicit: true}
            PropertyChanges {target: control; shadowSpread: 1; explicit: true}
        },
        State{
            name: "hovered"
            when: hovered
            PropertyChanges {target: control; palette.button: darkerColor(1.1); explicit: true}
        },
        State{
            name: "disabled"
            when: !enabled
            PropertyChanges {target: control; opacity: 0.6; explicit: true}
        }
    ]

    function darkerColor(factor){
        return Qt.darker(palette.button,factor);
    }

}
