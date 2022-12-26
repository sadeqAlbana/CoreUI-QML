import QtQuick
import QtQuick.Controls.Basic

ListView{
    id: control
    orientation: ListView.Horizontal
    implicitHeight: control.count? control.itemAtIndex(0).implicitHeight : 50
    interactive: false
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
        Text{
            anchors.verticalCenter: parent.verticalCenter
            text: modelData;
            color: index===(parent.ListView.view.count-1)? palette.text : palette.inactive.link
            font.underline: index!==(parent.ListView.view.count-1)
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

}
