/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Controls
import CoreUI.Impl
import CoreUI
CPage{
    id: control

    LayoutMirroring.childrenInherit: true
    padding: 20
    background: Rectangle{
        color : control.palette.base
        border.color: control.palette.shadow
        radius: CoreUI.borderRadius
        antialiasing: true

        layer.enabled: false
        layer.effect:  DropShadow{
            radius: 3
            verticalOffset: 1
            spread: 0
            samples: 7
            color: control.palette.shadow
            cached: true
            transparentBorder: true
        }
    } //end background

    header: CardLabel{
        visible: control.title !==""
        text: control.title
        font.pixelSize: 16
        bottomPadding: 12
        topPadding: 16

        background: RoundedRect{
            radius: CoreUI.borderRadius
            border.color: control.palette.shadow
            bottomLeft: false
            bottomRight: false
            color: control.palette.base
            border.width: CoreUI.borderWidth
        }
    }
}
