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
import CoreUI.Impl
import QtQuick.Controls.impl as Impl
import QtQuick.Layouts
import CoreUI.Base
import QtQuick.Dialogs
StyledTextField {
    id: control

    property CIcon leftIcon: CIcon{}
    property CIcon rightIcon: CIcon{}

    leftDelegate: Impl.IconImage{
        name: leftIcon.name;
        source: leftIcon.source;
        width: leftIcon.width
        height: leftIcon.height
        sourceSize.width: leftIcon.width
        sourceSize.height: leftIcon.height
        cache: leftIcon.cache;
        smooth: true
    }

    rightDelegate: Impl.IconImage{
        name: rightIcon.name;
        source: rightIcon.source;
        width: rightIcon.width
        height: rightIcon.height
        sourceSize.width: leftIcon.width
        sourceSize.height: leftIcon.height
        cache: rightIcon.cache;
        smooth: true


    }

}
