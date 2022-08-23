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
            rows: 2
            anchors.fill: parent;

            DayOfWeekRow {
                locale: grid.locale

                Layout.row: 0
                Layout.fillWidth: true
                hoverEnabled: true
            }



            MonthGrid {
                id: grid
                month: Calendar.August
                year: 2022
                locale: Qt.locale("en_US")
                Layout.row: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                hoverEnabled: true

                onClicked: {
                    console.log("clicked: "   + date);
                }

                delegate: Button {
                    //horizontalAlignment: Text.AlignHCenter
                  //  verticalAlignment: Text.AlignVCenter
                   // opacity: grid.month === grid.month ? 1 : 0
                    autoExclusive: true
                    checked: model.day=parseInt(text)
                    text: model.day
                    font: grid.font

                    required property var model
                }
            }
        }
    }//popup
}
