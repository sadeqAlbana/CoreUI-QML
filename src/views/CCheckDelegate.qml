import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
CTableViewDelegate {
    id: control


    contentItem: CheckBox{
        Material.accent: Material.Blue
        text: model.display
        onCheckStateChanged: model.checkState=checkState
    }
}
