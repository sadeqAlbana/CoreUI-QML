/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Controls
import "qrc:/CoreUI/components/SharedComponents"

Page{
    id: control
    property color accentColor: "#d8dbe0"

    background: Rectangle{
        id: background
        color : "#fff"
        border.color: accentColor
        radius: 4
        smooth: true
        antialiasing: true

        layer.enabled: false
        layer.effect:  DropShadow{
            radius: 3
            //samples: 40
            verticalOffset: 1
            spread: 0.1
            color: "silver"
            cached: true
            transparentBorder: true
        }
    } //end background

    header: CardLabel{
        visible: control.title !=""
        text: control.title
        font.pixelSize: 22
        bottomPadding: 20
        topPadding: font.pixelSize*0.9
        font.bold: true

    }

    property Item headerLine: Rectangle{
        visible: header? header.visible : false
        anchors.left: parent? parent.left : undefined
        anchors.right: parent? parent.right : undefined
        anchors.leftMargin: background.border.width
        anchors.rightMargin: background.border.width
        anchors.top: header? header.bottom : undefined
        parent: control
        implicitHeight: 1
        color: "#d8dbe0"
    }

    property Item footerLine :Rectangle{
        visible: footer? footer.visible : false
        anchors.left: parent? parent.left : undefined
        anchors.right: parent? parent.right : undefined
        anchors.leftMargin: background.border.width
        anchors.rightMargin: background.border.width
        anchors.bottom: footer? footer.top : undefined
        implicitHeight: 1
        parent: control
        color: "#d8dbe0"
    }

}
