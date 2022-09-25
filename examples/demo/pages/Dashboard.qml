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
            GridLayout {
                clip: true
                id: gridLayout
                columnSpacing: 20
                property int maxImplicitWidth: 0
                Layout.minimumWidth: maxImplicitWidth
                onWidthChanged: updateValues()
                onImplicitWidthChanged: updateValues()

                function updateValues() {
                    let maxLength = 0
                    let count = 0
                    for (var i = 0; i < gridLayout.children.length; i++) {
                        let child = gridLayout.children[i]

                        if (!child.width <= 0) {
                            if (child.implicitWidth > maxLength) {
                                maxLength = child.implicitWidth
                            }

                            count++
                        }
                    }
                    maxImplicitWidth = maxLength
                    let childCount = count

                    //part 2
                    let decimalColumnCount = (gridLayout.width - (columnSpacing * childCount))
                        / (maxImplicitWidth)

                    for (var j = 0; j < gridLayout.children.length; j++) {
                        let c = gridLayout.children[j]
                        if (!c.width <= 0) {
                            c.Layout.minimumWidth = maxImplicitWidth
                        }
                    }

                    let columnCount = parseInt(decimalColumnCount, 10)

                    if (columnCount <= 0) {
                        columns = 1
                        return
                    }

                    if (Number.isNaN(columnCount) || columnCount <= 1) {
                        columns = columnCount
                        return
                    }

                    if (columnCount >= childCount) {
                        columns = childCount
                        return
                    }

                    if (childCount % 2 === 0
                            && childCount % columnCount !== 0) {
                        while (childCount % columnCount !== 0) {
                            if (columnCount <= 1) {
                                columns = columnCount
                                return
                            }
                            columnCount--
                        }
                    }

                    columns = columnCount
                }

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
                    title: qsTr("Conversion Rate")
                    value: "2.49%"
                    text: "(84.7%)"
                    palette: BrandWarning {
                        buttonText: "#fff"
                    }

//                    Rectangle {
//                        clip: false
//                        color: "red"
//                        radius: 10
//                        implicitWidth: c.implicitWidth
//                        implicitHeight: c.implicitHeight
//                        Layout.fillHeight: true
//                        Layout.fillWidth: true
                        DemoChartView {
                            id:c
                            //anchors.fill: parent
                            backgroundRoundness: 0
                            backgroundColor: "green"
                            z:-1
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

                            Rectangle{
                                color: "red"
                                width: 25
                                height: 50
                                radius: 10
                                anchors.left: parent.left
                                anchors.bottom: parent.bottom
                            }
                        } //chartView
                    //}//rect
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
                implicitHeight: 600
                legend.font.bold: false
                //legend.font.family: "Roboto"
                legend.font.pixelSize: 20
                theme: ChartView.ChartThemeLight
                layer.enabled: true
                layer.effect: DropShadow {
                    radius: 8
                    verticalOffset: 1
                    spread: 0.1
                    color: "silver"
                    cached: true
                    transparentBorder: true
                }
                animationOptions: ChartView.AllAnimations

                margins.left: 5
                margins.right: 5
                margins.top: 0
                margins.bottom: 5
            }
        } //columnLayout End
    } //flickable
}
