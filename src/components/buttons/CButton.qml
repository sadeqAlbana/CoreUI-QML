import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Button {
    id: control
    hoverEnabled: true
    property color color;
    property color hoverColor: Qt.darker(color,1.1)
    property color disabledColor: Qt.lighter(color,1.1)

    property alias border: backgroundRect.border
    property color textColor
    property alias radius: backgroundRect.radius
    property string type: ""
    property bool outline: false
    implicitHeight: 35
    implicitWidth: 120
    radius: 4

    layer.enabled: !outline
    layer.effect:  DropShadow{
        radius: 4
        samples: 40
        verticalOffset: 1
        spread: 0.1
        color: "silver"
    }

    property var types : {
        "primary" : {
            "color" : "#321fdb",
            "borderColor" : "#321fdb",
            "text" : "#ffffff",
        },

        "secondary" : {
            "color" : "#ced2d8",
            "borderColor" : "#ced2d8",
            "text" : "#4F5D73"
        },

        "success" : {
            "color" : "#2eb85c",
            "borderColor" : "##2eb85c",
            "text" : "#ffffff"
        },

        "warning" : {
            "color" : "#f9b115",
            "borderColor" : "#321fdb",
            "text" : "#4f5d73"
        },

        "danger" : {
            "color" : "#e55353",
            "borderColor" : "#e55353",
            "text" : "#ffffff"
        },

        "info" : {
            "color" : "#39f",
            "borderColor" : "#39f",
            "text" : "#ffffff"
        },
        "light" : {
            "color" : "#ebedef",
            "borderColor" : "#ebedef",
            "text" : "#4f5d73"
        },
        "dark" : {
            "color" : "#636f83",
            "borderColor" : "#636f83",
            "text" : "#ffffff"
        }
    }

    transitions: Transition {
        reversible: true
        from: "*"
        to: "hovered"
        ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }
    }

    Component.onCompleted: {
        if(type=="")
            return;

        var tp=types[type];

        if(tp!==undefined){
            color=tp.color
            textColor=tp.text
            border.color=color;
        }





    }

    MouseArea{
        anchors.fill: parent;
        cursorShape: Qt.PointingHandCursor
    }

    background: Rectangle{
        id: backgroundRect
        color: outline ? "white" :  control.color
    }

    contentItem: Text {
        id: content
        text: control.text
        font: control.font
        color: outline ? control.color : control.textColor
        //opacity: enabled ? 1.0 : 0.3
        //color: control.down ? "#17a81a" : "#21be2b"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //elide: Text.ElideRight
    }

    states: [
        //        State{
        //            name: "rejected and active"
        //            when:  !acceptableInput && activeFocus
        //            PropertyChanges {target: backgroundRect.border; color: "red";}
        //            PropertyChanges {target: layer; enabled: true;}
        //            PropertyChanges {target: textField; glowColor: "#F2A8A8";}
        //        },
        //        State{
        //            name: "rejected"
        //            when: !acceptableInput
        //            PropertyChanges {target: backgroundRect.border; color: "red";}
        //        },
        State{
            name: "active"
            when: activeFocus
            PropertyChanges {target: backgroundRect; color: hoverColor;}
            //PropertyChanges {target: layer; enabled: true;}
        },
        State{
            name: "outlineHovered"
            extend: "hovered"
            when: hovered && outline
            PropertyChanges {target: content; color: textColor;}
        },

        State{
            name: "hovered"
            when: hovered
            PropertyChanges {target: backgroundRect; color: hoverColor;}
        },
                State{
                    name: "disabled"
                    when: !enabled
                    PropertyChanges {target: control; opacity: 0.6;}
                }
    ]
}
