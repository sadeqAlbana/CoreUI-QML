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
import CoreUI
TextArea {
    id:control
    selectByMouse: true
    implicitHeight: 150

    background: RoundedRect{
        //border.width: 3
        implicitHeight: 40
        implicitWidth: 200
        color : control.enabled? control.palette.base : control.palette.disabled.base
        border.color:  control.palette.shadow
        radius: CoreUI.borderRadius
        layer.enabled: control.activeFocus
        layer.effect: Glow {
            spread: 1
            color: CoreUI.boxShadow
            transparentBorder: true
            cached: true

        }
    }//background
}
