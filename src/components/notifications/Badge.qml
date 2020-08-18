import QtQuick 2.12
import QtQuick.Layouts 1.12
Rectangle{
    id: badge;
    property alias textColor: badgeText.color
    property alias text: badgeText.text

    radius: 4
    antialiasing: true
    clip: true
    color: "silver"
    Text {
        id: badgeText
        anchors.fill: parent;
        leftPadding: parent.width/20
        rightPadding : parent.width/20
        bottomPadding: parent.height/20
        topPadding: parent.height/20

        antialiasing: true
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 1
        color: "white"
        text: "badge"
    }

    states:[
        State{
            name: "primary"
            PropertyChanges {target: badge; textColor: "#fff";}
            PropertyChanges {target: badge; color: "#321fdb";}
        },
        State{
            name: "secondary"
            PropertyChanges {target: badge; textColor: "#4f5d73";}
            PropertyChanges {target: badge; color: "#ced2d8";}
        },
        State{
            name: "success"
            PropertyChanges {target: badge; textColor: "#fff";}
            PropertyChanges {target: badge; color: "#2eb85c";}
        },
        State{
            name: "danger"
            PropertyChanges {target: badge; textColor: "#fff";}
            PropertyChanges {target: badge; color: "#e55353";}
        },
        State{
            name: "warning"
            PropertyChanges {target: badge; textColor: "#4f5d73";}
            PropertyChanges {target: badge; color: "#f9b115";}
        },
        State{
            name: "info"
            PropertyChanges {target: badge; textColor: "#fff";}
            PropertyChanges {target: badge; color: "#39f";}
        },
        State{
            name: "light"
            PropertyChanges {target: badge; textColor: "#4f5d73";}
            PropertyChanges {target: badge; color: "#ebedef";}
        },
        State{
            name: "dark"
            PropertyChanges {target: badge; textColor: "#fff";}
            PropertyChanges {target: badge; color: "#636f83";}
        }

    ]


}
