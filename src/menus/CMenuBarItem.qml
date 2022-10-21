import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import CoreUI.Palettes

T.MenuBarItem {
        id: control

        implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding,
                                 implicitIndicatorHeight + topPadding + bottomPadding)

        spacing: 6
        padding: 6
        leftPadding: 12
        rightPadding: 16
        icon.width: 24
        icon.height: 24
        icon.color: control.palette.buttonText
        property int radius: 5
        palette: BrandLight{}
        icon.name: control.menu.icon

        contentItem: IconLabel {
             spacing: control.spacing
             mirrored: control.mirrored
             display: control.display
             alignment: Qt.AlignLeft

             icon: control.icon
             text: control.text
             font: control.font
             color: control.palette.buttonText
         }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 50
            //radius: control.radius

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
