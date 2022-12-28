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
ComboBox{
    id:control
    background: Rectangle{
        implicitHeight: 40
        color : "#fff"
        border.color: control.visualFocus? "#8AD4EE" :"#d8dbe0";
        radius: 4

    }
    textRole: "display"


    layer.enabled: false
    layer.effect: Glow {
        spread: 1
        color: "#DCD9F9"
        transparentBorder: true
        source: control
        cached: true
        samples: radius+1

    }
    onActiveFocusChanged: {
        layer.enabled=activeFocus ? true : false
    }



    delegate: CheckDelegate{
        text: model[textRole]
        width: control.width
        checkState: model.checkstate

        onCheckStateChanged: model.checkstate=checkState //should be binded !

        //LayoutMirroring.enabled: true

    }

}
