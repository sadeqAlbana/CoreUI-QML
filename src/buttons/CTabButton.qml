import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import QtQuick.Controls
import CoreUI
import CoreUI.Impl
import CoreUI.Palettes
import Qt5Compat.GraphicalEffects
import QmlRoundedRectangle

//https://stackoverflow.com/questions/50644627/qml-rounded-rectangle-with-border
T.TabButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 9
    leftPadding: 12
    rightPadding: 12
    spacing: 6

    icon.width: 18
    icon.height: 18
    icon.color: control.checked? "#768192" : control.palette.link
    property int radius : 6

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.checked? "#768192" : control.palette.link
    }
    background: RoundedRectangle{
        radius: control.radius
        color: "#00ffffff"
        borderColor: control.palette.shadow
        visible: control.checked || control.hovered
        radiusBL: 0
        radiusBR: 0
        borderWidth: 1
        Rectangle{
            color: control.palette.base
            height: 2
            anchors.bottom: parent.bottom
            width: control.width-2
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
