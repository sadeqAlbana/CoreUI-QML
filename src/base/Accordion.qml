import QtQuick
import QtQuick.Templates as T


T.Control {
    id: control
    implicitHeight: Math.max(background.implicitHeight + topInset + bottomInset,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(background.implicitWidth + leftInset + rightInset,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    property int radius: 5





    background: Rectangle{
        color: control.palette.window
        border.color: control.palette.shadow
        implicitHeight: 40
        implicitWidth: 100
        radius: control.radius
    }

    contentItem: ListView{
        implicitHeight: contentHeight
        model: ["Accordion Item #1","Accordion Item #2", "Accordion Item #3"]
        spacing: 0
        delegate: AccordionDelegate{
            text: modelData
            //z: 2

        }
    }
}
