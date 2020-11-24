import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4 as TT
import QtQml.Models 2.12
TT.TableView{
    id: tableView
    frameVisible: false
    sortIndicatorVisible: false
    Layout.minimumWidth: 400
    Layout.minimumHeight: 240
    Layout.preferredWidth: 600
    Layout.preferredHeight: 400

    //        model: TableModel

    rowDelegate: Item{
        height: 70

    }

    headerDelegate : Rectangle {

        implicitHeight: 50

        TextEdit {
            anchors.centerIn: parent
            text: styleData.value
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

    itemDelegate: Rectangle {
        implicitWidth: 100
        implicitHeight: 70


        TextEdit {
            anchors.centerIn: parent
            text: styleData.value
            horizontalAlignment: TextEdit.AlignHCenter
            verticalAlignment: TextEdit.AlignVCenter
            color: styleData.selected ? "white"  : "#4F5D73"
            selectByMouse: true
            //readOnly: true
            persistentSelection: true
            readOnly: true
        }

        color:  {
            var itemColor=styleData.row%2==0 ? "#F2F2F3" : "white";
            return styleData.selected ? "#0078D7" : itemColor
        }
        border.color: styleData.selected ? "#0078D7" :  "#D8DBE0"
    }

}


