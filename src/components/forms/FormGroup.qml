import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/forms"
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
ColumnLayout {
    //spacing: 8
    //implicitHeight: childrenRect.height
    //implicitWidth: childrenRect.width
    Label{
        text: "Name";
        verticalAlignment: Qt.AlignBottom
        Layout.fillHeight: true
        Layout.margins: 10
        color: "#3c4b64"

    }
    CTextInput{
        placeholderText: "Enter your name"
        Layout.fillWidth: true
        Layout.margins: 10
        Layout.leftMargin: 10
        Layout.rightMargin: 10

    }

    ComboBox{
        id:cb
        Layout.fillWidth: true
        Layout.margins: 10
        Layout.leftMargin: 10
        Layout.rightMargin: 10

    }

}
