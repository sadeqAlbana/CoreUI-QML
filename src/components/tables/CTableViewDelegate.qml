/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15
import QtQuick.Controls 2.15
ItemDelegate {
    id: control
    clip: true
    property bool  isCurrentItem : TableView.view.hoveredRow===model.row
    display: AbstractButton.TextUnderIcon
    implicitHeight: 60

    text: model.display? model.display : ""
    palette{
        buttonText: "#4F5D73"
        base: "#F2F2F3"
        alternateBase: "white"
        shadow: "#D8DBE0"
    }

//    Component.onCompleted: {
//        TableView.view.implicitColumnSizes[column]=implicitWidth
//    }

//    implicitWidth: Math.max((Math.max(implicitBackgroundWidth + leftInset + rightInset,
//                            implicitContentWidth + leftPadding + rightPadding)),75)


//    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
//                            implicitContentWidth + leftPadding + rightPadding)

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
            PropertyChanges {target: rect; color: Qt.darker("#F2F2F3",1.3)}
            PropertyChanges {target: control; palette.buttonText: "white"}
        }
    ]




    background: Rectangle{id: rect; color: model.row%2==0 ? palette.base : palette.alternateBase; border.color: palette.shadow}
}
