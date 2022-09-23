import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import CoreUI.Palettes
import CoreUI.Buttons
import "DateUtils.js" as JS
MonthGrid {
    id: control
    required property date date

    delegate: CMonthGridButton {
        required property var model

        opacity: model.month === control.month ? 1 : 0
        hoverEnabled: true
        highlighted: hovered && enabled
        text: model.day
        font: control.font
        //checkable: enabled
        checked: model.date.compare(control.date)
        autoExclusive: true
        onClicked: {
            if (opacity > 0) {
                control.clicked(model.date)
            }
        }
    }
}
