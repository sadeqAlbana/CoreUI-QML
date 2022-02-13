/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15

Rectangle{
    id: mainRect
    property bool topLeft: true
    property bool topRight: true
    property bool bottomLeft: true
    property bool bottomRight: true
    border.color: color
    clip: true

    Rectangle{
        id: rect1
        width: mainRect.radius
        height: mainRect.radius
        color: topLeft ?  'transparent' : mainRect.border.color
        clip: true
        anchors.top: mainRect.top
        anchors.left: mainRect.left
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: topLeft ? mainRect.radius : 0
            width: rect1.width + radius
            height: rect1.height + radius
            color: mainRect.color
            anchors.top: rect1.top
            anchors.left: rect1.left
        }
    }


    Rectangle{
        id: rect2
        width: mainRect.radius
        height: mainRect.radius
        color: topRight ?  'transparent' : mainRect.border.color
        clip: true
        anchors.top: mainRect.top
        anchors.right: mainRect.right
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: topRight ? mainRect.radius : 0
            width: rect2.width + radius
            height: rect2.height + radius
            color: mainRect.color
            anchors.top: rect2.top
            anchors.right: rect2.right
        }
    }


    Rectangle{
        id: rect3
        width: mainRect.radius
        height: mainRect.radius
        color: bottomLeft ?  'transparent' : mainRect.border.color
        clip: true
        anchors.bottom: mainRect.bottom
        anchors.left: mainRect.left
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: bottomLeft ? mainRect.radius : 0
            width: rect3.width + radius
            height: rect3.height + radius
            color: mainRect.color
            anchors.bottom: rect3.bottom
            anchors.left: rect3.left
        }
    }


    Rectangle{
        id: rect4
        width: mainRect.radius
        height: mainRect.radius
        color: bottomRight ?  'transparent' : mainRect.border.color
        clip: true
        anchors.bottom: mainRect.bottom
        anchors.right: mainRect.right
        Rectangle{
            anchors.margins: mainRect.border.width
            radius: bottomRight ? mainRect.radius : 0
            width: rect4.width + radius
            height: rect4.height + radius
            color: mainRect.color
            anchors.bottom: rect4.bottom
            anchors.right: rect4.right
        }
    }
}
