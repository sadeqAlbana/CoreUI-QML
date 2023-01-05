

/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */
import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Templates as T
import QtQuick.Controls.impl as Impl
import CoreUI.Impl
import CoreUI
T.RoundButton {
    id: control

    property int shadowRadius: control.enabled ? (control.down ? 16 : (control.hovered ? 8 : 2)) : 0
    property int alignment: Qt.AlignCenter
    property bool glow: true
    radius: CoreUI.borderRadius
    padding: control.font.pixelSize/2
    horizontalPadding: padding + 6
    spacing: 6
    hoverEnabled: true
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    icon.width: control.height * 0.5
    icon.height: control.height * 0.5
    icon.color: control.enabled?
               control.down || control.checked? control.palette.active.buttonText :control.palette.inactive.buttonText : control.palette.disabled.buttonText
    opacity: control.enabled? 1: 0.65


    contentItem: Impl.IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        alignment: control.alignment
        icon: control.icon
        text: control.text
        font: control.font
        color: control.enabled?
                   control.down || control.checked? control.palette.active.buttonText :control.palette.inactive.buttonText : control.palette.disabled.buttonText
    } //contentItem



    background: ButtonBackground {
        control: control
        radius: control.radius
        glow: control.glow

    }

}
