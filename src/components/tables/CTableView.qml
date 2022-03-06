/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15
import QtQuick.Layouts 1.15
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

//https://github.com/qt/qtdeclarative/blob/5.15.2/src/quick/items/qquicktableview.cpp
//qreal QQuickTableViewPrivate::cellWidth(const QPoint& cell)
//qreal QQuickTableViewPrivate::sizeHintForColumn(int column)
//these methods are use to calculate columns width
TableView{
    id: tableView
    property list<Action> actions
    property var implicitColumnSizes: []
    topMargin: horizontalHeader.implicitHeight
    Layout.fillWidth: true
    property int selectedRow: -1
    property int hoveredRow: -1
    //rowHeightProvider: function(row){return 60}
    //implicitHeight: rowHeightProvider(0)*rows;
    boundsBehavior: Flickable.StopAtBounds
    clip: true
//    columnWidthProvider: function (column){


//        return tableView.width/model.columnCount();
//    }

    //    function sizeHintForColumn(column){
    //        for(var i=0; i<rows; i++){
    //            var txt=
    //        }

    //    }
    HorizontalHeaderView {
        id: horizontalHeader
        syncView: tableView
        implicitHeight: 60
        parent: tableView
        anchors.left: parent.left
        height: 60
        clip: tableView.clip
        boundsBehavior: tableView.boundsBehavior
        delegate: CHorizontalHeaderDelegate{}

    }

    onRowsChanged:{
        if(selectedRow>=rows){
            selectedRow=-1;
        }
        contentY=topMargin*-1; //this is a temprary bug fix for items now showing after model reset/rows deletion
    }


    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons


        enabled: tableView.selectedRow>=0
        onClicked: {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup()
        }
        onPressAndHold: {
            if (mouse.source === Qt.MouseEventNotSynthesized)
                contextMenu.popup()
        }
        onDoubleClicked: console.log("double clicked")

        Menu {
            id: contextMenu
            modal: true
            dim: false

            background: Rectangle{
                implicitWidth: 300
                border.color: "silver"
                radius: 2
            }
            Repeater{
                model: tableView.actions.length
                CMenuItem{ action: tableView.actions[index]}
            }
        }
    } //end MouseArea

    delegate: CTableViewDelegate{}
    onWidthChanged: forceLayout();

}
//}
