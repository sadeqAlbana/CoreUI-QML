import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

CTextField {
    id: control
    //Qt.formatDate("date","yyyy-mm-dd")
    inputMethodHints: Qt.ImhDate
    //inputMask: "0000-00-00"
    text: "2000-01-01"
    rightIcon: "cil-calendar"
    validator: RegularExpressionValidator{
        //for non excact match ^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$
        regularExpression: /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/
    }

    onActiveFocusChanged: if(activeFocus) popup.open();
    Popup{
        id: popup
        parent: control
        y:parent.height
        width: 400
        height: 300


        GridLayout {
            id: layout
            rows: 3
            anchors.fill: parent;
            property date date;
            RowLayout{
                Layout.row: 0

                Button{
                    icon.name: "cil-arrow-thick-left"
                    flat: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                    display: AbstractButton.IconOnly
                    implicitWidth: 50
                }

                Label{
                    Layout.fillWidth: true
                    text: Qt.formatDate(layout.date,"MMMM yyyy")
                    font.bold: true

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    Layout.alignment: Qt.AlignCenter
                }

                Button{
                    icon.name: "cil-arrow-thick-right"
                    flat: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                    display: AbstractButton.IconOnly
                    implicitWidth: 50


                }
            }

            CalendarModel{
                id: cmodel;
                from: "1900-01-01"
                to: new Date()
            }

            DayOfWeekRow {
                locale: grid.locale
                Layout.row: 1
                Layout.fillWidth: true
                hoverEnabled: true
            }

            CMonthGrid {
                id: grid
                month: Calendar.August
                year: 2022
                locale: Qt.locale("en_US")
                Layout.row: 2
                Layout.fillWidth: true
                Layout.fillHeight: true


                onClicked: (date)=> {
                    console.log("clicked: " + date)
                    layout.date=date
                }
            }
        }
    }//popup
}
