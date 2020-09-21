import QtQuick 2.0
import QtQuick.Controls 2.5

Button {
    id: control
    hoverEnabled: true
    property color color;
    property color hoverColor: Qt.darker(color,1.2)
    property alias border: backgroundRect.border
    property alias textColor: content.color
    property alias radius: backgroundRect.radius
    property string type: "primary"
    implicitHeight: 35
    implicitWidth: 120



    property var types : {
        "primary" : {
            "color" : "#321fdb",
            "borderColor" : "#321fdb",
            "text" : "#fffff"
        },

        "secondary" : {
            "color" : "#ced2d8",
            "borderColor" : "#321fdb",
            "text" : "#ffffff"
        },

        "Success" : {
            "color" : "#2eb85c",
            "borderColor" : "#321fdb",
            "text" : "#ffffff"
        },

        "warning" : {
            "color" : "#f9b115",
            "borderColor" : "#321fdb",
            "text" : "#321fdb"
            },

        "danger" : {
            "color" : "#e55353",
            "borderColor" : "#321fdb",
            "text" : "#ffffff"
            },

        "info" : {
            "color" : "#39f",
            "borderColor" : "#321fdb",
            "text" : "#ffffff"
            },
        "light" : {
            "color" : "#ebedef",
            "borderColor" : "#321fdb",
            "text" : "#615D73"
            },
        "dark" : {
            "color" : "#636f83",
            "borderColor" : "#321fdb",
            "text" : "#ffffff"
            }
    }



    Component.onCompleted: {
//        color="#321fdb"
//        radius=4
//        textColor="#ffffff"
//        text= "Primary"

        console.log("type: " + type)
        console.log(types[type])

        if(type!="")
            var tp=types[type];

        //if(tp!==undefined){
            console.log(tp.text)
            console.log(tp["text"])
            color=tp.color
            textColor=tp.text
        //}


    }

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
            name: "hovered"
            when: hovered
            PropertyChanges {target: backgroundRect; color: hoverColor;}
            //PropertyChanges {target: layer; enabled: true;}
        }
        //        State{
        //            name: "disabled"
        //            when: !enabled
        //            PropertyChanges {target: backgroundRect; color: "#E4E7EA";}
        //        }
    ]
}
