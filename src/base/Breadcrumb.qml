import QtQuick
import QtQuick.Controls.Basic

ListView{
    id: control
    orientation: ListView.Horizontal
    implicitHeight: control.count? control.itemAtIndex(0).implicitHeight : 50
    interactive: false
    delegate: Row{
        topPadding: 5
        bottomPadding: 5
        Text{
            text:index===0?"": " / "
            color: palette.text
            font.pixelSize: 18
        }
        Text{
            text: modelData;
            color: index===(parent.ListView.view.count-1)? palette.text : palette.inactive.link
            font.underline: index!==(parent.ListView.view.count-1)
            font.pixelSize: 18
        }
    }

}
