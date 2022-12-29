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
ItemDelegate {
    id: control
    clip: true
    property bool  isCurrentItem : TableView.view.hoveredRow===model.row
    property color backgroundColor: model.row%2==0 ? palette.base : palette.alternateBase;

    display: AbstractButton.TextUnderIcon
    implicitHeight: 60

    text: model.display? model.display : ""

    hoverEnabled: true
    highlighted: TableView.view.selectedRow===model.row;
    onClicked: {TableView.view.selectedRow=model.row; forceActiveFocus();}

    onHoveredChanged: {
        if(hovered){
            TableView.view.hoveredRow=model.row;
        }
    }


    onPressAndHold: CoreUI.copyToClipBoard(control.text)

    background: Rectangle{

        color: control.highlighted? control.palette.active.highlight :
                                      control.isCurrentItem? //hovered?
                                      control.palette.dark
        : model.row%2==0?
                               palette.alternateBase : palette.base
        border.color: control.palette.shadow
        border.width: 0
    }
}
