import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import Qt.labs.qmlmodels
import QtCharts
import CoreUI.Base
import CoreUI.Palettes
import Demo
import CoreUI.Impl
import CoreUI.Buttons

Page {
    title: qsTr("Dashboard")
    background: Rectangle {
        color: "transparent"
    }
    property var dashboard
    padding: 15
    Flickable {
        id: flickable
        anchors.fill: parent
        implicitWidth: layout.implicitWidth
        contentHeight: layout.implicitHeight
        //padding: 25
        ColumnLayout {
            id: layout
            anchors.fill: parent
            DynamicGridLayout {
                clip: true
                id: gridLayout
                columnSpacing: 20


                DashboardWidget {
                    title: qsTr("Users")
                    value: "26K"
                    text: " (-12.4%)"
                    palette: BrandPrimary {}
                    DemoChartView {
                        SplineSeries {
                            XYPoint {
                                x: 0
                                y: 65
                            }
                            XYPoint {
                                x: 20
                                y: 59
                            }
                            XYPoint {
                                x: 40
                                y: 84
                            }
                            XYPoint {
                                x: 60
                                y: 84
                            }
                            XYPoint {
                                x: 80
                                y: 51
                            }
                            XYPoint {
                                x: 100
                                y: 55
                            }
                            XYPoint {
                                x: 120
                                y: 40
                            }
                            pointsVisible: true
                            color: "#fff"
                            opacity: 0.5
                            //spline.setMarkerSize(5) //waiting for marker size !
                            axisX: DemoValueAxis {
                                min: -10
                                max: 130
                            }
                            axisY: DemoValueAxis {
                                min: -10
                                max: 95
                            }
                        } //series
                    } //chartView
                } //widget

                DashboardWidget {
                    title: qsTr("Income")
                    value: "$6.200"
                    text: "(40.9%)"
                    palette: BrandInfo {
                        buttonText: "#fff"
                    }
                    DemoChartView {
                        SplineSeries {
                            XYPoint {
                                x: 0
                                y: 1
                            }
                            XYPoint {
                                x: 20
                                y: 18
                            }
                            XYPoint {
                                x: 40
                                y: 9
                            }
                            XYPoint {
                                x: 60
                                y: 17
                            }
                            XYPoint {
                                x: 80
                                y: 34
                            }
                            XYPoint {
                                x: 100
                                y: 22
                            }
                            XYPoint {
                                x: 120
                                y: 11
                            }
                            pointsVisible: true
                            color: "#fff"
                            opacity: 0.5
                            //spline.setMarkerSize(5) //waiting for marker size !
                            axisX: DemoValueAxis {
                                min: -10
                                max: 130
                            }
                            axisY: DemoValueAxis {
                                min: -40
                                max: 40
                            }
                        } //series
                    } //chartView
                } //widget

                DashboardWidget {
                    layer.enabled: true

                    title: qsTr("Conversion Rate")
                    value: "2.49%"
                    text: "(84.7%)"
                    palette: BrandWarning {
                        buttonText: "#fff"
                    }

                    DemoChartView {
                        AreaSeries {
                            color: "#FAC043"
                            borderColor: "#fffffff0"
                            axisX: DemoValueAxis {
                                max: 120
                            }
                            axisY: DemoValueAxis {
                                min: -48
                                max: 90
                            }
                            upperSeries: LineSeries {

                                XYPoint {
                                    x: 0
                                    y: 78
                                }
                                XYPoint {
                                    x: 20
                                    y: 81
                                }
                                XYPoint {
                                    x: 40
                                    y: 80
                                }
                                XYPoint {
                                    x: 60
                                    y: 45
                                }
                                XYPoint {
                                    x: 80
                                    y: 34
                                }
                                XYPoint {
                                    x: 100
                                    y: 12
                                }
                                XYPoint {
                                    x: 120
                                    y: 40
                                }
                                //spline.setMarkerSize(5) //waiting for marker size !
                            }
                        } //series
                    } //chartView
                } //widget

                DashboardWidget {
                    title: qsTr("Sessions")
                    value: "44K"
                    text: "(-23.6%)"
                    palette: BrandDanger {
                        buttonText: "#fff"
                    }
                    DemoChartView {
                        BarSeries {
                            BarSet {
                                color: "#EA7575"
                                borderColor: "transparent"
                                values: [78, 81, 80, 45, 34, 12, 40, 85, 65, 23, 12, 98, 34, 84, 67, 82]
                            }

                            opacity: 0.5
                            //spline.setMarkerSize(5) //waiting for marker size !
                            axisX: DemoValueAxis {
                                min: -2
                                max: 17
                            }
                            axisY: DemoValueAxis {
                                min: -40
                                max: 100
                            }
                        } //series
                    } //chartView
                } //widget
            } //gridLayout end

            ChartView {
                id: chartView
                antialiasing: true
                Layout.fillWidth: true
                //Layout.fillHeight: true
                implicitHeight: 420
                legend.font.bold: false
                //legend.font.family: "Roboto"
                legend.font.pixelSize: 20
                theme: ChartView.ChartThemeLight
                dropShadowEnabled: true
                margins.top: 100
                legend.visible: false
                RowLayout {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.right: parent.right
                    anchors.margins: 25
                    anchors.bottomMargin: 0

                    Label {
                        color: "#2c384a"
                        text: qsTr("Traffic")
                        font.pixelSize: 24
                        font.weight: Font.Medium
                    }

                    HorizontalSpacer {}

                    Row {
                        clip: true
                        spacing: 0
                        layer.enabled: true
                        layer.effect: RoundingMask {
                            item: this

                        }



                        Repeater {
                            model: [qsTr("Day"), qsTr("Month"), qsTr("Year")]
                            CButtonOutline {
                                radius: 0
                                flat: true
                                layer.enabled: false
                                palette: BrandLight {}
                                text: modelData
                                checkable: true
                                autoExclusive: true
                                font.pixelSize: 16
                            }
                        }
                    }
                }

                SplineSeries {
                    XYPoint {
                        x: 0
                        y: 165
                    }
                    XYPoint {
                        x: 20
                        y: 109
                    }
                    XYPoint {
                        x: 40
                        y: 92
                    }
                    XYPoint {
                        x: 60
                        y: 198
                    }
                    XYPoint {
                        x: 80
                        y: 60
                    }
                    XYPoint {
                        x: 100
                        y: 133
                    }
                    XYPoint {
                        x: 120
                        y: 178
                    }

                    //spline.setMarkerSize(5) //waiting for marker size !
                    axisX: ValueAxis {
                        min: 0
                        max: 120
                        tickCount: 8
                        gridVisible: false
                    }
                    axisY: ValueAxis {
                        min: 50
                        max: 200
                        tickCount: 4
                    }
                } //series

                SplineSeries {
                    XYPoint {
                        x: 0
                        y: 200
                    }
                    XYPoint {
                        x: 20
                        y: 166
                    }
                    XYPoint {
                        x: 40
                        y: 144
                    }
                    XYPoint {
                        x: 60
                        y: 153
                    }
                    XYPoint {
                        x: 80
                        y: 64
                    }
                    XYPoint {
                        x: 100
                        y: 88
                    }
                    XYPoint {
                        x: 120
                        y: 85
                    }

                    //spline.setMarkerSize(5) //waiting for marker size !
                } //series

                SplineSeries {
                    style: Qt.DashLine
                    color: "#CB7A7A"
                    XYPoint {
                        x: 0
                        y: 65
                    }
                    XYPoint {
                        x: 20
                        y: 65
                    }
                    XYPoint {
                        x: 40
                        y: 65
                    }
                    XYPoint {
                        x: 60
                        y: 65
                    }
                    XYPoint {
                        x: 80
                        y: 65
                    }
                    XYPoint {
                        x: 100
                        y: 65
                    }
                    XYPoint {
                        x: 120
                        y: 65
                    }

                    //spline.setMarkerSize(5) //waiting for marker size !
                } //series

                //                layer.enabled: true
                //                layer.effect: DropShadow {
                //                    radius: 8
                //                    verticalOffset: 1
                //                    spread: 0.1
                //                    color: "silver"
                //                    cached: true
                //                    transparentBorder: true
                //                }
                animationOptions: ChartView.AllAnimations

                margins.left: 5
                margins.right: 5
                margins.bottom: 5
            }
        } //columnLayout End
    } //flickable
}
