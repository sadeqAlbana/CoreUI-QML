import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/forms"
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
GridLayout {
    property bool horizontal: false
    //property alias label: textLabel
    rows: horizontal ? 1 : 2
    columns: horizontal ? 2 : 1

    Label{
        id: textLabel
        verticalAlignment: horizontal ? Qt.AlignVCenter : Qt.AlignBottom
        Layout.fillHeight: horizontal
        Layout.leftMargin: 10
        Layout.rightMargin: 10
        //Layout.topMargin: horizontal ? 0 : 10
        //Layout.bottomMargin: 0
        color: "#3c4b64"
        text: "Name"
    }
}
