import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import CoreUI.Palettes
import CoreUI.Buttons
import "DateUtils.js" as JS
CTextField {
    id: control

    function clearDate(){
        control.date=new Date()
        control.clear();
    }

    property date date: new Date()
    Component.onCompleted: text=""
    onDateChanged: {
        control.text=Qt.formatDate(control.date,"yyyy-MM-dd")
    }

    onTextChanged: {
        if(acceptableInput){
            let newDate=new Date(Date.parse(control.text));
            if(!control.date.compare(newDate)){
                control.date=newDate;
            }
        }
    }

    inputMethodHints: Qt.ImhDate
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
        height: 400
        modal: false
        closePolicy: Popup.CloseOnPressOutside | Popup.CloseOnPressOutsideParent |
                     Popup.CloseOnReleaseOutside | Popup.CloseOnReleaseOutsideParent |
                     Popup.CloseOnEscape

        palette.window: "#fff"

        onActiveFocusChanged: if(!activeFocus) popup.close();

        GridLayout {
            id: layout
            rows: 5
            anchors.fill: parent;


            RowLayout{
                Layout.row: 0

                Button{
                    text: "‹"
                    flat: true
                    padding: 4
                    bottomPadding: 7
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
                    padding: 4
                    bottomPadding: 7
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
                date: control.date
                month: control.date.getMonth();
                year: 2022
                locale: Qt.locale("en_US")
                Layout.row: 2
                Layout.fillWidth: true
                Layout.fillHeight: true



                onClicked: (date)=> {
                    control.date=date;
                }
            }

            Rectangle{
                color: "black"
                implicitHeight: 1
                Layout.fillWidth: true
                Layout.row: 3
                Layout.topMargin: 5
                Layout.bottomMargin: 5

            }

            RowLayout{
                Layout.row: 4
                CButton{
                    text: qsTr("Today")
                    palette: BrandLight{}
                    layer.enabled: false
                    onClicked: {
                        control.date= new Date();
                    }

                }
                Item{Layout.fillWidth: true;}
                CButton{
                    text: qsTr("Clear")
                    palette: BrandLight{}
                    layer.enabled: false
                    onClicked: control.clearDate();
                }
            }

        }
    }//popup
}
