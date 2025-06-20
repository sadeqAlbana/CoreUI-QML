/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls

import QtQuick.Controls.Basic;
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import CoreUI.Base
import CoreUI.Impl
import CoreUI.Menus
import CoreUI
//https://github.com/qt/qtdeclarative/blob/5.15.2/src/quick/items/qquicktableview.cpp
//qreal QQuickTableViewPrivate::cellWidth(const QPoint& cell)
//qreal QQuickTableViewPrivate::sizeHintForColumn(int column)
//these methods are use to calculate columns width
TableView{
    id: tableView
    interactive: true
    boundsBehavior: Flickable.StopAtBounds
    alternatingRows: true
    pointerNavigationEnabled: true
    keyNavigationEnabled:true
    selectionBehavior: TableView.SelectRows
    LayoutMirroring.childrenInherit: true
    property bool headerVisible: true
    property list<Action> actions
    property var hiddenColumns: []
    property int hoveredRow:-1;
    property alias headerDelegate: horizontalHeaderView.delegate
    property var permissionProvider: undefined

    Rectangle{
        parent: tableView
        border.color: tableView.palette.shadow
        anchors.fill: parent
        color: "transparent"
        radius: 2

    }



    selectionModel: ItemSelectionModel{

        // onSelectedIndexesChanged: {
        //     console.log(selectedIndexes)
        // }
    }



    ScrollBar.vertical: ScrollBar { }

    HorizontalHeaderView{
        id: horizontalHeaderView
        visible: headerVisible
        reuseItems: false
        syncView: tableView
        implicitHeight: 50
        parent: tableView
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50
        clip: tableView.clip
        boundsBehavior: tableView.boundsBehavior
        delegate: CHorizontalHeaderDelegate{}
        rowHeightProvider: function(){return 50}

    }
    topMargin: horizontalHeaderView.visible? horizontalHeaderView.implicitHeight : 0
    reuseItems: true
    Layout.fillWidth: true
    resizableColumns: false //causes mouse scroll to stop working
    resizableRows: false //causes mouse scroll to stop working
    delegate: CTableViewDelegate{}
    clip: true
    columnWidthProvider: tableView.widthProvider;
    implicitWidth: {
        let w=0;

        for(var i=0; i<tableView.columns; i++){
            if(!isColumnHidden(i)){
                if(tableView.isColumnLoaded(i))
                    w+=Math.max(tableView.implicitColumnWidth(i),horizontalHeaderView.implicitColumnWidth(i))
            }
        }
        if(tableView.columnSpacing>0){
            w+=((tableView.columns-hiddenColumns.length)*tableView.columnSpacing)
        }
        return w
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
            //take header width into account as well
            return Math.max(tableView.implicitColumnAndHeaderWidth(column),

                            (parseInt(tableView.width/(tableView.columns-tableView.hiddenColumns.length),10)+1))
        }

        else{
            return  parseInt(tableView.width/(tableView.columns-tableView.hiddenColumns.length),10)+1

            //return -1
        }
    }


    MouseArea {
        anchors.fill: parent
        parent: tableView
        acceptedButtons: Qt.RightButton
        // enabled: tableView.currentRow>=0
        propagateComposedEvents: true

        onClicked:(mouse)=> {
                      if (mouse.button === Qt.RightButton){
                          contextMenu.popup();
                      }
                      mouse.accepted=false;
                  }
        onPressAndHold:(mouse)=> {
                           if (mouse.source === Qt.MouseEventNotSynthesized){
                                contextMenu.popup();
                           }
                           mouse.accepted=false;

                       }


    } //end MouseArea

    CActionsMenu {
        id: contextMenu
        modal: true
        dim: false
        actions:tableView.actions
        permissionProvider: tableView.permissionProvider
    }
    SelectionRectangle {
        target: tableView
    }
//    SelectionRectangle {
//        target: tableView
//        selectionMode: SelectionRectangle.Drag
//        topLeftHandle: Rectangle {
//            width: 20
//            height: 20
//            visible: SelectionRectangle.control.active
//            radius: height
//        }

//        bottomRightHandle: Rectangle {
//            width: 20
//            height: 20
//            visible: SelectionRectangle.control.active
//            radius: height

//        }

//    }
}

