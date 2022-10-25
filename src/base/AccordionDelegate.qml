import QtQuick
import CoreUI.Impl
import CoreUI.Buttons
import CoreUI.Palettes
import Qt5Compat.GraphicalEffects
import CoreUI
CItemDelegate {

    id: control
    property bool expanded: false
//    height: implicitHeight
    width: ListView.view? ListView.view.width: 100
    highlighted: ListView.view.currentIndex===index
    onClicked: {expanded=(!expanded); ListView.view.currentIndex=index;}


    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset ,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

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




    contentItem: AccordionContentItem{
        expanded: control.expanded
    }


    background:Rectangle{
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
        color: control.palette.base
        border.color: control.palette.shadow
        border.width:  CoreUI.borderWidth
    }



    Behavior on height{
        PropertyAnimation {
            duration: 75
        }
    }
}
