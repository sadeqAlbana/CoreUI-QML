import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/CoreUI/components/SharedComponents"
FormGroup {
    property alias textInput: input
    property alias text: input.text
    property alias leftRectContent: leftRectLoader.sourceComponent
    property alias leftRectVisible: leftRect.visible
    property alias rightRectVisible: rightRect.visible
    property alias rightRectContent: rightRectLoader.sourceComponent

    ColumnLayout{
        id:layout
        Layout.fillWidth: true
        RowLayout{
        spacing: 0
            RoundedRect{
                id: leftRect;
                visible: false
                topRight: false
                bottomRight: false
                radius: input.background.radius
                implicitHeight: input.height
                implicitWidth: leftRectLoader.implicitWidth
                color: "#F0F3F5"
                Layout.rightMargin: -1*(input.border.width+input.radius)
                Component.onCompleted: {
                    input.background.topLeft=Qt.binding(function(){return !visible })
                    input.background.bottomLeft=Qt.binding(function(){return !visible })
                    border.color= input.border.color
                }
                Loader{
                    id:leftRectLoader
                    anchors.fill: parent;
                    sourceComponent: Label{
                        leftPadding: 10
                        rightPadding: 15
                        width: paintedWidth
                        height: paintedHeight
                        anchors.centerIn: parent
                        text: "Left"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                    }
                }
            }

            CTextInput{
                id:input
                Layout.fillWidth: true
                z:2
            }

            RoundedRect{
                id: rightRect;
                visible: false
                topLeft: false
                bottomLeft: false
                radius: input.background.radius
                implicitHeight: input.height
                implicitWidth: rightRectLoader.implicitWidth
                color: "#F0F3F5"
                Layout.leftMargin: -1*(input.border.width+input.radius)
                Component.onCompleted: {
                    input.background.topRight=Qt.binding(function(){return !visible })
                    input.background.bottomRight=Qt.binding(function(){return !visible })
                    border.color= input.border.color
                }
                Loader{
                    id:rightRectLoader
                    anchors.fill: parent;
                    sourceComponent: Label{
                        leftPadding: 15
                        rightPadding: 10
                        width: paintedWidth
                        height: paintedHeight
                        anchors.centerIn: parent
                        text: "Right"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                    }
                }
            }
        }
        Label{
            id: helpBlock
            visible: text!=""
//            text: "test"
            color: label.color
            Component.onCompleted: {
                label.bottomPadding = Qt.binding(function(){
                    return (visible && horizontal) ? height+layout.spacing : 0})
            }
        }
    }//layout end
}
