import QtQuick
import QtQuick.Templates as T


T.Control {
    id: control
    implicitHeight: Math.max(background.implicitHeight + topInset + bottomInset,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(background.implicitWidth + leftInset + rightInset,
                            contentItem.implicitWidth + leftPadding + rightPadding)





    background: Rectangle{
        color: control.palette.window

        implicitHeight: 40
        implicitWidth: 100
    }

    contentItem: ListView{
        implicitHeight: contentHeight
        model: ["Accordion Item #1","Accordion Item #2", "Accordion Item #3"]
        delegate: CItemDelegate{
            text: modelData
        }
    }
}
