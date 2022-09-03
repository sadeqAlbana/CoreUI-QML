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
import QtQuick.Controls.impl as Impl
import "qrc:/CoreUI/palettes"

MenuBar {
    delegate: MenuBarItem {
        id: control
        property int radius: 5
        palette: BrandLight{}
        icon.name: control.menu.icon
        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            radius: control.radius

            Behavior on color{
                ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }

            }

            color: {
                if(!control.enabled)
                    return control.palette.button.lighter(1.3)

                if(control.down && control.hovered){
                    return control.palette.button.lighter(1.2)
                }

                if(control.down || control.checkable){
                    return control.palette.button.darker(1.4)

                }

                if(control.visualFocus){
                    return control.palette.button.darker(1.1)
                }

                if(control.hovered){
                    return control.palette.button.darker(1.1)
                }
                return control.palette.button
            }
        }//background

    }


} //end menu bar
