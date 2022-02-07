import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
FormGroup {
    property alias input: control
    CTextField{
        id:control
        Layout.fillWidth: true
        //Layout.fillHeight: true //setting it to false was causing a problem inside cards....margins !
    }
}
