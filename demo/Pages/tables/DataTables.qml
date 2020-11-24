import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5

Item{
    anchors.fill: parent;
    Item{
        id: item
        anchors.fill: parent;
        ListView{
            id: headerView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            implicitHeight: 50
            orientation: ListView.Horizontal
            boundsBehavior: Flickable.StopAtBounds

            model: TableModel.columnCount();

            delegate: Rectangle {

//                Component.onCompleted: {
//                    console.log("index " + index )
//                }

                implicitWidth: tableview.width/tableview.model.columnCount();
                implicitHeight: 50

                TextEdit {
                    anchors.centerIn: parent
                    text: TableModel.headerData(index,Qt.Horizontal);
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#4F5D73"

                    selectByMouse: true
                    //readOnly: true
                    persistentSelection: true
                    readOnly: true

                    font.bold: true
                }

                color:"white"
                border.color: "#D8DBE0"
            }

        }

        TableView{
            id: tableview
            boundsBehavior: Flickable.StopAtBounds
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: headerView.bottom
            anchors.bottom: parent.bottom

            clip: true
            model: TableModel
            columnWidthProvider: function (column)
            {
                return tableview.width/model.columnCount()
            }


            onWidthChanged: forceLayout();

            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 70



                TextEdit {
                    anchors.centerIn: parent
                    text: display
                    horizontalAlignment: TextEdit.AlignHCenter
                    verticalAlignment: TextEdit.AlignVCenter
                    color: "#4F5D73"

                    selectByMouse: true
                    //readOnly: true
                    persistentSelection: true
                    readOnly: true
                }

                color: row%2==0 ? "#F2F2F3" : "white"
                border.color: "#D8DBE0"
            }
        }
    }

}

