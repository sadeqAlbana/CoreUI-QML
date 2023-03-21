

/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */
import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import QtQuick.Controls.impl
import Qt5Compat.GraphicalEffects
import CoreUI.Impl
import CoreUI
import CoreUI.Palettes
import CoreUI.Base

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        implicitContentHeight + topPadding + bottomPadding,
                        implicitIndicatorHeight + topPadding + bottomPadding)

    leftPadding: padding + (!control.mirrored || !indicator
                            || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: padding + (control.mirrored || !indicator
                             || !indicator.visible ? 0 : indicator.width + spacing)

    palette: CPalette {}
    flat: true
    background: Rectangle {
        implicitHeight: 45
        implicitWidth: 200
        color: control.palette.base
        border.color: control.palette.shadow
        radius: CoreUI.borderRadius
        layer.enabled: control.activeFocus
        layer.effect: Glow {
            spread: 1
            color: CoreUI.boxShadow
            transparentBorder: true
            cached: true
        }


    }

    delegate: CItemDelegate {
        width: control.width
        text: control.textRole ? (Array.isArray(
                                      control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex === index || hovered
        hoverEnabled: control.hoverEnabled


        background: Rectangle {
            visible: highlighted
            color: control.palette.alternateBase
        }


    }

    indicator: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.palette.dark
        defaultColor: "#353637"
        source: "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/double-arrow.png"
        opacity: enabled ? 1 : 0.3
    }

    contentItem: T.TextField {
        leftPadding: !control.mirrored ? 12 : control.editable
                                         && activeFocus ? 3 : 1
        rightPadding: control.mirrored ? 12 : control.editable
                                         && activeFocus ? 3 : 1
        topPadding: 6 - control.padding
        bottomPadding: 6 - control.padding

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse

        color: control.editable ? control.palette.text : control.palette.buttonText
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        verticalAlignment: Text.AlignVCenter

        background: Rectangle {
            visible: control.enabled && control.editable && !control.flat
            border.width: parent && parent.activeFocus ? 2 : 1
            border.color: parent
                          && parent.activeFocus ? control.palette.highlight : control.palette.button
            color: control.palette.base
        }
    }

    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight,
                         control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6

        topPadding: CoreUI.borderRadius
        bottomPadding: CoreUI.borderRadius
        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

//            Rectangle {
//                z: 10
//                width: parent.width
//                height: parent.height
//                color: "transparent"
//                border.color: control.palette.shadow
//                radius: CoreUI.borderRadius
//            }

            T.ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            color: control.palette.base
            border.color: control.palette.base
            radius: CoreUI.borderRadius

            layer.enabled: true
            layer.effect:  DropShadow{
                radius: 16
                verticalOffset: 2
                spread: 0
                samples: radius*2+1
                color: control.palette.shadow
                cached: true
                transparentBorder: true
            }
        }
    }
}
