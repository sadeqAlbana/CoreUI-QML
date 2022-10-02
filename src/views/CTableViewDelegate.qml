/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Controls
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

    states:[
        State{
            name: "hovered_and_highlighted"
            when: highlighted && isCurrentItem
            extend: "highlighted"
            PropertyChanges {target: control; palette.buttonText: "black"}
        },

        State{
            name: "highlighted"
            when: highlighted
            PropertyChanges {target: control; palette.base: "#0078D7"}
            PropertyChanges {target: control; palette.alternateBase: "#0078D7"}

            PropertyChanges {target: control; palette.buttonText: "white"}
        },
        State{
            name: "hovered"
            when: isCurrentItem
            PropertyChanges {target: control; backgroundColor: Qt.darker("#F2F2F3",1.3)}
            PropertyChanges {target: control; palette.buttonText: "white"}
        }
    ]





    background: Rectangle{color: control.backgroundColor; border.color: control.palette.shadow}
}
