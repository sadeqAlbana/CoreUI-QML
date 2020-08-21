import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5



Rectangle{
    id: card
    color : "#fff"
    border.color: "red"
    radius: 25
    smooth: true
    antialiasing: true

    ColumnLayout {
        anchors.margins: card.border.width
        anchors.fill: parent
        spacing: 0

        Rectangle{
            id:header
            width: parent.width
            height: 46
            radius: card.radius
            //color: card.color
            color: "pink"
            Rectangle{
                height: parent.radius
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                color: parent.color
            }
        }


        Rectangle{
            width: parent.width
            height: 1
            //color: "#d8dbe0";
            color: "blue"
        }



        Rectangle{
            width: parent.width
            //height: card.height-header.height-footer.height
            Layout.fillHeight: true
            //color: card.color
            color: "yellow"
        }

        Rectangle{
            width: parent.width
            height: 1
            //color: "#d8dbe0";
            color: "blue"
        }


        Rectangle{
            id:footer
            width: parent.width
            height: 46
            radius: card.radius
            //color: card.color
            color: "pink"

            Rectangle{
                height: parent.radius
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                color: parent.color
            }
        }
    }



    Component{
        id :semiRoundedRect
        Rectangle{

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
