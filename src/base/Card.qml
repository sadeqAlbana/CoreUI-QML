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
import QmlRoundedRectangle
import CoreUI
Page{
    id: control
    property CBorder border: CBorder{
        color: control.palette.shadow;
        radius: 5
    }
    LayoutMirroring.childrenInherit: true

    background: Rectangle{
        color : control.palette.base
        border.color: control.border.color;
        radius: control.border.radius
        antialiasing: true

        layer.enabled: false
        layer.effect:  DropShadow{
            radius: 3
            verticalOffset: 1
            spread: 0.1
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
            radius: control.border.radius
            border.color: control.palette.shadow
            bottomLeft: false
            bottomRight: false
            color: CoreUI.color(CoreUI.CardHeader)
            border.width: control.border.width
        }
    }
}
