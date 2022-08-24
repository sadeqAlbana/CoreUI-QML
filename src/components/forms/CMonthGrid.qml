import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

MonthGrid {
    id: control

    delegate: Button {
        required property var model
        opacity: enabled? 1 : 0
        enabled: model.month === control.month ? 1 : 0
        text: model.day
        font: control.font
        flat: true
        checkable: true
        autoExclusive: true
        onClicked: {
            checked=true
            control.clicked(model.date)
        }



    }


}
