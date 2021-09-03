import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
FormGroup {
    property alias comboBox: input
    CheckableComboBox{
        id:input
        Layout.fillWidth: true
    }
}
