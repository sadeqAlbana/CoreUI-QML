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
    property string matchKey;
    component CListViewCheckDelegate: CheckDelegate{
        width: ListView.view.width-(x*2)
        x: CoreUI.borderWidth


        checkState: model.checkState
        onCheckStateChanged: model.checkState=checkState
        highlighted: ListView.isCurrentItem;
        onClicked: {
            ListView.view.forceActiveFocus();
            if (ListView.view.currentIndex !== index) {
                ListView.view.currentIndex = index
            }
        }
    }
}
