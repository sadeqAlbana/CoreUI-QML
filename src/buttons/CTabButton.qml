import QtQuick
import QtQuick.Controls.Basic
import CoreUI
import CoreUI.Impl
import CoreUI.Palettes
import Qt5Compat.GraphicalEffects
import QmlRoundedRectangle

//https://stackoverflow.com/questions/50644627/qml-rounded-rectangle-with-border
TabButton {
    id: control
    property int radius: 6
    background: RoundedRectangle{
        radius: control.radius
        color: "#00ffffff"
        borderColor: control.down || control.hovered ? control.palette.shadow: "#00ffffff"
        radiusBL: 0
        radiusBR: 0
        borderWidth: 1

    }




}
