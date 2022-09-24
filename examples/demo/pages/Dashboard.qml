import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import Qt.labs.qmlmodels
import QtCharts
import CoreUI.Base
import CoreUI.Palettes
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
                    value: "26K";
                    text:" (-12.4%)"
                    palette: BrandPrimary{}

                }

                DashboardWidget {
                    title: qsTr("Income")
                    value: "$6.200";
                    text: "(40.9%)"
                    palette: BrandInfo{buttonText: "#fff"}

                }

                DashboardWidget {
                    title: qsTr("Conversion Rate")
                    value: "2.49%";
                    text: "(84.7%)"
                    palette: BrandWarning{buttonText: "#fff"}
                }

                DashboardWidget {
                    title: qsTr("Sessions")
                    value: "44K";
                    text: "(-23.6%)"
                    palette: BrandDanger{buttonText: "#fff"}
                }
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

        Component.onCompleted: {

        } //ScrollView End
    } //flickable
}
