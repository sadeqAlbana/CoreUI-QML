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
    property bool  isCurrentItem : ListView.view.hoveredRow===model.row
    property color backgroundColor:  model.row%2==0 ? "#F2F2F3" : "white";
    implicitWidth: 100
    implicitHeight: 60

    hoverEnabled: true
    highlighted: ListView.isCurrentItem;
    onClicked: listView.currentIndex=model.row


    states:[
        State{
            name: "hovered_highlighted"
            when: highlighted && hovered
            extend: "highlighted"
            PropertyChanges {target: contentItem; color: "black"}
        },

        State{
            name: "highlighted"
            when: highlighted
            PropertyChanges {target: control; backgroundColor: "#0078D7"}
            PropertyChanges {target: control; palette.buttonText: "white"}

        },
        State{
            name: "hovered"
            when: hovered
            PropertyChanges {target: control; backgroundColor: Qt.darker("#F2F2F3",1.3)}
            PropertyChanges {target: contentItem; color: "white"}
        }
    ]


    contentItem: Text {
        anchors.centerIn: parent
        text: model.name
        horizontalAlignment: TextEdit.AlignHCenter
        verticalAlignment: TextEdit.AlignVCenter
        color: "#4F5D73"

    }

    background: Rectangle{color: control.backgroundColor; border.color: "#D8DBE0"}
}
