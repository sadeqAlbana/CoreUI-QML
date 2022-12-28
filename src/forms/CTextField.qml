/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import QtQuick.Controls.impl as Impl
import QtQuick.Layouts
import CoreUI
TextField {
    id:control
    selectByMouse: true
    signal entered(var text)
    onAccepted: entered(control.text)

    background: RoundedRect{
        implicitHeight: 40
        implicitWidth: 200
        color : control.enabled? control.palette.base : control.palette.disabled.base
        border.color: control.acceptableInput? control.palette.shadow : CoreUI.danger
        radius: CoreUI.borderRadius
        layer.enabled: control.activeFocus
        layer.effect: Glow {
            spread: 1
            color: CoreUI.boxShadow
            transparentBorder: true
            cached: true
            samples: radius+1
        }
    }//background
}
