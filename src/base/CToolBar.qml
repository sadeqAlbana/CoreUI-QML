import QtQuick
import QtQuick.Templates as T
import Qt5Compat.GraphicalEffects

T.ToolBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    background: Rectangle {
        implicitHeight: 40
        color: control.palette.base
        border.color: control.palette.shadow
    }

    layer.enabled: true
    layer.effect:  DropShadow{
        radius: 3
        verticalOffset: 1
        spread: 0.1
        color: control.palette.shadow
        cached: true
        transparentBorder: true
    }
}
