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
    implicitHeight: layout.implicitHeight
    implicitWidth: layout.implicitWidth
    property alias headerComponent: headerLoader.sourceComponent;
    //property alias headerText: headerText.text
    property alias footerText: footerText.text
    property alias headerVisible: header.visible
    property alias footerVisible: footer.visible
    property alias content: contentLoader.sourceComponent
    property color accentColor: "#d8dbe0"

    layer.enabled: true
    layer.effect:  DropShadow{
        radius: 3
        samples: 40
        verticalOffset: 1
        spread: 0.1
        color: "silver"
    }





    ColumnLayout {
        id: layout;
        anchors.margins: card.border.width
        anchors.fill: parent
        spacing: 0

        Rectangle{
            id:header
            implicitHeight: 46
            width: parent.width
            radius: card.radius
            visible: true


            Loader{
               id: headerLoader
               anchors.fill: parent;
               //width: 100
               //height: 50
               //anchors.margins: header.radius
            }
        }


        Rectangle{
            visible: header.visible
            Layout.fillWidth: true
            implicitHeight: 1
            color: accentColor
        }

        Loader{
            id: contentLoader;
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.topMargin: 25
            Layout.bottomMargin: 25
            Layout.fillHeight: true
            Layout.fillWidth: true
            //Layout.minimumHeight: childrenRect.height
            //Layout.minimumWidth: childrenRect.width
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
