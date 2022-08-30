import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
MenuItem {
    id: control
    palette.windowText: enabled? hovered? "#fff" : "#000" : "silver"
    //palette.window: hovered? "red" : "blue"
    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20
        color: control.palette.highlight
        visible: control.enabled && (control.down  || control.hovered)
    }

//    arrow: Canvas {
//        x: parent.width - width
//        implicitWidth: 40
//        implicitHeight: 40
////        visible: menuItem.subMenu
//        onPaint: {
//            var ctx = getContext("2d")
//           // ctx.fillStyle = control.palette.highlight
//            ctx.moveTo(15, 15)
//            ctx.lineTo(height / 2,width - 15)
//            ctx.lineTo( height - 15,15)
//            ctx.closePath()
//            ctx.fill()
//        }
//    }
}
