import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
FormGroup {
    property alias comboBox: input
    CComboBox{
        id:input
        Layout.fillWidth: true
        Layout.leftMargin: 10
        Layout.rightMargin: 10
    }
}
