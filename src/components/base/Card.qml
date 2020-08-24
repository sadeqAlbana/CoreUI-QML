import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import "../SharedComponents"


RoundedRect{
    id: card
    color : "#fff"
    border.color: "#d8dbe0";
    radius: 4
    smooth: true
    antialiasing: true

//    implicitHeight: 100
//    implicitWidth: 100
    property alias headerText: headerText.text
    property alias footerText: footerText.text
    property alias headerVisible: header.visible
    property alias footerVisible: footer.visible
    property alias content: contentRect.contentComponent
    property color accentColor: "#d8dbe0"


    ColumnLayout {
        anchors.margins: card.border.width
        anchors.fill: parent
        spacing: 0

        Rectangle{
            id:header
            implicitHeight: 46
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
            Layout.fillWidth: true
            implicitHeight: 1
            color: accentColor
        }



        Rectangle{
            id: contentRect
            property Component contentComponent
            //width: parent.width
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: card.color
            radius: card.radius

            Loader{
                anchors.fill: parent;
                anchors.margins: 5
                id: contentLoader;
                sourceComponent: contentRect.contentComponent
            }
        }

        Rectangle{
            visible: footer.visible
            Layout.fillWidth: true
            implicitHeight: 1
            color: accentColor
        }

        Rectangle{
            id:footer
            implicitHeight: 46
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



//Rectangle{
//    id: card
//    color : "#fff"
//    border.color: "#d8dbe0";
//    radius: 4
//    smooth: true
//    antialiasing: true
//    property alias headerText: headerText.text
//    property alias footerText: footerText.text
//    property alias headerVisible: header.visible
//    property alias footerVisible: footer.visible
//    property alias content: contentRect.contentComponent
//    property color accentColor: "#d8dbe0"


//    ColumnLayout {
//        anchors.margins: card.border.width
//        anchors.fill: parent
//        spacing: 0

//        RoundedRect{
//            id:header
//            bottomLeft: false
//            bottomRight: false
//            height: 46
//            width: parent.width
//            radius: card.radius
//            visible: true

//            Text{
//                id: headerText
//                height: parent.height
//                anchors.left: parent.left
//                color: "#3c4b64"
//                text: "Card Header"
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                anchors.leftMargin: 20
//            }
//        }


//        Rectangle{
//            visible: header.visible
//            width: parent.width
//            height: 1
//            color: accentColor
//        }



//        RoundedRect{
//            id: contentRect
//            property Component contentComponent
//            width: parent.width
//            Layout.fillHeight: true
//            color: card.color
//            topLeft: !header.visible
//            topRight: !header.visible
//            bottomLeft: !footer.visible
//            bottomRight: !footer.visible
//            radius: card.radius

//            Loader{
//                anchors.fill: parent;
//                anchors.margins: 5
//                id: contentLoader;
//                sourceComponent: contentRect.contentComponent
//            }
//        }

//        Rectangle{
//            visible: footer.visible
//            width: parent.width
//            height: 1
//            color: accentColor
//        }



//        RoundedRect{
//            id:footer
//            topLeft: false
//            topRight: false
//            height: 46
//            width: parent.width
//            radius: card.radius
//            visible: false

//            Text{
//                id: footerText
//                height: parent.height
//                anchors.left: parent.left
//                color: "#3c4b64"
//                text: "Card Footer"
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                anchors.leftMargin: 20
//            }
//        }
//    }
//}

