import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts;
import QtQuick.Controls.impl as Impl
import CoreUI.Notifications
import CoreUI.Buttons
import CoreUI.Impl
CButton {
    id: control
    clip: true
    radius: 0
    property bool expanded: model.expanded ? model.expanded : false
    property bool hidden: model.parentId ? model.hidden : false
    alignment: Qt.AlignLeft | Qt.AlignVCenter
//    property bool hasChildren: model.childItems.length
    width: ListView.view.width
    height: 49
    hoverEnabled: true
    highlighted: ListView.isCurrentItem || expanded || hovered
//    icon.color: "#afb5c0"
    icon.width: 19
    icon.height: 19
    icon.cache: true
//    icon.color: control.highlighted ? control.palette.highlightedText : control.palette.text
    icon.name: model.image?? ""
    display: AbstractButton.TextBesideIcon
    leftPadding: 13
    text: model.title

//    contentItem: RowLayout {
//        anchors.fill: parent
//        Impl.IconImage {
//            name: control.icon.name
//            source: control.icon.name.length ? control.icon.name : control.icon.source
//            color: control.icon.color
//            width: control.icon.width
//            height: control.icon.height
//            cache: control.icon.cache
//            fillMode: Image.PreserveAspectFit
//            Layout.alignment: Qt.AlignVCenter
//            Layout.leftMargin: 13
//            sourceSize: Qt.size(control.icon.width, control.icon.height)
//        }

//        Label {
//            text: model.title
//            color: control.palette.buttonText
//            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            horizontalAlignment: Qt.AlignLeft
//            verticalAlignment: Qt.AlignVCenter
//            Layout.leftMargin: 10

//            font.bold: false
//            font.pixelSize: 16
//            font.weight: Font.Medium
//        }

//        Label {
//            visible: model.childItems ? true : false
//            Layout.alignment: Qt.AlignRight
//            Layout.rightMargin: 13
//            text: "‹"
//            font.pointSize: 13
//            color: control.hovered ? "#fff" : "#7f7f8a"

//            font.bold: control.hovered
//            rotation: control.expanded ? -90 : 0

//            Behavior on color {
//                ColorAnimation {
//                    easing.type: Easing.InOutQuad
//                    duration: 300
//                }
//            }
//            Behavior on rotation {
//                RotationAnimation {
//                    duration: 150
//                    direction: RotationAnimation.Shortest
//                }
//            }
//        }

//        Badge {
//            visible: model.badge ? true : false
//            Layout.rightMargin: 13
//            width: parent.width / 8
//            height: parent.height / 3
//            text: model.badge ? model.badge.text : ""
//            state: model.badge ? model.badge.variant : ""
//        }
//    }
//    transitions: [
//        Transition {
//            from: "hidden"
//            //                        to: ""
//            reversible: true
//            SequentialAnimation {
//                PropertyAnimation {
//                    property: "height"
//                    duration: 75
//                }
//            }
//        },
//        Transition {
//            reversible: true
//            from: "*"
//            to: "hovered"
//            ColorAnimation {
//                easing.type: Easing.InOutQuad
//                duration: 300
//                //alwaysRunToEnd: true
//            }
//        }
//    ]

//    states: [

//        State {
//            name: "visibleChild"
//            //when: model.parentId && !model.hidden && !hovered && !highlighted;
//            PropertyChanges {
//                target: control
//                palette.button: "#303c50"
//            }
//        },

//        State {
//            id: stateHidden
//            name: "hidden"
//            when: hidden
//            PropertyChanges {
//                target: control
//                height: 0
//            }
//        },

//        State {
//            name: "expanded"
//            when: control.expanded
//            PropertyChanges {
//                target: control
//                palette.button: "#303c50"
//            }
//        },
//        State {
//            name: "hovered"
//            when: control.hovered
//            PropertyChanges {
//                target: control
//                palette.button: "#321fdb"
//            }
//            PropertyChanges {
//                target: control
//                palette.buttonText: "white"
//            }
//            PropertyChanges {
//                target: control
//                icon.color: "white"
//            }
//        },
//        State {
//            name: "highlighted"
//            when: control.highlighted
//            PropertyChanges {
//                target: control
//                palette.button: "#46546c"
//            }
//            PropertyChanges {
//                target: control
//                palette.buttonText: "white"
//            }
//            PropertyChanges {
//                target: control
//                icon.color: "white"
//            }
//        }
//    ]

//    background: ButtonBackground {
//        opacity: enabled ? 1 : 0.3
//        layer.enabled: false

//    }

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
