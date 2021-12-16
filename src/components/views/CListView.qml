import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.15
import "qrc:/CoreUI/components/tables/"

ListView {
    id: listView
    clip: true
    property list<Action> actions;
    headerPositioning: ListView.OverlayHeader

    header: CListViewHeaderDelegate{
        title: "Categories"
        width: ListView.view.width;

    }


    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton


        enabled: listView.currentIndex>=0
        onClicked: {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup()
        }
        onPressAndHold: {
            if (mouse.source === Qt.MouseEventNotSynthesized)
                contextMenu.popup()
        }
        onDoubleClicked: console.log("double clicked")

        Menu {
            id: contextMenu
            modal: true
            dim: false

            background: Rectangle{
                implicitWidth: 300
                border.color: "silver"
                radius: 2
            }
            Repeater{
                model: listView.actions.length
                CMenuItem{ action: listView.actions[index]}
            }
        }
    } //end MouseArea


    delegate: CListViewDelegate{
        width: ListView.view.width;

    }

//    Rectangle {
//        id: scrollbar
//        anchors.right: listView.right
//        y: listView.visibleArea.yPosition * listView.height
//        width: 10
//        height: listView.visibleArea.heightRatio * listView.height
//        color: "#0078D7"
//        radius: width
//        visible: listView.childrenRect.height > listView.height
//    }
}