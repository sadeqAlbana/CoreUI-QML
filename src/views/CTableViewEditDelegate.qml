import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
TextField {
    id: control
    width: parent.width
    height: parent.height
    text: model.display?? ""
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    property var commitHandler: function(){
        model.edit = text
    }

    TableView.onCommit: control.commitHandler();
}
