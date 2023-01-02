

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
import CoreUI
import QtQuick.Controls.impl as Impl
import "nav.js" as NavJS

Item {
    id: rootItem
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
                    var item = this.get(i)
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
            ToolButton {
                icon.name: "cil-menu"
                display: AbstractButton.IconOnly
                background: Item {}
                onClicked: drawer.opened ? drawer.close() : drawer.open()
            }

            HorizontalSpacer {}

            ToolButton {
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
                    actions: [
                        CAction {
                            text: qsTr("Logout")
                            icon.name: "cil-account-logout"
                            onTriggered: AuthManager.logout()
                        }
                    ]
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
        width: drawerAboveContent ? rootItem.width : drawer.opened ? rootItem.width
                                                                     - drawer.width : rootItem.width
        anchors.left: rootItem.left
        anchors.leftMargin: drawerAboveContent ? 0 : drawer.opened ? drawer.width : 0
        height: 60
        leftPadding: 20
        Breadcrumb {
            id: breadCrumb
            anchors.fill: parent
            Component.onCompleted: model = Router.paths
            onClicked:(itemData) =>{
                console.log(itemData)
            }

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
//        implicitWidth: stack.implicitWidth

        contentHeight: stack.implicitHeight
        clip: true
        width: drawerAboveContent ? rootItem.width -10 : drawer.opened ? rootItem.width - drawer.width -40  : rootItem.width -40
         height: rootItem.height - toolBar.height - breadCrumbToolBar.height - (20 * 2)

        x: drawerAboveContent ? 5 : drawer.opened ? drawer.width + 20 : 20

        y: toolBar.height + breadCrumbToolBar.height + 20

        StackView {
            id: stack
            background: Rectangle {
                color: "transparent"
            }
            LayoutMirroring.childrenInherit: true
            anchors.fill: parent
            clip:true
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
                        Router.paths.push({"label": stack.currentItem.title ?? "Unknown", "path": path})
                        Router.pathsChanged()
                    } else {
                        stack.push(path, params)
                        Router.paths.push({"label": stack.currentItem.title ?? "Unknown", "path": path})
                        Router.pathsChanged()
                    }
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
