/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick 2.15
import QtQuick.Layouts 1.15
import "qrc:/CoreUI/components/forms"
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
GridLayout {
    property bool horizontal: false
    property alias label: textLabel
//    property alias labelWidth: textLabel.width
    rows: horizontal ? 1 : 2
    columns: horizontal ? 2 : 1

    Label{
        id: textLabel
        verticalAlignment: horizontal ? Qt.AlignVCenter : Qt.AlignBottom
       // Layout.fillHeight: horizontal
        palette.text: "#3c4b64"
        color: palette.text
        visible: true
    }
}
