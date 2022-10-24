import QtQuick
import QtQuick.Templates as T


T.Control {
    id: control
    implicitHeight: Math.max(background.implicitHeight + topInset + bottomInset,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(background.implicitWidth + leftInset + rightInset,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    property int radius: 5
    property var model;




    background: Rectangle{
        color: control.palette.window
        border.color: control.palette.shadow
        implicitHeight: 40
        implicitWidth: 100
        radius: control.radius
    }

    contentItem: ListView{
        model: control.model
        implicitHeight: contentHeight
        spacing: 0
        delegate: AccordionDelegate{
            text: modelData
        }
    }
}
