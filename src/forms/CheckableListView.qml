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
import CoreUI.Impl
import CoreUI
import CoreUI.Views
import CoreUI.Palettes
CListView{
    id: control
    property string matchKey;
    delegate: CheckDelegate{
        width: ListView.view.width
        highlighted: ListView.isCurrentItem;
        text: model.display
        checkState: model.checkState
        onToggled: {
            model.checkState=checkState
            ListView.view.forceActiveFocus();
            if (ListView.view.currentIndex !== index) {
                ListView.view.currentIndex = index
            }
        }
    }
}
