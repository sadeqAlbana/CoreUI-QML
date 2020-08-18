import QtQuick 2.0
import QtGraphicalEffects 1.0
Rectangle {
    color: "#fff";
    border.color: "#d8dbe0";
    property alias titl: headerText.text;
    border.width: 2
    Rectangle{
        id: cardHeader
        x:0;
        y:0
        width: parent.width
        height: 46
        border.color: "#d8dbe0"



       Text{
           id: headerText
           height: parent.height
           anchors.left: parent.left
           color: "#3c4b64"
           text: "Card title"
           horizontalAlignment: Text.AlignHCenter
           verticalAlignment: Text.AlignVCenter
           anchors.leftMargin: 20
       }
    }
    layer.enabled: true
    layer.effect: DropShadow {
        //search for box shadow and border color in html card
        transparentBorder: false
        color: "silver"
//        horizontalOffset: 8
//        verticalOffset: 8
    }
}
