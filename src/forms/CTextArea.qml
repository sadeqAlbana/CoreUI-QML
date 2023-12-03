/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import CoreUI
TextArea {
    id:control
    selectByMouse: true
    implicitHeight: 150

    background: Rectangle{
        implicitHeight: 45
        implicitWidth: 200
        color : control.enabled? control.palette.base : control.palette.disabled.base
        border.color: control.validator? control.acceptableInput? CoreUI.success : CoreUI.danger :
                                                                        control.palette.shadow
        radius: CoreUI.borderRadius
        layer.enabled: control.activeFocus
        layer.effect: Glow {
            spread: 1
            color: control.validator? control.acceptableInput? CoreUI.rgba(CoreUI.success,64) :
                                                               CoreUI.rgba(CoreUI.danger,64) : CoreUI.boxShadow
            transparentBorder: true
            cached: true
        }
    }//background
}
