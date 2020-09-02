import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/SharedComponents"
FormGroup {
    property alias textInput: input

    ColumnLayout{
        id:layout
        Layout.fillWidth: true
        Layout.leftMargin: 10
        Layout.rightMargin: 10

        RowLayout{
        spacing: 0
            RoundedRect{

                topRight: false
                bottomRight: false
                radius: input.background.radius
                implicitHeight: input.height
                implicitWidth: 50
                color: "#F0F3F5"
                Layout.rightMargin: -1*(input.border.width+input.radius)
                Component.onCompleted: {
                    input.background.topLeft=Qt.binding(function(){return !visible })
                    input.background.bottomLeft=Qt.binding(function(){return !visible })
                    border.color= input.border.color

                }
            }

            CTextInput{
                id:input
                Layout.fillWidth: true
            }
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
