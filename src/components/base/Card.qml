import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import "../SharedComponents"


Rectangle{
    id: card
    color : "#fff"
    border.color: "#d8dbe0";
    radius: 4
    smooth: true
    antialiasing: true

    ColumnLayout {
        anchors.margins: card.border.width
        anchors.fill: parent
        spacing: 0

        RoundedRect{
            id:header
            bottomLeft: false
            bottomRight: false
            height: 46
            width: parent.width
            radius: card.radius
            visible: true

            Text{
                id: headerText
                height: parent.height
                anchors.left: parent.left
                color: "#3c4b64"
                text: "Card Header"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 20
            }
        }


        Rectangle{
            visible: header.visible
            width: parent.width
            height: 1
            color: card.border.color
        }



        RoundedRect{
            width: parent.width
            Layout.fillHeight: true
            color: card.color
            topLeft: !header.visible
            topRight: !header.visible
            bottomLeft: !footer.visible
            bottomRight: !footer.visible
            radius: card.radius
        }

        Rectangle{
            visible: footer.visible
            width: parent.width
            height: 1
            color: card.border.color
        }



        RoundedRect{
            id:footer
            topLeft: false
            topRight: false
            height: 46
            width: parent.width
            radius: card.radius
            visible: false

            Text{
                id: footerText
                height: parent.height
                anchors.left: parent.left
                color: "#3c4b64"
                text: "Card Footer"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 20
            }
        }
    }




}






















//Rectangle {
//    id: card
//    color: "#fff";
//    border.color: "#d8dbe0";
//    radius: 7
//    property alias title: headerText.text;
//    Rectangle{
//        id: header
//        x:card.border.width;
//        y:0
//        width: parent.width-(card.border.width*2)
//        //anchors.leftMargin: card.border.width
//        radius: parent.radius
//        height: 46
//        //color: "red"
//        //border.color: parent.border.color

//        Rectangle {
//          id: squareRect

//          //color: header.border.color
//          height: header.radius
//          anchors.bottom : header.bottom
//          anchors.left : header.left
//          anchors.right : header.right

//        }

//       Text{
//           id: headerText
//           height: parent.height
//           anchors.left: parent.left
//           color: "#3c4b64"
//           text: "Card title"
//           horizontalAlignment: Text.AlignHCenter
//           verticalAlignment: Text.AlignVCenter
//           anchors.leftMargin: 20
//       }
//    }
//}
