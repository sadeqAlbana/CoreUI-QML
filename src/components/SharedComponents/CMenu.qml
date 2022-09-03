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

Menu {
    id: control
    modal: true
    dim: false
    property string icon;
    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 200 }
    }

//    implicitWidth: implicitContentWidth

    background: Rectangle{
        implicitWidth: 200
        border.color: "transparent"
        radius: 5
        layer.enabled: true
        layer.effect:  DropShadow{
            radius: 16
            verticalOffset: 2
            spread: 0.1
            color: "silver"
            cached: true
            transparentBorder: true
        }
    }

}
