/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CoreUI.Base
import CoreUI.Impl
import CoreUI.Menus
//https://github.com/qt/qtdeclarative/blob/5.15.2/src/quick/items/qquicktableview.cpp
//qreal QQuickTableViewPrivate::cellWidth(const QPoint& cell)
//qreal QQuickTableViewPrivate::sizeHintForColumn(int column)
//these methods are use to calculate columns width
TableView{
    id: tableView

    LayoutMirroring.childrenInherit: true

    property list<Action> actions
    property var hiddenColumns: []
    property int selectedRow: -1
    property int hoveredRow: -1
    property bool validRow: selectedRow>=0
    property int __lastWidth: 0;



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
        delegate: CHorizontalHeaderDelegate{}
    }
    topMargin: horizontalHeaderView.visible? horizontalHeaderView.implicitHeight : 0
    reuseItems: true
    Layout.fillWidth: true
    delegate: CTableViewDelegate{}
    boundsBehavior: Flickable.StopAtBounds
    clip: true
    columnWidthProvider: tableView.widthProvider;
    implicitWidth: getImplicitWidth();

//    onWidthChanged: {
//        //implicitWidth=getImplicitWidth();
//        //forceLayout();
//    }

    Timer{
        id: timer
        interval: 500
        running: true
        repeat: true
        onTriggered: {
//            if(__lastWidth==width)
//                return;

//            __lastWidth=width;


            implicitWidth=getImplicitWidth();
            forceLayout()
        }
    }



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

    function implicitColumnAndHeaderWidth(column){
        return Math.max(implicitColumnWidth(column),horizontalHeaderView.implicitColumnWidth(column))
    }

    function getImplicitWidth() {
        let w=0;

        for(var i=0; i<tableView.columns; i++){
            if(!isColumnHidden(i)){
                if(tableView.isColumnLoaded(i))
                    w+=tableView.implicitColumnWidth(i)
            }
        }
        if(tableView.columnSpacing>0){
            w+=((tableView.columns-hiddenColumns.length)*tableView.columnSpacing)
        }
        return w
    }

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
            return Math.max(tableView.implicitColumnAndHeaderWidth(column),

                            parseInt(tableView.width/(tableView.columns-tableView.hiddenColumns.length),10))
        }

        else{
            return -1
        }
    }

    onRowsChanged:{
        if(selectedRow>=rows){
            selectedRow=-1;
        }
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

        CActionsMenu {
            id: contextMenu
            modal: true
            dim: false
            actions:tableView.actions

        }
    } //end MouseArea
}
