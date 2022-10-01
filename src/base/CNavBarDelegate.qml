import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts;
import QtQuick.Controls.impl as Impl
import CoreUI.Notifications
import CoreUI.Buttons
import CoreUI.Impl
CItemDelegate {
    id: control
    clip: true
    readonly property bool expanded: model.expanded
    readonly property bool hidden: !control.isRoot ? model.hidden : false
    readonly property bool isRoot: !model.parentId
    height: hidden? 0 : 49
    width: ListView.view.width
    hoverEnabled: true
    highlighted: ListView.isCurrentItem
    checkable: true
    autoExclusive: true

    leftPadding: 13 + (icon.name || icon.source? 0 : icon.width)
    icon.width: 19
    icon.height: 19
    icon.cache: true
    icon.color: control.highlighted ? control.palette.highlightedText : control.palette.text
    icon.name: model.image?? ""
    display: AbstractButton.TextBesideIcon
    text: model.title



        property Item arrow: CLabel {
            parent: control
            visible: model.childItems ? true : false
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 13
            text: "‹"
            font.pointSize: 13
            color: control.hovered ? control.palette.highlightedText: control.palette.text

            font.bold: control.hovered
            rotation: control.expanded ? -90 : 0

            Behavior on color {
                ColorAnimation {
                    easing.type: Easing.InOutQuad
                    duration: 300
                }
            }
            Behavior on rotation {
                RotationAnimation {
                    duration: 150
                    direction: RotationAnimation.Shortest
                }
            }
        }

        property Item badge: Badge {
            parent: control
            visible: model.badge ? true : false
            anchors.right: parent.right
            anchors.rightMargin: 13 + (arrow.visible? arrow.width : 0)
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width / 8
            height: parent.height / 3
            text: model.badge ? model.badge.text : ""
            state: model.badge ? model.badge.variant : ""
        }


    background: Rectangle {
        opacity: enabled ? 1 : 0.3
        layer.enabled: false
        color: control.expanded?  control.palette.inactive.button :
                                  control.hovered ? control.palette.highlight :
                                                    control.highlighted? control.palette.base :
                                                                         control.isRoot? control.palette.window:
                                                                                         control.palette.inactive.button

        Behavior on color{
            ColorAnimation {easing.type: Easing.InOutQuad; duration: 300}
        }

    }

    Behavior on height{
        PropertyAnimation {
            duration: 75
        }
//        SequentialAnimation {

//        }
    }

    onClicked: {
        if (listView.currentIndex !== index && !model.childCount) {
            listView.currentIndex = index
            //shrink other items;
        }
        if (model.childCount) {
            model.expanded = !model.expanded
        }

        //shrink other items;
        for (var i = 0; i < listModel.count; i++) {

            if (i !== index && i !== model.parentId) {
                listModel.get(i).expanded = false
            }
        }
    }

    onExpandedChanged: {
        for (var i = 0; i < model.childCount; i++) {
            listModel.get(index + 1 + i).hidden = !expanded
        }
    }

    HoverHandler {
        acceptedDevices: PointerDevice.Mouse
        cursorShape: Qt.PointingHandCursor
    }
} //delegate
