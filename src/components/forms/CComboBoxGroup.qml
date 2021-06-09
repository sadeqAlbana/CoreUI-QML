import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
FormGroup {
    property alias comboBox: input
    CComboBox{
        id:input
        Layout.fillWidth: true
        Layout.leftMargin: 10
        Layout.rightMargin: 10
    }
}
