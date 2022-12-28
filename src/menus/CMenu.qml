/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import QtQuick.Templates as T
T.Menu {
    id: control



    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    margins: 0
    overlap: 1

    delegate: CMenuItem { }


    contentItem: ListView {
        implicitHeight: contentHeight
        implicitWidth: contentItem.childrenRect.width

        model: control.contentModel
        interactive: Window.window
                        ? contentHeight + control.topPadding + control.bottomPadding > Window.window.height
                        : false
        clip: true
        currentIndex: control.currentIndex

        ScrollIndicator.vertical: ScrollIndicator {}
    }

    modal: true
    dim: false
    property int radius: 5
    topPadding: control.radius;
    bottomPadding: control.radius
    property string icon;
    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 200 }
    }


    background: Rectangle{
        border.color: "transparent"
        radius: control.radius
        layer.enabled: true
        layer.effect:  DropShadow{
            radius: 16
            verticalOffset: 2
            spread: 0
            samples: radius*2+1
            color: "silver"
            cached: true
            transparentBorder: true
        }
    }

    T.Overlay.modal: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.5)
    }

    T.Overlay.modeless: Rectangle {
        color: Color.transparent(control.palette.shadow, 0.12)
    }

}
