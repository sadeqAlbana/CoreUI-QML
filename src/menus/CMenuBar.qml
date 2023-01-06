/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.impl as Impl
import CoreUI.Palettes
import CoreUI.Impl
import QtQuick.Templates as T
import Qt5Compat.GraphicalEffects
import CoreUI
T.MenuBar {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    delegate: CMenuBarItem{}
    property int radius: 5


    contentItem: Row {
        spacing: control.spacing
        Repeater {
            model: control.contentModel
        }
    }


    layer.enabled: true
    layer.effect: RoundingMask{
        item: control
        source: control
        radius: control.radius
    }



    background: Rectangle {
        implicitHeight: 42
        color: "transparent"
        clip: true


    }

} //end menu bar
