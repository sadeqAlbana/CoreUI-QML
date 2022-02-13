/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15
import QtQuick.Layouts 1.15
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4 as TT
import QtQuick.Controls.Styles 1.4 as TS
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

    style: TS.TableViewStyle{

        frame: Rectangle{
            //border.color: "#D8DBE0"
            color: "#D8DBE0"
            //border.width: 10
        }
        transientScrollBars: true

//        scrollBarBackground: Rectangle{
//            color: "red"
//        }

    }


//    style: TS.ScrollViewStyle{
//        frame: Rectangle{
////            border.color: "red"
//            color: "red"
//        }
//    }

    headerDelegate : Rectangle {
        clip: true
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
            font.pixelSize: 18
            font.bold: true
        }

        color:"white"
        border.color: "#D8DBE0"
    }

    itemDelegate: QQTableViewItemDelegate{

    }

}


