import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "qrc:/CoreUI/palettes"
import "qrc:/CoreUI/components/buttons"

MonthGrid {
    id: control

    delegate: Button {
        required property var model
        palette: BrandInfo{
            //dark: "#3399ff"
            //mid: "#3399ff"

        }

        opacity: enabled? 1 : 0
        enabled: model.month === control.month ? 1 : 0
        hoverEnabled: true
        highlighted: hovered;
        text: model.day
        font: control.font
        flat: true
        checkable: true
        autoExclusive: true
        onClicked: {
            checked=true
            down=true
            control.clicked(model.date)
        }



    }


}
