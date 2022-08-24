import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "qrc:/CoreUI/palettes"
import "qrc:/CoreUI/js/DateUtils.js" as DateUtils
CTextField {
    id: control
    property date date: new Date()
    onDateChanged: {
        control.text=Qt.formatDate(control.date,"yyyy-MM-dd")
    }
    //Qt.formatDate("date","yyyy-mm-dd")
    inputMethodHints: Qt.ImhDate
    //inputMask: "0000-00-00"
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

        palette.window: "#fff"


        GridLayout {
            id: layout
            rows: 3
            anchors.fill: parent;


            RowLayout{
                Layout.row: 0

                Button{
                    text: "‹"
                    flat: true
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                    display: AbstractButton.TextOnly
                    font.pixelSize: 35
                    implicitWidth: 50
                    onClicked: control.date=control.date.addMonths(-1);


                }

                Label{
                    Layout.fillWidth: true
                    text: Qt.formatDate(control.date,"MMMM yyyy")
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    Layout.alignment: Qt.AlignCenter
                }

                Button{
                    text: "›"
                    flat: true
                    font.pixelSize: 35

                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                    display: AbstractButton.TextOnly
                    implicitWidth: 50
                    onClicked: control.date=control.date.addMonths(1);



                }
            }



            DayOfWeekRow {
                locale: grid.locale
                Layout.row: 1
                Layout.fillWidth: true
                hoverEnabled: true
            }

            CMonthGrid {
                id: grid
                month: control.date.getMonth();
                year: 2022
                locale: Qt.locale("en_US")
                Layout.row: 2
                Layout.fillWidth: true
                Layout.fillHeight: true


                onClicked: (date)=> {
                    control.date=date
                }
            }
        }
    }//popup
}
