import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
CTableViewDelegate {
    id: control


    contentItem: CheckBox{
        text: model.display
        onCheckStateChanged: model.checkState=checkState
    }
}
