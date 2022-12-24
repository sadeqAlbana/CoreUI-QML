/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import CoreUI.Impl as CImpl;
import QtQuick.Controls.impl as Impl

StyledComboBox {
    id: control

    property CImpl.CIcon leftIcon: CImpl.CIcon{}

    leftDelegate: Impl.IconImage{
        name: leftIcon.name;
        source: leftIcon.source;
        width: leftIcon.width
        height: leftIcon.height
        sourceSize.width: leftIcon.width
        sourceSize.height: leftIcon.height
        cache: leftIcon.cache;

    }



}
