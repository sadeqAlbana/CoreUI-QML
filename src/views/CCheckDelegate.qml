import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
CTableViewDelegate {
    id: control


    contentItem: CheckBox{
        Material.accent: Material.Blue
        text: model.display
        onCheckStateChanged: {

            // console.log("checkstate changed")
            if(checkState===Qt.Checked){
                if(!control.selected){
                    control.select(ItemSelectionModel.Select);
                }
            }
            if(checkState===Qt.Unchecked){
                if(control.selected){
                    control.select(ItemSelectionModel.Clear);
                }
            }
        }
        checked: control.selected
    }

    function select(selectionOption){
        if(TableView.view.selectionModel){
            TableView.view.selectionModel.select(TableView.view.model.index(row,column),selectionOption)
        }
    }


}
