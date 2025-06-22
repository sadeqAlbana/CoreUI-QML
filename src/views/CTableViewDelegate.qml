

/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls
import CoreUI

TableViewDelegate {
    id: control
    clip: true
    text: model.display ?? ""
    hoverEnabled: true
    TableView.editDelegate: CTableViewEditDelegate {}
    // onSelectedChanged: {
    //     console.log("selected : " + model.display + selected);
    // }
    implicitHeight: 50

    onHoveredChanged: {
        //        if(control.tableView instanceof CTableView){
        if (hovered) {
            control.tableView.hoveredRow = row
        }
        //        }
    }

    contentItem: Text {
        font: control.font
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    // MouseArea {
    //     anchors.fill: parent
    //     acceptedButtons: Qt.LeftButton
    //     onPressed: mouse => {
    //                    if(mouse.button===Qt.RightButton || mouse.button===Qt.MiddleButton){
    //                        mouse.accepted=false;
    //                    }
    //                }

    //     onClicked: mouse => {
    //                    // control.select(ItemSelectionModel.Select)


    //                    if(mouse.button===Qt.LeftButton && mouse.modifiers & Qt.ControlModifier){
    //                        mouse.accepted = true
    //                        if(control.selected){
    //                            control.select(ItemSelectionModel.Clear)
    //                        }else{
    //                            control.select(ItemSelectionModel.Select)
    //                        }
    //                    }else{
    //                        mouse.accepted=false;
    //                    }

    //                }
    //     onPressAndHold: {
    //         CoreUI.copyToClipBoard(model.edit)
    //         mouse.accepted = false
    //     }
    // }

    background: Rectangle {
        color: switch (control.tableView.selectionBehavior) {
               case TableView.SelectCells:
               {
                   control.hovered
                           || control.current ? Qt.lighter(
                                                    "#3399ff",
                                                    1.4) : control.tableView.currentRow === row ? control.palette.inactive.highlight : control.tableView.alternatingRows ? row % 2 == 0 ? control.palette.alternateBase : control.palette.base : control.palette.base
               }
               break
               case TableView.SelectRows:
               {

                   control.selected ? control.palette.active.highlight : (!(control.tableView.hoveredRow === row) || (row === control.tableView.currentRow) ? //fix
                                                                                                                                                                        control.tableView.currentRow === model.row ? control.palette.active.highlight : control.tableView.alternatingRows ? model.row % 2 == 0 ? control.palette.alternateBase : control.palette.base : control.palette.base : control.palette.shadow)
               }
               break
               case TableView.SelectColumns:
               {
                   control.tableView.currentColumn === model.column ? control.palette.active.highlight : control.tableView.alternatingRows ? model.row % 2 == 0 ? control.palette.alternateBase : control.palette.base : control.palette.base
               }
               break
               case TableView.SelectionDisabled:
               {
                   control.palette.base
               }
               break
               }

        border.color: control.palette.shadow
        border.width: control.tableView.selectionBehavior
                      === TableView.SelectCells ? control.current ? 1 : 0 : 0
    }

    property var select: function (selectionOption) {
        if (control.tableView.selectionModel) {
            if (control.tableView.selectionBehavior == TableView.SelectRows) {
                // control.tableView.selectionModel.select(
                //             control.tableView.model.index(row, column),
                //             selectionOption)
                for (var i = 0; i < control.tableView.columns; i++) {
                    control.tableView.selectionModel.select(
                                control.tableView.model.index(row, i),
                                selectionOption)
                }
            } else if (control.tableView.selectionBehavior == TableView.SelectColumns) {
                for (var j = 0; j < control.tableView.rows; j++) {
                    control.tableView.selectionModel.select(
                                control.tableView.model.index(j, column),
                                selectionOption)
                }
            } else if (control.tableView.selectionBehavior == TableView.SelectCells) {
                control.tableView.selectionModel.select(control.tableView.model.index(
                                                         row, column),
                                                     selectionOption)
            }
        }
    }
}
