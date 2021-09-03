import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

MenuItem {
    id: control;
    implicitHeight: 50
    icon.color: "#3C4B64"

    contentItem: Row{
        spacing: 10

        Image{
            source: control.icon.source
            width: control.icon.width
            height: control.icon.height
            sourceSize.width: control.icon.width
            sourceSize.height: control.icon.height
            antialiasing: true
            anchors.verticalCenter: parent.verticalCenter
            layer.enabled: true
            layer.effect: ColorOverlay{color: icon.color}

        }

        Text{
            text: control.text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 20

        }

    } //contentItem end

} //MenuItem end
