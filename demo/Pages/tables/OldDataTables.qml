import QtQuick 2.12
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4 as TT
import QtQml.Models 2.12
import "qrc:/CoreUI/components/tables/"
Item{
anchors.fill: parent;

    QQTableView{
        anchors.fill: parent

        model: TableModel
                TT.TableViewColumn {
                    id: titleColumn
                    title: "Title"
                    role: "display"
                    movable: false
                    resizable: true
                }

                TT.TableViewColumn {
                    id: authorColumn
                    title: "Author"
                    role: "display"
                    movable: false
                    resizable: true
                }
    }
}

