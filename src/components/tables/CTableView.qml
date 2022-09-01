/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
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
    property var hiddenColumns: []
    property int selectedRow: -1
    property int hoveredRow: -1
    property bool validRow: selectedRow>=0
    topMargin: horizontalHeaderView.visible? horizontalHeaderView.implicitHeight : 0
    Layout.fillWidth: true
    delegate: CTableViewDelegate{}
    boundsBehavior: Flickable.StopAtBounds
    clip: true
    columnWidthProvider: tableView.widthProvider;
    implicitWidth: getImplicitWidth();
    //onImplicitHeightChanged: console.log("ih: " + implicitHeight)
    onWidthChanged: {
        forceLayout();
    }
    Timer{
        interval: 400
        running: true
        repeat: true
        onTriggered: {
            tableView.implicitWidth=getImplicitWidth();
        }

    }



    onHeightChanged: forceLayout();
//    implicitHeight: getImplicitHeight();
//    function getImplicitHeight(){
//        let w=0;
//        for(var i=0; i<tableView.rows; i++){
//            if(tableView.isRowLoaded(i))
//                w+=tableView.implicitRowHeight()(i)
//        }
//        if(tableView.rowSpacing>0){
//            w+=(columns*tableView.rowSpacing)
//        }
//        if(horizontalHeaderView.visible)
//            w+=horizontalHeaderView.implicitHeight


//        return Math.max(w,tableView.rows*defaultImplicitRowHeight); //this is not right
//    }

    onHiddenColumnsChanged: {
        forceLayout();
        returnToBounds();
    }


    function hideColumn(column){
        if(isColumnHidden(column))
            return

        tableView.hiddenColumns.push(parseInt(column));
        hiddenColumnsChanged();

    }

    function showColumn(column){

        if(!isColumnHidden(column))
            return

        hiddenColumns.pop(hiddenColumns.indexOf(column))
        hiddenColumnsChanged();

    }

    function getImplicitWidth() {
        let w=0;
        for(var i=0; i<tableView.columns; i++){
            if(tableView.isColumnLoaded(i))
                w+=tableView.implicitColumnWidth(i)
        }
        if(tableView.columnSpacing>0){
            w+=(columns*tableView.columnSpacing)
        }
        return w
    }

    reuseItems: false
//    Timer{
//        id: forceLayoutTimer
//        interval: 100
//        //onTriggered: tableView.implicitHeight=tableView.getImplicitHeight();
//    }


    function isColumnHidden(column){
        for(let i=0; i<tableView.hiddenColumns.length; i++){

            if(tableView.hiddenColumns[i]===column){
                return true
            }
        }
        return false
    }

     function widthProvider(column){
         if(isColumnHidden(column))
             return 0

        if(isColumnLoaded(column)){
            return Math.max(tableView.implicitColumnWidth(column),tableView.width/(tableView.columns-tableView.hiddenColumns.length))
        }

        else{
            return -1
        }
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
        //implicitHeight=getImplicitHeight();
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
}

