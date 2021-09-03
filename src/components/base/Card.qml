import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "qrc:/CoreUI/components/SharedComponents"

Page{
    id: control
    property color accentColor: "#d8dbe0"
    clip: true
    background: Rectangle{
        id: background
        color : "#fff"
        border.color: accentColor
        radius: 4
        smooth: true
        antialiasing: true

        layer.enabled: false
        layer.effect:  DropShadow{
            radius: 3
            samples: 40
            verticalOffset: 1
            spread: 0.1
            color: "silver"
            cached: true
        }
    } //end background

    header: CardLabel{
        visible: control.title !=""
        text: control.title
        font.pixelSize: 22
        bottomPadding: 20
        topPadding: 20
        font.bold: true

    }

    Rectangle{
        visible: header? header.visible : false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: background.border.width
        anchors.rightMargin: background.border.widt
        anchors.bottom: contentItem.top
        implicitHeight: 1
        color: "#d8dbe0"
    }

    Rectangle{
        visible: footer? footer.visible : false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: background.border.width
        anchors.rightMargin: background.border.width
        anchors.top: contentItem.bottom
        implicitHeight: 1
        color: "#d8dbe0"
    }

}
