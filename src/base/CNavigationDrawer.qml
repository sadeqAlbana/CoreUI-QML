import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Controls.impl as Impl
import CoreUI.Notifications
import QtQuick.Dialogs
import QtQuick.Layouts
import CoreUI.Palettes
import CoreUI.Buttons
Drawer {
    id: drawer
    property var model;
    width: 256
    height: rootItem.height
    dim: rootItem.drawerAboveContent
    closePolicy: Popup.NoAutoClose //this causes a problem in closing
    visible: true
    palette: CNavDrawerPalette{}
    modal: rootItem.drawerAboveContent
    edge: (Qt.application.layoutDirection === Qt.RightToLeft ? Qt.RightEdge : Qt.LeftEdge)
    Overlay.modal: Rectangle {
        color: rootItem.drawerAboveContent ? "#C0000000" : "transparent"
    }

    ListView {
        id: listView
        anchors.fill: parent
        interactive: true
        section.property: "category"
        section.criteria: ViewSection.FullString
        headerPositioning: ListView.OverlayHeader
        footerPositioning: ListView.OverlayFooter
        model: drawer.model
        property real delegateHeight: 0

        header: CButton{
            radius: 0
            width: parent.width
            height: toolBar.height

            icon.height: 72
            icon.name: "cib-coreui"
            background.layer.enabled: false
            display: AbstractButton.IconOnly
        }

        footer: CButton {
            text: "‹"
            radius: 0
            font.pointSize: 30
            rotation: LayoutMirroring.enabled ? 180 : 0
            width: parent.width
            height: toolBar.height
            down: hovered
            background.layer.enabled: false

        }

        delegate: CNavBarDelegate{

        }


        section.delegate: CLabel{
            width: parent.width
            height: 52
            horizontalAlignment: Text.AlignLeft
            leftPadding: 13
            color: palette.brightText
            text: section
            font.bold: true
            font.pixelSize: 10
        }

        onCurrentIndexChanged: {
            var item = listModel.get(listView.currentIndex)
            if (item !== undefined)
                if (item.path !== null)
                    stack.replace(item.path)
        }

    }//listView
}
