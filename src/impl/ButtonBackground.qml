import QtQuick
import QtQuick.Templates
import CoreUI
import Qt5Compat.GraphicalEffects
Rectangle {
    id: rect
    required property Button control;
    property int glowRadius: 4
    property bool glow: true
        implicitWidth: 60
        implicitHeight: 35

        Behavior on color{
            ColorAnimation {easing.type: Easing.InOutQuad; duration: 150}
        }

        opacity: visible? 1 : 0

        visible: !control.flat || control.down || control.checked || control.highlighted || control.hovered
        color: control.enabled?
                   (control.hovered || control.down || control.visualFocus || control.focus)? control.palette.active.button : control.palette.inactive.button :
        control.palette.disabled.button

        //layer.enabled:
        RectangularGlow {
            visible: control.enabled && control.activeFocus && glow
            anchors.fill: parent
            glowRadius: rect.glowRadius;
            spread: 1
            color: control.palette.button
            opacity: 0.5
            z:-1
            cached: true
            cornerRadius: rect.radius+1
            smooth: true
            antialiasing: true
        }
        border.color: control.palette.highlight
        border.width:  control.CoreUI.borderWidth

    }//background
