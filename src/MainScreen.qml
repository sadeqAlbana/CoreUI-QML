/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic;
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQml.Models
import CoreUI.Notifications
import CoreUI.Base
import CoreUI.Impl
import CoreUI.Menus
import QtQuick.Controls.impl as Impl
import "nav.js" as NavJS;
Item {
    id: rootItem
    implicitWidth: stack.implicitWidth
    implicitHeight: stack.implicitHeight
    property var navBar: NavJS.navBar();
    property var permissionProvider: null
    property url icon: "qrc:/icons/CoreUI/brand/cib-coreui.svg"
    property int iconWidth: 48
    property int iconHeight: 48
    //    property bool drawerAboveContent : ApplicationWindow.window.mobileLayout
    property bool drawerAboveContent : false
    onDrawerAboveContentChanged: {
        if(!drawerAboveContent && drawer.opened)
            drawer.close();
    }

    LayoutMirroring.onEnabledChanged: populateNavBar();



    CNavigationDrawer{
        id: drawer
        icon: rootItem.icon
        iconWidth: rootItem.iconWidth
        iconHeight: rootItem.iconHeight
        navModel: ListModel {
            id: listModel
            dynamicRoles: false

            function indexOf(title) {
                for (var i = 0; i < listModel.count; i++) {
                    var item = this.get(i)
                    if (item.title === title)
                        return i
                }
                return -1
            }
        }
    }

    CToolBar{
        id: toolBar;
        width: drawerAboveContent? rootItem.width :
                                   drawer.opened ? rootItem.width-drawer.width : rootItem.width
        anchors.left: rootItem.left
        anchors.leftMargin: drawerAboveContent? 0 : drawer.opened ? drawer.width  : 0
        height: 65
        RowLayout {
            anchors.fill: parent
            ToolButton {
                Layout.leftMargin: 20
                text: qsTr("☰")
                display: AbstractButton.TextOnly
                background:Item{}
                onClicked: drawer.opened ? drawer.close() : drawer.open();
            }

            CLabel {
                text: stack.currentItem? stack.currentItem.title : ""
                font.weight: Font.DemiBold
                Layout.fillWidth: true
            }

            ToolButton{
                id: ctrl
                display: AbstractButton.IconOnly
                property bool rounded: true
                property bool adapt: true
                icon.width: 48
                icon.height: 48
                Layout.rightMargin: 10
                Layout.alignment: Qt.AlignCenter
                layer.enabled: rounded
                icon.color: "transparent"
                padding: 0

                onClicked: {
                    menu.open();
                }

                CActionsMenu{
                    id:menu
                    parent: ctrl
                    y:parent.height
                    actions: [Action{text: qsTr("Logout"); icon.name: "cil-account-logout"; onTriggered: AuthManager.logout();}]
                }

                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: ctrl.width
                        height: ctrl.height
                        Rectangle {
                            anchors.centerIn: parent
                            width: ctrl.adapt ? ctrl.width : Math.min(ctrl.width, ctrl.height)
                            height: ctrl.adapt ? ctrl.height : width
                            radius: Math.max(ctrl.width, ctrl.height)
                        }
                    }
                }
            }

        }//layout
    }//toolbar



    //content here
    StackView{
        id: stack
        background: Rectangle{color: "transparent"}
        LayoutMirroring.childrenInherit: true
        width: drawerAboveContent? rootItem.width-padding*2  :
                                   drawer.opened ? rootItem.width-drawer.width-padding*2 : rootItem.width-padding*2
        x: drawerAboveContent? 0 : drawer.opened ? drawer.width+padding  : padding
        anchors.left: parent.left
        anchors.leftMargin: drawerAboveContent? 0 : drawer.opened ? drawer.width+padding  : padding

        y: toolBar.height+ padding
        height: rootItem.height-toolBar.height-padding*2
        implicitWidth: currentItem? currentItem.implicitWidth+40 : 100
        implicitHeight: currentItem? currentItem.implicitHeight+40 : 100
        padding: rootItem.drawerAboveContent? 0 : 15
//        initialItem: Page{
//            Rectangle{
//                implicitHeight: 500
//                implicitWidth: 500
//                anchors.fill: parent
//            }
//        }

        clip:true
        replaceEnter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
        }
        replaceExit: Transition {
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
        }


    }


    function parseNavbar(listItems){
        listModel.clear();
        for(var i=0; i<listItems.length; i++){
            var item=listItems[i];
            item.id=listModel.count;
            if(!item.hasOwnProperty('badge')){
                item['badge']={};
            }


            if(permissionProvider && item.hasOwnProperty('permission') && !permissionProvider(item.permission) && item.permission.length)
                continue;

            if(item.childItems){
                item.childCount=item.childItems.length;
                item.parentId=0;
                listModel.append(item);
                for(var j=0; j<item.childItems.length; j++){
                    var child=item.childItems[j];
                    if(permissionProvider && child.hasOwnProperty('permission') && !permissionProvider(child.permission) && child.permission.length)
                        continue;
                    child.id=listModel.count
                    child.parentId=item.id
                    child.hidden=true;
                    child.category=item.category;
                    child.childCount=0
                    if(!child.hasOwnProperty('badge')){
                        child['badge']={};
                    }


                    listModel.append(child);
                }
            }else{
                listModel.append(item);
            }
        }
    }

    Component.onCompleted: populateNavBar();
    function populateNavBar() {
        var listItems = rootItem.navBar;
        parseNavbar(listItems);
    }
}
