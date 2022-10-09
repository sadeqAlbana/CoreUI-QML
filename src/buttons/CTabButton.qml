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
        color: "transparent"
        borderColor: control.down || control.hovered ? control.palette.shadow: "transparent"
        radiusBL: 0
        radiusBR: 0
    }




}
