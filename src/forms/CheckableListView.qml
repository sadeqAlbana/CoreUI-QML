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

CListView{
    id: control
    clip: true

    component CListViewCheckDelegate: CheckDelegate{
        onCheckedChanged: ListView.view.model.checked=checked
        width: ListView.view.width;

//        text: model.display
        highlighted: ListView.isCurrentItem;
        onClicked: {
            control.forceActiveFocus();
            if (ListView.view.currentIndex !== index) {
                ListView.view.currentIndex = index
            }
        }

    }


}
