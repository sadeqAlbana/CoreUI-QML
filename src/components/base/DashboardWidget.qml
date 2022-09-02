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
import QtQuick.Layouts
Rectangle{
    id : widget
    clip: true
    property alias text : textLabel.text
    property alias  value: valueLabel.text
    radius: 5
    implicitHeight: 150
    //implicitWidth: textLabel.paintedWidth > valueLabel.paintedWidth ?  textLabel.paintedWidth*1.5 : valueLabel.paintedWidth*1.5
    implicitWidth: 300

    Layout.fillWidth: true
    Layout.preferredHeight: 150
    Layout.preferredWidth: 300

    Layout.minimumWidth: implicitWidth/1.25
    color: "#DD4141"
    layer.enabled: true
    layer.effect:  DropShadow{
        radius: 5
        //samples: 40
        verticalOffset: 1
        spread: 0.1
        color: "silver"
        cached: true
        transparentBorder: true
    }

    Label{
        id: textLabel
        font.pixelSize: 20
        font.family: "Verdana"
        //font.bold: true
        text: ""
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 10
        color: "white"
    }

    Label{
        id: valueLabel
        font.pixelSize: 35
        font.family: "Arial"
        font.bold: false
        text: "0"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 15
        color: "white"
    }
}

