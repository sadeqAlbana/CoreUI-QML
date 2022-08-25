import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import "qrc:/CoreUI/palettes"
import "qrc:/CoreUI/components/buttons"
import QtQuick.Templates as T

Button {
    id: control

    palette: BrandInfo{
        dark: "#2267AC" //highlighted
        mid: "#0078D7" //checked

    }
    flat: true
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        visible: !control.flat || control.down || control.checked || control.highlighted
        color: Color.blend(control.checked ? control.palette.dark :  control.highlighted? control.palette.button:
                                             control.palette.mid,
                                                                    control.palette.mid, control.down ? 0.5 : 0.0)
        border.color: control.palette.highlight
        border.width: control.visualFocus ? 2 : 0
    }

}
