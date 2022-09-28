/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Controls
import QtQuick.Layouts
FormGroup {
    property alias input: control
    CTextField{
        id:control
        Layout.fillWidth: true
        //Layout.fillHeight: true //setting it to false was causing a problem inside cards....margins !
    }
}
