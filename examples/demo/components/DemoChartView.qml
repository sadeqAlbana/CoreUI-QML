import QtQuick
import QtCharts
import QtQuick.Layouts
ChartView {
    id: control
    Layout.alignment: Qt.AlignCenter
    Layout.margins: 0
    Layout.columnSpan: 4
    implicitWidth: 200
    implicitHeight: 90
    Layout.fillHeight: true
    Layout.fillWidth: true
    Layout.row: 2
    backgroundColor: control.palette.button
    legend.visible: false
    animationOptions: ChartView.AllAnimations
    smooth: true
    antialiasing: true
    margins.left: 0
    margins.right: 0
    margins.top: 0
    dropShadowEnabled: false
    plotArea: Qt.rect(control.x,control.y,control.width,control.height)
}
