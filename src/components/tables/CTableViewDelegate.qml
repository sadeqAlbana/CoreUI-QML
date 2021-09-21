import QtQuick 2.15
import QtQuick.Controls 2.15

ItemDelegate {
    id: control
    property bool  isCurrentItem : TableView.view.hoveredRow===model.row
    property color  textColor : "#4F5D73"


    implicitWidth: 100
    implicitHeight: 60

    hoverEnabled: true
    highlighted: TableView.view.selectedRow===model.row;
    onClicked: {TableView.view.selectedRow=model.row; forceActiveFocus();}

    onHoveredChanged: {
        if(hovered){
            TableView.view.hoveredRow=model.row;
        }
    }

    states:[
        State{
            id: hnh
            name: "hovered_highlighted"
            when: highlighted && isCurrentItem
            extend: "highlighted"
            PropertyChanges {target: control; textColor: "black"}
        },

        State{
            id: stateHighlighted;
            name: "highlighted"
            when: highlighted
            PropertyChanges {target: rect; color: "#0078D7"}
            PropertyChanges {target: control; textColor: "white"}
        },
        State{
            id: stateHovered;
            name: "hovered"
            when: isCurrentItem
            PropertyChanges {target: rect; color: Qt.darker("#F2F2F3",1.3)}
            PropertyChanges {target: control; textColor: "white"}
        }
    ]


    contentItem: Text {
        id: contentItem
        anchors.centerIn: parent
        text: model.display? model.display : ""
        horizontalAlignment: TextEdit.AlignHCenter
        verticalAlignment: TextEdit.AlignVCenter
        color: textColor

    }

    background: Rectangle{id: rect; color: model.row%2==0 ? "#F2F2F3" : "white"; border.color: "#D8DBE0"}
}
