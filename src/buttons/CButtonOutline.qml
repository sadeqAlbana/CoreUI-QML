/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import CoreUI.Impl
import CoreUI
import QtQuick.Controls.impl as Impl
import Qt5Compat.GraphicalEffects

CButton {
    id: control
    CoreUI.borderWidth: 1

    background: ButtonBackground{
        color: control.enabled && (control.down || control.visualFocus || control.focus || control.hovered)?  control.palette.active.button  : "transparent"
        border.color: control.palette.button
        radius: control.radius
        control: control

        glowRadius: 4
        layer.enabled: false
    }

    contentItem: Impl.IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
//        color: control.enabled?
//                   control.down || control.checked? control.palette.active.buttonText :control.palette.inactive.buttonText : control.palette.disabled.buttonText

        color: control.enabled && (control.down || control.visualFocus || control.focus || control.hovered)? control.palette.active.buttonText : control.palette.active.button

    }
}
