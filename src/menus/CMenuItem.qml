import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import CoreUI.Palettes
MenuItem {
    id: control
    palette: BrandPrimary{}
    icon.color: control.disabled? control.palette.disabled.windowText :
                                  control.down? control.palette.active.windowText : control.palette.inactive.windowText
    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0
        leftPadding: !control.mirrored ? indicatorPadding : arrowPadding
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding

        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.disabled? control.palette.disabled.windowText :
                   control.down? control.palette.active.windowText : control.palette.inactive.windowText
    }
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20
        color: control.down?
                       control.palette.active.highlight : control.palette.inactive.highlight
        visible: control.enabled && (control.down  || control.hovered)
    }
}
