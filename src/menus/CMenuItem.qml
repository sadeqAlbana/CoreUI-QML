import QtQuick
import QtQuick.Controls.impl as Impl
import QtQuick.Controls.Basic
import CoreUI.Palettes
import QtQuick.Templates as T

T.MenuItem {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        implicitContentHeight + topPadding + bottomPadding,
                        implicitIndicatorHeight + topPadding + bottomPadding)

    palette: BrandPrimary {}

    padding: 6
    spacing: 6

    icon.width: 24
    icon.height: 24
    //      icon.color: control.palette.windowText
    icon.color: control.enabled ? control.down ? control.palette.active.windowText : control.palette.inactive.windowText : control.palette.disabled.windowText

    contentItem: Impl.IconLabel {
        readonly property real arrowPadding: control.subMenu
                                             && control.arrow ? control.arrow.width
                                                                + control.spacing : 0
        readonly property real indicatorPadding: control.checkable
                                                 && control.indicator ? control.indicator.width
                                                                        + control.spacing : 0
        leftPadding: !control.mirrored ? indicatorPadding : arrowPadding
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: Qt.AlignLeft

        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled ? control.down ? control.palette.active.windowText : control.palette.inactive.windowText : control.palette.disabled.windowText
    }

    indicator: Impl.ColorImage {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        visible: control.checked
        source: control.checkable ? "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/check.png" : ""
        color: control.icon.color
        defaultColor: "#353637"
    }

    arrow: Impl.ColorImage {
        x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        visible: control.subMenu
        mirror: control.mirrored
        source: control.subMenu ? "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/arrow-indicator.png" : ""
        color: control.palette.windowText
        defaultColor: "#353637"
    }

    background: Rectangle {
        implicitWidth: 250
        implicitHeight: 20
        color: control.down ? control.palette.active.highlight : control.palette.inactive.highlight
        visible: control.enabled && (control.down || control.hovered)
    }
}
