/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import QtQuick.Controls
import CoreUI
CButtonOutline {
    id: control
    CoreUI.borderWidth: control.enabled? 0 : 1
    glow: false
}
