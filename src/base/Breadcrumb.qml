import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

ListView{
    id: control
    orientation: ListView.Horizontal
    implicitHeight: control.count? control.itemAtIndex(0).implicitHeight : 50
    interactive: false
    signal clicked(var itemData)
    delegate: Row{
        height: ListView.view.height
        topPadding: 5
        bottomPadding: 5
        Text{
            anchors.verticalCenter: parent.verticalCenter

            text:index===0?"": " / "
            color: palette.text
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        AbstractButton{
            text: modelData.label;
            anchors.verticalCenter: parent.verticalCenter
            onClicked: control.clicked(modelData)

            contentItem:         Text{
                text: modelData.label;
                color: index===(control.count-1)? control.palette.text : control.palette.inactive.link
                font.underline: index!==(control.count-1)
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

        }

    }

}
