import QtQuick
import CoreUI.Impl
import CoreUI.Buttons
import CoreUI.Palettes
import Qt5Compat.GraphicalEffects
import CoreUI
CItemDelegate {

    id: control
    property bool expanded: control.highlighted
    width: ListView.view? ListView.view.width: 100
    //palette: BrandPrimary{}
    highlighted: ListView.isCurrentItem
    onClicked: {ListView.view.currentIndex=index;}

    z: control.highlighted? 1 : 0
    property Item arrow: CLabel {
        parent: control
        visible: true
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 26
        text: "‹"
        font.pointSize: 26
        rotation: control.expanded ? -90 : 90

        Behavior on color {
            ColorAnimation {
                easing.type: Easing.InOutQuad
                duration: 300
            }
        }
        Behavior on rotation {
            RotationAnimation {
                duration: 150
                direction: RotationAnimation.Shortest
            }
        }
    }







    background:Rectangle{
//        Rectangle{
//            color: control.palette.shadow
//            width: control.width
//            height: 1
//            anchors.bottom: parent.bottom
//        }
        RectangularGlow {
            visible: control.highlighted || control.down || control.activeFocus
            anchors.fill: parent
            glowRadius: 4;
            spread: 1
            color: control.palette.highlight
            opacity: 0.5
            cached: true
            cornerRadius: 0
            smooth: true
            antialiasing: true
        }
        border.color: control.palette.shadow
        border.width:  CoreUI.borderWidth
    }




}
