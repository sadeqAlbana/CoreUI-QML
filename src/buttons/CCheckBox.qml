import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic;
import CoreUI.Palettes
CheckBox {
    id: control
    property int radius: 0

    palette: BrandSecondary{}
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 50
        radius: control.radius


        Behavior on color{
            ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }

        }

        visible:  control.down || control.hovered
        color: {
            if(!control.enabled)
                return control.palette.button.lighter(1.3)

            if(control.down && control.hovered){
                return control.palette.button.lighter(1.2)
            }

            if(control.down || control.checkable){
                return control.palette.button.darker(1.4)

            }

            if(control.visualFocus){
                return control.palette.button.darker(1.1)
            }

            if(control.hovered){
                return control.palette.button.darker(1.1)
            }
            return control.palette.button
        }
    }
}
