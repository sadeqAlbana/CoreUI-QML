import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
FormGroup {
    property alias textInput: input

    ColumnLayout{
        id:layout
        Layout.fillWidth: true
        Layout.leftMargin: 10
        Layout.rightMargin: 10
        CTextInput{
            id:input
            Layout.fillWidth: true
        }
        Label{
            id: helpBlock
            visible: text!=""
            text: "test"
            color: label.color

            Component.onCompleted: {
                label.bottomPadding = Qt.binding(function(){return (visible && horizontal) ? height+layout.spacing : 0})
            }
        }
    }
}
