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
    property list<Action> actions
    property string icon;

    background: Rectangle{
        implicitWidth: 300
        border.color: "silver"
        radius: 2
    }
    Repeater{
        model: control.actions.length
        CMenuItem{ action: control.actions[index]}
    }
}
