/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import QtQuick.Layouts
import "qrc:/CoreUI/components/base"
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

//https://github.com/qt/qtdeclarative/blob/5.15.2/src/quick/items/qquicktableview.cpp
//qreal QQuickTableViewPrivate::cellWidth(const QPoint& cell)
//qreal QQuickTableViewPrivate::sizeHintForColumn(int column)
//these methods are use to calculate columns width
TableView{
    id: tableView
    property list<Action> actions
    property var implicitColumnSizes: ({})
    property var hiddenColumns: []
    //    onImplicitColumnSizesChanged: {
    //        console.log(implicitColumnSizes)
    //    }

    topMargin: horizontalHeader.implicitHeight
    Layout.fillWidth: true
    property int selectedRow: -1
    property int hoveredRow: -1
    boundsBehavior: Flickable.StopAtBounds
    clip: true
    columnWidthProvider: tableView.widthProvider;

    onImplicitColumnSizesChanged: {
        forceLayoutTimer.restart();
    }

    onHiddenColumnsChanged: {
        console.log("hidden columns changed: " + hiddenColumns)
        forceLayout();
        returnToBounds();
    }


    function hideColumn(column){
        console.log("hideColumn: " + column)

        if(isColumnHidden(column))
            return

        tableView.hiddenColumns.push(parseInt(column));
        hiddenColumnsChanged();

    }

    function showColumn(column){
        console.log("showColumn: " + column)

        if(!isColumnHidden(column))
            return

        hiddenColumns.pop(hiddenColumns.indexOf(column))
        hiddenColumnsChanged();

    }

    reuseItems: false
    Timer{
        id: forceLayoutTimer
        interval: 25
        onTriggered: tableView.forceLayout();
    }

    implicitWidth: {
        var implicit=0;
        for(const key in implicitColumnSizes){
//            console.log("key: "  + key)
//            console.log("keyValue: "  + implicitColumnSizes[key])

            if(!isColumnHidden(parseInt(key))){
                implicit+=implicitColumnSizes[key];
            }
        }
        return implicit;
    }

    function isColumnHidden(column){
        for(let i=0; i<tableView.hiddenColumns.length; i++){
            //console.log("typeof hiddenc: " + typeof(tableView.hiddenColumns[i]))
            //console.log("typeof column: " + typeof(column))

            if(tableView.hiddenColumns[i]===column){
                return true
            }
        }
        return false
    }



    //contentWidth: Math.max(implicitWidth,width);
    function widthProvider(column){

        if(isColumnHidden(column))
            return 0

        var max = tableView.implicitColumnSizes[column]

        if(max<=0 || max===NaN)
            return -1 //will use implicit width when returning -1

        var availableSpaceTotal=tableView.width-tableView.implicitWidth;

        if(availableSpaceTotal>0){
            var columnSpace=parseInt(availableSpaceTotal/(tableView.columns-tableView.hiddenColumns.length));
//            console.log("availableSpaceTotal: " + availableSpaceTotal)
//            console.log("width:          " + tableView.width);
//            console.log("contentWidth:   " + tableView.contentWidth);
//            console.log("implicitWidth:  " + tableView.implicitWidth);
//            console.log("max:            " + max);
//            console.log("columnSpace:    " + columnSpace);
//            console.log("comb:    " + (max+columnSpace));

            return max+columnSpace

        }
        return max
    }


    property HorizontalHeaderView horizontalHeaderView: HorizontalHeaderView{
        reuseItems: false
        id: horizontalHeader
        syncView: tableView
        implicitHeight: 60
        parent: tableView
        anchors.left: parent.left
        height: 60
        clip: tableView.clip
        boundsBehavior: tableView.boundsBehavior
        //columnWidthProvider: tableView.widthProvider;
        delegate: CHorizontalHeaderDelegate{}

    }

    onRowsChanged:{
        if(selectedRow>=rows){
            selectedRow=-1;
        }
        //contentY=topMargin*-1; //this is a temprary bug fix for items now showing after model reset/rows deletion

    }


    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.AllButtons


        enabled: tableView.selectedRow>=0
        onClicked:(mouse)=> {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup()
        }
        onPressAndHold:(mouse)=> {
            if (mouse.source === Qt.MouseEventNotSynthesized)
                contextMenu.popup()
        }

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
    onHeightChanged: forceLayout();

}
//}
