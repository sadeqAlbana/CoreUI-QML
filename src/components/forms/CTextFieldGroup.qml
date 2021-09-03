import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
FormGroup {
    property alias input: control
    CTextInput{
        id:control
        Layout.fillWidth: true
    }
}
