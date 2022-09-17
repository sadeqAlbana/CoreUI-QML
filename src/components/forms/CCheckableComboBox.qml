/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import QtQuick.Controls
import QtQuick.Controls.impl
CComboBox{
    id:control



    delegate: CheckDelegate{
        width: control.width
        //LayoutMirroring.enabled: !control.LayoutMirroring.enabled
        //LayoutMirroring.childrenInherit: true
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex === index || hovered
        hoverEnabled: control.hoverEnabled
        palette.highlight: "#0078D7"
        palette.light: "#0078D7"
        palette.midlight: "#0078D7"
        display: IconLabel.TextOnly
        leftPadding: contentItem.width-indicator.width
    }
}
