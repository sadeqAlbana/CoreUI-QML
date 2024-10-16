

/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */
import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQml.Models
import CoreUI.Notifications
import CoreUI.Base
import CoreUI.Impl
import CoreUI.Menus
import CoreUI.Buttons
import CoreUI
import QtQuick.Controls.impl as Impl
import "nav.js" as NavJS

Item {
    id: rootItem

    property list<CAction> menuActions;
    implicitWidth: mainFlickable.implicitWidth
    implicitHeight: mainFlickable.implicitHeight

    property var navBar: NavJS.navBar()
    property var permissionProvider: null
    property url icon: "qrc:/icons/CoreUI/brand/cib-coreui-cropped.svg"
    property int iconWidth: 90
    property int iconHeight: 33
    property int initialIndex: 0
    property bool drawerAboveContent : ApplicationWindow.window.mobileLayout
    onDrawerAboveContentChanged: {
        if (!drawerAboveContent && drawer.opened)
            drawer.close()
    }

    LayoutMirroring.onEnabledChanged: populateNavBar()

    CNavigationDrawer {
        id: drawer
        icon: rootItem.icon
        iconWidth: rootItem.iconWidth
        iconHeight: rootItem.iconHeight
        navModel: ListModel {
            id: listModel
            dynamicRoles: false

            function indexOf(title) {
                for (var i = 0; i < listModel.count; i++) {
                    var item = listModel.get(i)
                    if (item.title === title)
                        return i
                }
                return -1
            }
        }

        Component.onCompleted: {
            if (initialIndex > 0) {
                drawer.currentIndex = initialIndex
            }
        }
    }

    CToolBar {
        id: toolBar
        width: drawerAboveContent ? rootItem.width : drawer.opened ? rootItem.width
                                                                     - drawer.width : rootItem.width
        anchors.left: rootItem.left
        anchors.leftMargin: drawerAboveContent ? 0 : drawer.opened ? drawer.width : 0
        height: 65
        layer.enabled: false
        leftPadding: 20
        rightPadding: 20
        RowLayout {
            anchors.fill: parent


            CToolButton {
                id: menuButton
                icon.name: "cil-menu"
                icon.width: 23
                icon.height: 23
                display: AbstractButton.IconOnly
                background: Item {}
                // styleColor: "#000015"
                font.bold: true
                opacity: hovered? 1: 0.75

                onClicked: drawer.opened ? drawer.close() : drawer.open()
            }

            HorizontalSpacer {}

            CToolButton {
                id: ctrl
                display: AbstractButton.IconOnly
                property bool rounded: true
                property bool adapt: true
                icon.width: 48
                icon.height: 48
                Layout.preferredHeight: 48
                Layout.preferredWidth: 48
                Layout.rightMargin: 10
                Layout.alignment: Qt.AlignCenter
                layer.enabled: rounded
                icon.color: "transparent"
                icon.source: CoreUI.userIcon;

                padding: 0
//                Connections{
//                    target: CoreUI
//                    function onUserIconChanged(){
//                        icon.source=CoreUI.userIcon;
//                    }
//                }

                onClicked: {
                    menu.open()
                }

                CActionsMenu {
                    id: menu
                    parent: ctrl
                    y: parent.height
                    actions: rootItem.menuActions
                }

                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: ctrl.width
                        height: ctrl.height
                        Rectangle {
                            anchors.centerIn: parent
                            width: ctrl.adapt ? ctrl.width : Math.min(
                                                    ctrl.width, ctrl.height)
                            height: ctrl.adapt ? ctrl.height : width
                            radius: Math.max(ctrl.width, ctrl.height)
                        }
                    }
                }
            }
        } //layout
    } //toolbar

    CToolBar {
        id: breadCrumbToolBar
        y: toolBar.height - 1
        visible: !window.mobileLayout
        width: drawerAboveContent ? rootItem.width : drawer.opened ? rootItem.width
                                                                     - drawer.width : rootItem.width
        anchors.left: rootItem.left
        anchors.leftMargin: drawerAboveContent ? 0 : drawer.opened ? drawer.width : 0
        height: 60
        leftPadding: 20
        rightPadding: 20

        CToolButton {
            id: backButton
            icon.name: "cil-accordion-arrow"
            icon.width: 23
            icon.height: 23
            rotation: 90
            display: AbstractButton.IconOnly
            background: Item {}
            visible: Router.paths.length>1
            onClicked: Router.back(-1);
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }


        Breadcrumb {
            id: breadCrumb
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: backButton.visible? backButton.right : parent.left
            Component.onCompleted: model = Router.paths
            onClicked:(index)=> Router.back(index)




            Connections {
                target: Router
                function onPathsChanged() {
                    breadCrumb.model = Router.paths
                }
            }
        }
    }

    //content here
    Flickable {
        id: mainFlickable
        implicitWidth: stack.implicitWidth
        implicitHeight: stack.implicitHeight
        contentHeight: stack.implicitHeight
        clip: true
        width: drawerAboveContent ? rootItem.width -10 : drawer.opened ? rootItem.width - drawer.width -20  : rootItem.width -20
         height: rootItem.height - toolBar.height - (
                     breadCrumbToolBar.visible? breadCrumbToolBar.height : 0) - (10 * 2)

        x: LayoutMirroring.enabled? drawerAboveContent? 5 : 10


             :drawerAboveContent ? 5 : drawer.opened ? drawer.width + 10 : 10

        y: toolBar.height + (
               breadCrumbToolBar.visible? breadCrumbToolBar.height : 0) + 10

        StackView {
            id: stack
            background: Rectangle {
                color: "transparent"
            }
            LayoutMirroring.childrenInherit: true
            anchors.fill: parent
            clip:true
            padding: 0
            implicitWidth: currentItem ? currentItem.implicitWidth  : 100
//            implicitHeight: currentItem ? currentItem.implicitHeight : 100

            implicitHeight: currentItem ? currentItem.implicitHeight> mainFlickable.height?
                                              currentItem.implicitHeight : mainFlickable.height : 100

//            implicitHeight: contentHeight > Window.window.height? contentHeight : Window.window.height


            Connections {
                target: Router

                function onNavigateRequested(path, params, root) {
                    if (root) {
                        stack.replace(null, path, params)
                        Router.paths = []
                        Router.paths.push({"label": stack.currentItem? stack.currentItem.title ?? "Unknown" : "Unknown", "path": path})
                        Router.reloadPaths()
                    } else {
                        stack.push(path, params)
                        Router.paths.push({"label": stack.currentItem? stack.currentItem.title ?? "Unknown" : "Unknown", "path": path})
                        Router.reloadPaths()
                    }
                }

                function onBackRequested(index){
                    if(index===-1){
                        stack.pop();
                        Router.paths.pop();
                    }else{
                        let item=stack.get(index)
                        if(item){
                            stack.pop(item)
                            let itemsToDelete=Router.paths.length-index
                            while(--itemsToDelete){
                                Router.paths.pop();
                            }

                        }
                    }
                    Router.reloadPaths();
                }
            }

            replaceEnter: Transition {
                NumberAnimation {
                    property: "opacity"
                    from: 0.0
                    to: 1.0
                }
            }
            replaceExit: Transition {
                NumberAnimation {
                    property: "opacity"
                    from: 1.0
                    to: 0.0
                }
            }


        }


//        ScrollBar.vertical: ScrollBar {
//            width: 40
//            anchors.left: parent.right // adjust the anchor as suggested by derM
//            policy: ScrollBar.AlwaysOn
//        }


        ScrollBar.vertical: ScrollBar { }

    }//flickable




    function parseNavbar(listItems) {
        listModel.clear()
        for (var i = 0; i < listItems.length; i++) {
            var item = listItems[i]
            item.id = listModel.count
            if (!item.hasOwnProperty('badge')) {
                item['badge'] = {}
            }

            if (permissionProvider && item.hasOwnProperty('permission')
                    && !permissionProvider(item.permission)
                    && item.permission.length)
                continue

            if (item.childItems) {
                item.childCount = item.childItems.length
                item.parentId = 0
                listModel.append(item)
                for (var j = 0; j < item.childItems.length; j++) {
                    var child = item.childItems[j]
                    if (permissionProvider && child.hasOwnProperty('permission')
                            && !permissionProvider(child.permission)
                            && child.permission.length)
                        continue
                    child.id = listModel.count
                    child.parentId = item.id
                    child.hidden = true
                    child.category = item.category
                    child.childCount = 0
                    if (!child.hasOwnProperty('badge')) {
                        child['badge'] = {}
                    }

                    listModel.append(child)
                }
            } else {
                listModel.append(item)
            }
        }
    }

    Component.onCompleted: populateNavBar()
    function populateNavBar() {
        var listItems = rootItem.navBar
        parseNavbar(listItems)
    }
}
