

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

Pane {
    id: control
    clip: true
    padding: 10
    Layout.preferredWidth: 290
    Layout.preferredHeight: 187
    property string text: "(-12.4%)"
    property string value: "26K"
    property string title: "Users"
    property int radius: 10
    background: Rectangle {
        color: control.palette.button
        radius: control.radius
    }

    contentItem: GridLayout {
        columns: 4
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
        HorizontalSpacer {}
        CMenuBar {
            CActionsMenu {
                actions: [
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
            }
            delegate: MenuBarItem {
                display: AbstractButton.IconOnly
                icon.name: "cil-options"
                palette.mid: "transparent"
                palette.highlight: "transparent"
                icon.width: 16
                icon.height: 16
                smooth: true
                antialiasing: true
            }
        }

        Label {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: control.title
            Layout.columnSpan: 4
            Layout.row: 1
            font.pixelSize: 16
            font.weight: Font.Medium
            color: "#fff"
        }

        ChartView {
            id: chartView
            Layout.alignment: Qt.AlignCenter
            Layout.columnSpan: 4
            implicitWidth: 200
            implicitHeight: 100
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 2
            backgroundColor: "transparent"
            legend.visible: false
            animationOptions: ChartView.AllAnimations
            smooth: true
            antialiasing: true
            ValueAxis {
                id: x
                min: 0
                max: 60
                tickCount: 7
                gridVisible: false
                labelsVisible: false
                lineVisible: false
            }
            ValueAxis {
                id: y
                min: 0
                max: 50
                tickCount: 7
                gridVisible: false
                labelsVisible: false
                lineVisible: false
            }
            SplineSeries {
                id: spline
                XYPoint {
                    x: 0
                    y: 32.5
                }
                XYPoint {
                    x: 10
                    y: 29.5
                }
                XYPoint {
                    x: 20
                    y: 42
                }
                XYPoint {
                    x: 30
                    y: 42
                }
                XYPoint {
                    x: 40
                    y: 25.5
                }
                XYPoint {
                    x: 50
                    y: 27.5
                }
                XYPoint {
                    x: 60
                    y: 20
                }
                axisX: x
                axisY: y
                pointsVisible: true
                color: "#fff"
                opacity: 0.5
                //spline.setMarkerSize(5) //waiting for marker size !
            }
        }
    } //content item
}
