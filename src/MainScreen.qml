/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Window
import QtQuick.Controls.Basic;
import QtQuick.Controls
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
//    property bool drawerAboveContent : ApplicationWindow.window.mobileLayout
    property bool drawerAboveContent : false

    LayoutMirroring.enabled: (Qt.application.layoutDirection === Qt.RightToLeft ? true : false)
    LayoutMirroring.childrenInherit: true
    onDrawerAboveContentChanged: {
        if(!drawerAboveContent && drawer.opened)
            drawer.close();
    }


    LayoutMirroring.onEnabledChanged: populateNavBar();



    ToolBar{
        id: toolBar;
        //anchors.left: rootItem.left
        //anchors.right: rootItem.right
        width: drawerAboveContent? rootItem.width :
                                   drawer.opened ? rootItem.width-drawer.width : rootItem.width
        anchors.left: rootItem.left
        anchors.leftMargin: drawerAboveContent? 0 : drawer.opened ? drawer.width  : 0

        height: 65
        background: Rectangle{
            border.color: "#d8dbe0"
            color: "white"
        }

        RowLayout {
            anchors.fill: parent
            ToolButton {
                Layout.leftMargin: 20
                id : toggleButton
                text: qsTr("☰")
                display: AbstractButton.TextOnly
                palette.buttonText: "#7f7f8a"
                palette.button: "#FFFFFF"
                //font.pixelSize: metrics.font.pixelSize*1.5
                onClicked: drawer.opened ? drawer.close() : drawer.open();
            }

            Label {
                text: stack.currentItem? stack.currentItem.title : ""
                //elide: Label.ElideRight
                font.pixelSize: 15
                font.weight: Font.DemiBold
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                color: "#4f5d73"
            }

            ToolButton{
                id: ctrl
                display: AbstractButton.IconOnly
                //icon.source: AuthManager.user.avatar
                property bool rounded: true
                property bool adapt: true
                icon.width: 48
                icon.height: 48
                implicitWidth: 48
                implicitHeight: 48
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

        //        Rectangle{
        //            anchors.fill: parent;
        //            border.color: "#d8dbe0"
        //            color: "transparent"
        //        }


    }//toolbar

    //    ToolBar{
    //        id: breadcrumbToolbar
    //        y:toolBar.height
    //        anchors.left: rootItem.left
    //        anchors.right: rootItem.right
    //        anchors.leftMargin: drawerAboveContent? 0 : drawer.opened? drawer.width : 0
    //        height: 56
    //        background: Rectangle{

    //            color: "white"
    //        }
    //    }

    Drawer{
        id: drawer
        width: 256
        height: rootItem.height
        dim:rootItem.drawerAboveContent
        closePolicy: Popup.NoAutoClose //this causes a problem in closing
        visible: true
        palette.base: "#3c4b64"
        modal: rootItem.drawerAboveContent
        edge: (Qt.application.layoutDirection === Qt.RightToLeft ? Qt.RightEdge : Qt.LeftEdge)
        Overlay.modal: Rectangle{
            color: rootItem.drawerAboveContent ?   "#C0000000" : "transparent"
        }
        background: Rectangle{
            //color: "#29363d"
            color: drawer.palette.base
            border.color: "transparent"
            //            layer.enabled: rootItem.drawerAboveContent
            //            layer.effect:  DropShadow{
            //                radius: 4
            //                verticalOffset: 1
            //                spread: 0.1
            //                color: "silver"
            //                cached: true
            //                transparentBorder: true
            //            }
        }


        ListView{
            id: listView
            anchors.fill: parent;
            interactive: true

            onCurrentIndexChanged: {
                var item=listModel.get(listView.currentIndex);
                if(item!==undefined)
                    if(item.path!==null)
                        stack.replace(item.path)
            }
            Component.onCompleted: {
                //listView.currentIndex=1
            }

            property real delegateHeight: 0
            header : Rectangle{
                //color: drawer.backgroundColor
                color: "#303c54"
                width: parent.width
                height: toolBar.height
                Impl.IconImage{
                    anchors.centerIn: parent;
                    name: "cib-coreui"
                    //sourceSize.width: 82
                    sourceSize.height: 72
                    fillMode: Image.PreserveAspectFit
                    layer.enabled: true
                    layer.effect: ColorOverlay{
                        //anchors.fill: image
                        //source:image
                        color:"white"
                        cached: true

                    }
                }
            }

            footer : Rectangle{
                color: "#303c54"
                width: parent.width
                height: toolBar.height

                Label{
                    id: footerLabel
                    anchors.right: parent.right
                    anchors.rightMargin: 13
                    anchors.verticalCenter: parent.verticalCenter
                    text: "‹"
                    //font.bold: true
                    font.pointSize: 30
                    color: "#7f7f8a"
                    rotation: LayoutMirroring.enabled? 180 : 0
                }

                MouseArea{ //cursor  flickers when pointing at label !
                    anchors.fill: parent;
                    onContainsMouseChanged: {
                        color= containsMouse ? "#2a3446" :   "#303c54";
                        footerLabel.color= containsMouse ? "white" :   "#7f7f8a";
                    }
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }
            }
            headerPositioning: ListView.OverlayHeader

            footerPositioning: ListView.OverlayFooter



            delegate: ItemDelegate{
                id: control
                clip:true
                palette.button: drawer.palette.base
                palette.buttonText: "#afb5c0"

                property bool expanded: model.expanded ? model.expanded : false
                property bool hidden: model.parentId ? model.hidden : false
                MouseArea{
                    anchors.fill: parent;
                    onPressed:(mouse)=>{
                                  mouse.accepted = false;
                              }
                    cursorShape: Qt.PointingHandCursor
                }

                width: ListView.view.width
                height: 48.33
                hoverEnabled: true
                highlighted: ListView.isCurrentItem
                icon.color: "#afb5c0"
                icon.width: 19
                icon.height: 19
                icon.cache: true
                icon.name: model.image? model.image : ""
                //: "normal"
                contentItem: RowLayout{
                    anchors.fill: parent
                    Impl.IconImage{
                        name: control.icon.name
                        source: control.icon.name.length? control.icon.name : control.icon.source
                        color: control.icon.color
                        width: control.icon.width
                        height: control.icon.height
                        cache: control.icon.cache
                        fillMode: Image.PreserveAspectFit
                        Layout.alignment: Qt.AlignVCenter
                        Layout.leftMargin: 13

                        sourceSize: Qt.size(control.icon.width,control.icon.height)

                    }

                    Label{
                        text: model.title
                        color : control.palette.buttonText
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        horizontalAlignment: Qt.AlignLeft
                        verticalAlignment: Qt.AlignVCenter
                        Layout.leftMargin: 10
                        //font.family: "-apple-system,BlinkMacSystemFont,segoe ui,Roboto,helvetica neue,Arial,noto sans,sans-serif,apple color emoji,segoe ui emoji,segoe ui symbol,noto color emoji"
                        //font.family: "Roboto"
                        font.bold: false
                        font.pixelSize: 16
                        font.weight: Font.Medium
                    }

                    Label{
                        visible: model.childItems ? true : false
                        Layout.alignment: Qt.AlignRight
                        Layout.rightMargin: 13
                        text: "‹"
                        font.pointSize: 13
                        color: control.hovered? "#fff" : "#7f7f8a"

                        font.bold: control.hovered
                        rotation: control.expanded? -90 : 0

                        Behavior on color{
                            ColorAnimation {
                                easing.type: Easing.InOutQuad;
                                duration: 300;
                            }
                        }
                        Behavior on rotation {
                            RotationAnimation { duration: 150; direction: RotationAnimation.Shortest }
                        }

                    }

                    Badge{
                        visible: model.badge ? true : false
                        Layout.rightMargin: 13
                        width: parent.width/8
                        height: parent.height/3
                        text: model.badge ? model.badge.text : ""
                        state: model.badge ? model.badge.variant : ""
                    }

                }
                transitions:[
                    Transition {
                        from: "hidden"
                        //                        to: ""
                        reversible: true
                        SequentialAnimation {
                            PropertyAnimation {property: "height"; duration: 75 }
                        }
                    },
                    Transition {
                        reversible: true
                        from: "*"
                        to: "hovered"
                        ColorAnimation {
                            easing.type: Easing.InOutQuad;
                            duration: 300;
                            //alwaysRunToEnd: true
                        }
                    }
                ]


                states: [

                    State{
                        name: "visibleChild";
                        //when: model.parentId && !model.hidden && !hovered && !highlighted;
                        PropertyChanges {target: control; palette.button: "#303c50"}
                    },


                    State{
                        id:stateHidden
                        name: "hidden";
                        when: hidden
                        PropertyChanges {target: control; height:0;}
                    },

                    State{
                        name: "expanded";
                        when: control.expanded;
                        PropertyChanges {target: control; palette.button: "#303c50"}
                    },
                    State{
                        name: "hovered"
                        when: control.hovered
                        PropertyChanges {target: control; palette.button: "#321fdb"}
                        PropertyChanges {target: control; palette.buttonText: "white"}
                        PropertyChanges {target: control; icon.color: "white"}
                    },
                    State{
                        name: "highlighted"
                        when: control.highlighted
                        PropertyChanges {target: control; palette.button: "#46546c" }
                        PropertyChanges {target: control; palette.buttonText: "white"}
                        PropertyChanges {target: control; icon.color: "white"}
                    }

                ]


                background: Rectangle{
                    opacity: enabled ? 1 : 0.3
                    color: control.palette.button
                }


                onClicked: {
                    if (listView.currentIndex !== index && !model.childCount) {
                        listView.currentIndex = index
                        //shrink other items;
                    }
                    if(model.childCount){
                        model.expanded=!model.expanded;
                    }

                    //shrink other items;

                    for(var i=0; i<listModel.count;i++){

                        if(i!==index && i!==model.parentId){
                            listModel.get(i).expanded=false;
                        }
                    }
                }

                onExpandedChanged: {
                    for(var i=0; i<model.childCount;i++){
                        listModel.get(index+1+i).hidden=!expanded
                    }
                }

            }//delegate

            ListModel{
                id: listModel;
                dynamicRoles: false

                function indexOf(title){
                    for(var i=0; i<listModel.count; i++){
                        var item=this.get(i);
                        if(item.title===title)
                            return i
                    }
                    return -1;
                }
            }
            model: listModel

            section.property: "category"
            section.criteria: ViewSection.FullString
            section.delegate: Rectangle{ //change to item delegate  ?
                width: parent.width
                height: 52.33
                color: drawer.palette.base;
                Label {
                    text: section
                    font.bold: true
                    font.pixelSize: 10
                    anchors.left:parent.left
                    height: parent.height
                    verticalAlignment: Qt.AlignVCenter
                    anchors.leftMargin: 13
                    color: "#d4d7dd"
                }
            }
        }
    }

    //    Rectangle{
    //        color: "#ebedef"

    //        anchors{
    //            left: rootItem.left
    //            right: rootItem.right
    //            leftMargin: drawerAboveContent? 0 : drawer.opened? drawer.width : 0
    //            top: toolBar.bottom
    //            bottom: rootItem.bottom
    //        }


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
        implicitWidth:currentItem.implicitWidth+40
        implicitHeight: currentItem.implicitHeight+40
        padding: rootItem.drawerAboveContent? 0 : 15
        initialItem: Page{
            Rectangle{
                implicitHeight: 500
                implicitWidth: 500
                anchors.fill: parent
            }
        }

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

            if(item.childItems){
                item.childCount=item.childItems.length;
                item.expanded=false;
                listModel.append(item);
                for(var j=0; j<item.childItems.length; j++){
                    var child=item.childItems[j];

                    child.id=listModel.count
                    child.parentId=item.id
                    child.hidden=true;
                    child.category=item.category;
                    listModel.append(child);
                }
            }else{
                listModel.append(item);
            }
        }
        //stack.replace(listModel.get(listView.currentIndex).path)
        //listView.currentIndex=listModel.indexOf("activities");
        listView.currentIndex=2
    }

    Component.onCompleted: populateNavBar();
    function populateNavBar() {
        var listItems = NavJS.navBar();
        parseNavbar(listItems);
    }
}
