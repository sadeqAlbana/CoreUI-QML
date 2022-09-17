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
import "qrc:/CoreUI/components/SharedComponents"
CComboBox{
    id: control
    delegate: CheckDelegate {
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex === index || hovered
        hoverEnabled: control.hoverEnabled
        palette.highlight: "#0078D7"
        palette.light: "#0078D7"
        palette.midlight: "#0078D7"

        onCheckStateChanged: model.checkState=checkState
    }


    contentItem: Flow{
        padding: 10
        spacing: 10
        Repeater{
            model: control.model
            delegate:
                Label{
                    text: model[control.textRole]
                    visible: model.checkState?? false
                    padding: 5
                    background: Rectangle{
                        color: "#F0F4F7"
                        radius: 5
                    }
                    rightPadding: xBtn.width+padding

                    AbstractButton{
                        id: xBtn
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        padding: 5
                        hoverEnabled: true
                        background: Rectangle{color: "transparent"}
                        onClicked: model.checkState=Qt.Unchecked
                        contentItem: Label{
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: 20
                            color: "black"
                            text: "×"
                            styleColor: "#000015"
                            font.bold: true
                            opacity: xBtn.hovered? 1: 0.75
                        }
                    }
            }
        }
    }
}
