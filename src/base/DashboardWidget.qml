

/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Controls.impl as Impl
import CoreUI.Menus
import CoreUI.Impl
import QtCharts
import CoreUI.Charts

Page {
    id: control
    clip: true
    Layout.minimumWidth: implicitWidth
    Layout.fillWidth: true
    padding: 0
    property string text
    property string value
    property int radius: 10
    default property alias content: layout.data
    property list<Action> actions: [
        Action {
            text: qsTr("Action")
        },
        Action {
            text: qsTr("Another action")
        },
        Action {
            text: qsTr("Something else here")
        }
    ]
    background: Rectangle {
        color: control.palette.button
        radius: control.radius
    }

    header: ToolBar {
        leftPadding: 15
        rightPadding: 15
        topPadding: 15
        palette.base: "transparent"
        palette.window: "transparent"
        palette.button: "transparent"
        RowLayout {
            anchors.fill: parent
            Label {
                text: control.value
                color: "#FFF"
                font.weight: Font.DemiBold
                font.pixelSize: 24
            }
            Label {
                color: "#FFF"
                text: control.text
                font.weight: Font.Medium
                font.pixelSize: 14

            }
            //       Label {
            //           color: "#FFF"
            //           text: control.title
            //           font.weight: Font.Medium
            //           font.pixelSize: 16
            //       }
            HorizontalSpacer {}
            CMenuBar {
                palette.base: "transparent"
                palette.window: "transparent"
                palette.button: "transparent"

                CActionsMenu {
                    actions: control.actions
                }
                delegate: MenuBarItem {
                    display: AbstractButton.IconOnly
                    palette.button: "transparent"
                    icon.name: "cil-options"
                    palette.mid: "transparent"
                    palette.highlight: "transparent"
                    icon.width: 16
                    icon.height: 16
                    smooth: true
                    antialiasing: true
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 0

        id: layout
        Label {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: control.title
            font.pixelSize: 16
            font.weight: Font.Medium
            palette.windowText: "#fff"
            leftPadding: 15
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

        }
    }
}
