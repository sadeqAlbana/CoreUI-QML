

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

Control {
    id: control
    clip: true
    required property bool selected
    required property bool current
    property string text: model.display ?? ""
    hoverEnabled: true
    TableView.editDelegate: CTableViewEditDelegate {}

    // onSelectedChanged: {
    //     console.log("selected : " + model.display + selected);
    // }
    implicitHeight: 50

    onHoveredChanged: {
        //        if(TableView.view instanceof CTableView){
        if (hovered) {
            TableView.view.hoveredRow = row
        }
        //        }
    }

    contentItem: Text {
        font: control.font
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onPressed: mouse => {

                       //if you accepted mouse then no context menu but checking works
                       //if you reject mouse then context menu but double checkbox
                       console.log("pressed")

                       if(mouse.button==Qt.LeftButton){
                           mouse.accepted = true
                           if(control.selected){
                               control.select(ItemSelectionModel.Clear)
                           }else{
                               control.select(ItemSelectionModel.Select)
                           }
                       }else{
                           console.log("mouse not accepted")
                           mouse.accepted=false;
                       }


                   }

        onClicked: mouse => {
                       console.log("clicked")
                       // control.select(ItemSelectionModel.Select)
                       mouse.accepted = false

                   }
        onPressAndHold: {
            CoreUI.copyToClipBoard(model.edit)
            mouse.accepted = false
        }
    }

    background: Rectangle {
        color: switch (control.TableView.view.selectionBehavior) {
               case TableView.SelectCells:
               {
                   control.hovered
                           || control.current ? Qt.lighter(
                                                    "#3399ff",
                                                    1.4) : control.TableView.view.currentRow === row ? control.palette.inactive.highlight : control.TableView.view.alternatingRows ? row % 2 == 0 ? control.palette.alternateBase : control.palette.base : control.palette.base
               }
               break
               case TableView.SelectRows:
               {

                   control.selected ? control.palette.active.highlight : (!(control.TableView.view.hoveredRow === row) || (row === control.TableView.view.currentRow) ? //fix
                                                                                                                                                                        control.TableView.view.currentRow === model.row ? control.palette.active.highlight : control.TableView.view.alternatingRows ? model.row % 2 == 0 ? control.palette.alternateBase : control.palette.base : control.palette.base : control.palette.shadow)
               }
               break
               case TableView.SelectColumns:
               {
                   control.TableView.view.currentColumn === model.column ? control.palette.active.highlight : control.TableView.view.alternatingRows ? model.row % 2 == 0 ? control.palette.alternateBase : control.palette.base : control.palette.base
               }
               break
               case TableView.SelectionDisabled:
               {
                   control.palette.base
               }
               break
               }

        border.color: control.palette.shadow
        border.width: control.TableView.view.selectionBehavior
                      === TableView.SelectCells ? control.current ? 1 : 0 : 0
    }

    property var select: function (selectionOption) {
        if (TableView.view.selectionModel) {
            if (TableView.view.selectionBehavior == TableView.SelectRows) {
                // TableView.view.selectionModel.select(
                //             TableView.view.model.index(row, column),
                //             selectionOption)
                for (var i = 0; i < TableView.view.columns; i++) {
                    TableView.view.selectionModel.select(
                                TableView.view.model.index(row, i),
                                selectionOption)
                }
            } else if (TableView.view.selectionBehavior == TableView.SelectColumns) {
                for (var j = 0; j < TableView.view.rows; j++) {
                    TableView.view.selectionModel.select(
                                TableView.view.model.index(j, column),
                                selectionOption)
                }
            } else if (TableView.view.selectionBehavior == TableView.SelectCells) {
                TableView.view.selectionModel.select(TableView.view.model.index(
                                                         row, column),
                                                     selectionOption)
            }
        }
    }
}
