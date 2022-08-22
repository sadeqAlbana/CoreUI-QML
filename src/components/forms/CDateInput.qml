import QtQuick
import QtQuick.Controls.Basic

CTextField {
    //Qt.formatDate("date","yyyy-mm-dd")
    inputMethodHints: Qt.ImhDate
    //inputMask: "0000-00-00"
    text: "2000-01-01"
    rightIcon: "cil-calendar"
    validator: RegularExpressionValidator{
        //for non excact match ^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$
        regularExpression: /^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$/
    }
}
