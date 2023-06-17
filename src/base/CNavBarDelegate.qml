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
    property bool expanded: false
    required property int childCount
    required property string title;
    required property int parentId
    required property string category
    property bool hidden: parentId
    readonly property bool isRoot: !control.parentId
    required property var badge;
    required property string image;
    required property int index;
    height: hidden? 0 : 49
    width: ListView.view.width
    hoverEnabled: true
    highlighted: ListView.isCurrentItem
    checkable: true
    autoExclusive: true

    leftPadding: 13 + (icon.name.length || icon.source.length? 0 : icon.width+control.spacing)
    icon.width: 19
    icon.height: 19
    icon.cache: true
    icon.color: control.highlighted ? control.palette.highlightedText : control.palette.text
    icon.name: control.image?? null
    display: AbstractButton.TextBesideIcon
    text: control.title



        property Item arrow: CLabel {
            parent: control
            visible: control.childCount
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 13
            text: "‹"
            font.pointSize: 13
            color: control.hovered ? control.palette.highlightedText: control.palette.text

            font.bold: control.hovered
            rotation: control.expanded ? -90 : 90

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

        property Item badgeDelegate: Badge {
            parent: control
            visible: control.badge ? true : false
            anchors.right: parent.right
            anchors.rightMargin: 13 + (arrow.visible? arrow.width : 0)
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width / 8
            height: parent.height / 3
            text: control.badge ? control.badge.text : ""
            state: control.badge ? control.badge.variant : ""
        }


    background: Rectangle {
//        visible: control.hovered || control.expanded || control.highlighted

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
    }

    onClicked: {
        if (listView.currentIndex !== control.index && !control.childCount) {
            listView.currentIndex = control.index
            //shrink other items;
        }
        if (control.childCount) {
            control.expanded = !control.expanded
        }

        //shrink other items;
        for (var i = 0; i < ListView.view.count; i++) {

            if (i !== control.index && i !== control.parentId) {
                ListView.view.itemAtIndex(i).expanded = false
            }
        }
    }

    onExpandedChanged: {
        for (var i = 0; i < control.childCount; i++) {
            ListView.view.itemAtIndex(control.index + 1 + i).hidden = !expanded
        }
    }

    HoverHandler {
        acceptedDevices: PointerDevice.Mouse
        cursorShape: Qt.PointingHandCursor
    }
} //delegate
