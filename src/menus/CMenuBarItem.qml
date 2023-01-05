import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls
import QtQuick.Controls.Basic
import CoreUI.Palettes
import CoreUI.Impl
import CoreUI
import Qt5Compat.GraphicalEffects

T.MenuBarItem {
        id: control

        implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                               implicitIndicatorWidth + implicitContentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding,
                                 implicitIndicatorHeight + topPadding + bottomPadding)




        spacing: 6
        padding: 6

        rightPadding: padding+ CoreUI.borderRadius
        icon.width: 20
        icon.height: 20
        icon.color: control.palette.buttonText
        display: AbstractButton.IconOnly
        property int radius: CoreUI.borderRadius
        palette: BrandLight{}
        icon.name: control.menu.icon
        contentItem: IconLabel {

            readonly property real indicatorPadding:  control.indicator ? control.indicator.width + control.spacing : 0
            leftPadding:  control.mirrored ? indicatorPadding : 0
            rightPadding: control.mirrored ? 0 : indicatorPadding

             spacing: control.spacing
             mirrored: control.mirrored
             display: control.display
             alignment: Qt.AlignCenter

             icon: control.icon
             text: control.text
             font: control.font
             color: control.palette.buttonText


         }


        opacity: control.enabled? 1: 0.65


        indicator: IconImage {
            x: control.mirrored ? control.leftPadding : control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) / 2

            visible: true
            mirror: control.mirrored
            name: "cis-triangle"
            rotation: 180
            sourceSize.width: 14
            sourceSize.height: 8
            width: 14
            height: 8
            color: control.palette.buttonText


        }

        background: Rectangle {
            implicitWidth: 10
            implicitHeight: 42
            //radius: control.radius
            color: control.enabled?
                       (control.hovered || control.down || control.visualFocus || control.focus)?
                           control.palette.active.button : control.palette.inactive.button :
            control.palette.disabled.button

            Behavior on color{
                ColorAnimation {easing.type: Easing.InOutQuad; duration: 150  }

            }




            layer.enabled: true
            layer.effect:  DropShadow{
                radius: 3
                verticalOffset: 1
                spread: 0
                samples: 7
                color: CoreUI.boxShadow
                cached: true
                transparentBorder: true
            }


//            color: {
//                if(!control.enabled)
//                    return control.palette.button.lighter(1.3)

//                if(control.down && control.hovered){
//                    return control.palette.button.lighter(1.2)
//                }

//                if(control.down || control.checkable){
//                    return control.palette.button.darker(1.4)

//                }

//                if(control.visualFocus){
//                    return control.palette.button.darker(1.1)
//                }

//                if(control.hovered){
//                    return control.palette.button.darker(1.1)
//                }
//                return control.palette.button
//            }
        }//background


    }
