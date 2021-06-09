import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import QtQml.Models 2.12
import "components/notifications"
import "components/base"
import "components/SharedComponents"
Item {
    id: rootItem
    property alias screenLoader: baseLoader
    ToolBar{
        id: toolBar;
        y:0
        width:drawer.opened ? rootItem.width-drawer.width : rootItem.width
        //        x: rootItem.width-drawer.width
        x: drawer.opened ? drawer.width  : 0
        height: 56
        background: Rectangle{

            color: "white"
        }

        RowLayout {
            anchors.fill: parent
            ToolButton {
                Layout.leftMargin: 20
                id : toggleButton
                text: qsTr("☰")
                contentItem: Text{
                    color: "#7f7f8a"
                    text: toggleButton.text
                    font.pointSize: 15
                }

                onClicked: drawer.opened ? drawer.close() : drawer.open();
                background: Rectangle{
                    color: "white"
                }

            }

            Label {
                text: "Dashboard"
                //elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                color: "#7f7f8a"
            }
            ToolButton {
                text: qsTr("‹")
                //onClicked: stack.pop()
                background: Rectangle{
                    color: "white"
                }
            }
        }

        Rectangle{
            anchors.fill: parent;
            border.color: "#d8dbe0"
            color: "transparent"
        }


    }

    ToolBar{
        id: breadcrumbToolbar
        y:toolBar.height
        width:drawer.opened ? rootItem.width-drawer.width : rootItem.width
        //        x: rootItem.width-drawer.width
        x: drawer.opened ? drawer.width  : 0
        height: 56

        background: Rectangle{

            color: "white"
        }
    }

    Drawer{
        id: drawer

        width: 256

        height: rootItem.height
        dim:false
        closePolicy: Popup.NoAutoClose //this causes a problem in closing
        visible: true

        background: Rectangle{
            //color: "#29363d"
            color: "#3c4b64"
        }


        ListView{
            id: listView
            anchors.fill: parent;
            interactive: true

//            onCurrentIndexChanged: {
//                console.log(currentIndex);
//            }

            property real delegateHeight: 0
            header : Rectangle{
                //color: drawer.background.color
                color: "#303c54"
                width: parent.width
                height: toolBar.height
                Image{
                    id: image
                    anchors.centerIn: parent;
                    source:"qrc:/assets/icons/coreui/brand/cib-coreui.svg"
                    sourceSize.width: 82
                    sourceSize.height: 82
                    layer.enabled: true
                    layer.effect: ColorOverlay{
                        //anchors.fill: image
                        //source:image
                        color:"white"

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
                property bool expanded: model.expanded ? model.expanded : false
                property bool hidden: model.parentId ? model.hidden : false
                MouseArea{
                    anchors.fill: parent;
                    onPressed:  mouse.accepted = false
                    cursorShape: Qt.PointingHandCursor

                }

                width: ListView.view.width
                height: 48.33
                hoverEnabled: true
                highlighted: ListView.isCurrentItem
                //: "normal"
                contentItem: RowLayout{
                    anchors.fill: parent
                    Image{
                        id: itemImage
                        property color color : "#afb5c0"
                        source: model.image ? model.image : source
                        sourceSize.width: 17
                        sourceSize.height: 17

                        width: 17
                        height: 17
                        //                        width: 56
                        //                        height: 17.5
                        Layout.alignment: Qt.AlignVCenter
                        Layout.leftMargin: 13
                        layer.enabled: true
                        layer.effect: ColorOverlay{
                            //id: overlay
//                            anchors.fill: itemImage
//                            source:itemImage
                            color: itemImage.color
                        }

                    }
                    Label{
                        id:  itemText
                        text:model.title
                        color : "#afb5c0"
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        horizontalAlignment: Qt.AlignLeft
                        verticalAlignment: Qt.AlignVCenter
                        Layout.leftMargin: 10
                        font.family: "-apple-system,BlinkMacSystemFont,segoe ui,Roboto,helvetica neue,Arial,noto sans,sans-serif,apple color emoji,segoe ui emoji,segoe ui symbol,noto color emoji"
                        font.bold: false
                        font.pixelSize: 14
                    }

                    Label{
                        id: treeLabel
                        visible: model.childItems ? true : false
                        Layout.alignment: Qt.AlignRight
                        Layout.rightMargin: 13
                        text: "‹"
                        font.pointSize: 13
                        color: "#7f7f8a"
                        smooth: true

                        states:
                            State{
                            name: "toggled"
                            PropertyChanges {target: treeLabel; rotation: -90}
                        }

                        transitions: Transition {
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
                        when: model.parentId && !model.hidden && !hovered && !highlighted;
                        PropertyChanges {target: controlBackground; color: "#303c50"}
                    },

                    State{
                        id:expandedHovered
                        name: "expandedHovered";
                        when: expanded && hovered;
                        extend: "hovered";
                        PropertyChanges {target: treeLabel; state: "toggled";}
                    },
                    State{
                        id:stateHidden
                        name: "hidden";
                        when: hidden
                        PropertyChanges {target: control; height:0;}
                    },

                    State{
                        id:stateExpanded
                        name: "expanded";
                        when: control.expanded;
                        PropertyChanges {target: treeLabel; state: "toggled";}
                        PropertyChanges {target: controlBackground; color: "#303c50"}
                    },
                    State{
                        id: stateHovered;
                        name: "hovered"
                        when: control.hovered
                        PropertyChanges {target: controlBackground; color: "#321fdb"}
                        PropertyChanges {target: itemText; color: "white"}
                        PropertyChanges {target: itemImage; color: "white"}
                        PropertyChanges {target: treeLabel; color: "white"}
                        PropertyChanges {target: treeLabel; font.bold: true}
                    },
                    State{
                        id:stateHighlighted
                        name: "highlighted"
                        when: control.highlighted
                        PropertyChanges {target: controlBackground; color: "#46546c" }
                        PropertyChanges {target: itemText; color: "white"}
                        PropertyChanges {target: itemImage; color: "white"}
                        //PropertyChanges {target: treeLabel; state: "toggled";}
                    }

                ]


                background: Rectangle{
                    id: controlBackground
                    opacity: enabled ? 1 : 0.3
                    color: drawer.background.color
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

            }

            model: ListModel{
                id: listModel;
                dynamicRoles: false
            }

            section.property: "category"
            section.criteria: ViewSection.FullString
            section.delegate: Rectangle{ //change to item delegate  ?
                id: sectionHeading
                width: parent.width
                height: 52.33
                color: drawer.background.color;
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
        modal: false
    }

    Rectangle{
        id: contentArea
        y: toolBar.height+breadcrumbToolbar.height
        width:drawer.opened ? rootItem.width-drawer.width : rootItem.width
        x: drawer.opened ? drawer.width  : 0
        height: rootItem.height-toolBar.height-breadcrumbToolbar.height
        color: "#ebedef"

        //content here


        Loader{
            id: baseLoader
            anchors.fill: parent
            anchors.margins: 30
            source: listModel.get(listView.currentIndex).path; //change this later
        }
    }

    function parseNavbar(listItems){
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

        //listView.currentIndex=5
        //listView.currentIndex=30
        listView.currentIndex=48

    }




    Component.onCompleted: {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "qrc:/CoreUI/nav.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                var listItems = xhr.responseText;
                parseNavbar(JSON.parse(listItems));
            }
        };
        xhr.send();
    }
}
