import QtQuick
import CoreUI.Impl
import CoreUI.Buttons
import CoreUI.Palettes
import Qt5Compat.GraphicalEffects
import CoreUI
import QtQuick.Controls.impl as Impl
CItemDelegate {
    id: control
    property bool expanded: false
//    height: implicitHeight
    width: ListView.view? ListView.view.width: 100
    highlighted: ListView.view.currentIndex===index
    onClicked: {expanded=(!expanded); ListView.view.currentIndex=index; control.forceActiveFocus();}
    padding: 25
    palette: BrandPrimary
    {
    }
    clip:true


    bottomInset: control.expanded? page.implicitHeight : 0
    bottomPadding: control.expanded? page.implicitHeight + padding : padding

    z: control.highlighted? 1 : 0

    property Item arrow: Impl.IconImage {
        parent: control
        visible: true
        anchors.right: parent.right
        anchors.rightMargin: 25
        anchors.verticalCenter: contentItem.verticalCenter


        name: "cil-accordion-arrow"
        sourceSize.width: 32
        sourceSize.height: 32
        fillMode: Image.PreserveAspectFit
        color: control.expanded? control.palette.inactive.button : control.palette.text
        rotation: control.expanded ? 180 : 0
        z: 100

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


    contentItem: Text {
        text: control.text
        color: control.expanded? control.palette.inactive.button : control.palette.text
        verticalAlignment: Text.AlignVCenter

    }



    property Item page: Card{
        clip: true
        padding: 25
        parent: control
        anchors.left: parent.left
        anchors.right: parent.right
        y: control.height-height
        border.radius: 0
        z: -1

        CLabel{
            anchors.fill: parent
            text: qsTr("This is the first item's accordion body. It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the.accordion-body, though the transition does limit overflow.")
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignLeft
        }

        Behavior on y{
            PropertyAnimation {
                duration: 500
            }

        }
//       height: control.expanded? implicitHeight : 0
    }


    background:Rectangle{
        RectangularGlow {
            visible: control.activeFocus
            anchors.fill: parent
            glowRadius: 4;
            spread: 1
            color: control.palette.button
            cached: true
            cornerRadius: 0
            smooth: true
            antialiasing: true
            z:-1
            opacity: 0.25
        }
        color: control.expanded? CoreUI.accordionActive : control.palette.base
        border.color: control.palette.shadow
        border.width:  CoreUI.borderWidth
    }


//    Behavior on bottomPadding{
//        PropertyAnimation {
//            duration: 500
//        }

//    }

//    Behavior on implicitHeight{
//        PropertyAnimation {
//            duration: 500
//        }
//    }

}
