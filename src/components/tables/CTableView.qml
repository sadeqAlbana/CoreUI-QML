import QtQuick 2.15
import QtQuick.Layouts 1.15
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
Control{ //use Container instead ?
    id: rootItem

//    enum SelectionMode{ //no need for it for now
//        SelectRows,
//        SelectItems
//    }
//    property int selectionMode:CTableView.SelectionMode.SelectRows;

    property alias model: tableView.model
    property list<Action> actions
    property alias selectedRow: tableView.selectedRow

    property alias delegate: tableView.delegate;


    implicitHeight: horizontalHeader.height+tableView.height
    implicitWidth: tableView.width

    background: Rectangle{
        border.color: "#D8DBE0"
    }


    HorizontalHeaderView {
        id: horizontalHeader
        syncView: tableView
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right


        height: 60
        clip: tableView.clip
        boundsBehavior: tableView.boundsBehavior

        delegate: CHorizontalHeaderDelegate{}




    }

    TableView{
        id: tableView

        property int selectedRow: -1
        property int hoveredRow: -1



        anchors{
            top: horizontalHeader.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom

        }

        boundsBehavior: Flickable.StopAtBounds


        clip: true


        columnWidthProvider: function (column){return tableView.width/model.columnCount();}

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.AllButtons


            enabled: tableView.selectedRow>=0
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
                    model: rootItem.actions.length
                    CMenuItem{ action: rootItem.actions[index]}
                }
            }
        } //end MouseArea

        delegate: CTableViewDelegate{}


        onWidthChanged: forceLayout();

    }


}
