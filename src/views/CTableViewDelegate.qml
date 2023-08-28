/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Controls
import CoreUI
Control {
    id: control
    clip: true
    required property bool selected
    required property bool current
    property string text: model.display?? ""
    hoverEnabled: true
    TableView.editDelegate: CTableViewEditDelegate{

    }

    implicitHeight: 60

    onHoveredChanged:{
//        if(TableView.view instanceof CTableView){
            if(hovered){
                TableView.view.hoveredRow=row;
            }
//        }
    }

    contentItem: Text{
        font: control.font
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

    }




    background: Rectangle{
        color: switch(control.TableView.view.selectionBehavior){
               case TableView.SelectCells : {
                   control.hovered || control.current? Qt.lighter("#3399ff",1.4) :
                                    control.TableView.view.currentRow===row? control.palette.inactive.highlight:
                                    control.TableView.view.alternatingRows?
                                        row%2==0? control.palette.alternateBase : control.palette.base :
                   control.palette.base
               }break;
               case TableView.SelectRows :{
                   !(control.TableView.view.hoveredRow===row) || (row===control.TableView.view.currentRow)? //fix
                   control.TableView.view.currentRow===model.row?control.palette.active.highlight : control.TableView.view.alternatingRows? model.row%2==0? control.palette.alternateBase : control.palette.base :
                   control.palette.base : control.palette.shadow
               }break;
               case TableView.SelectColumns :{
                   control.TableView.view.currentColumn===model.column?control.palette.active.highlight : control.TableView.view.alternatingRows? model.row%2==0? control.palette.alternateBase : control.palette.base :
                   control.palette.base;
               }
               break;
               case TableView.SelectionDisabled: {control.palette.base;} break;

               }

        border.color: control.palette.shadow
        border.width: control.TableView.view.selectionBehavior===TableView.SelectCells? control.current? 1 : 0 : 0
    }


}
