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
    property var navModel;
    property string icon: "cib-coreui"
    width: 256
    height: rootItem.height
    dim: rootItem.drawerAboveContent
    closePolicy: Popup.NoAutoClose //this causes a problem in closing
    visible: true
    palette: CNavDrawerPalette{}
    modal: rootItem.drawerAboveContent //should be changed to CoreUI.DrawerAboveContent
    edge: (Qt.application.layoutDirection === Qt.RightToLeft ? Qt.RightEdge : Qt.LeftEdge)
    Overlay.modal: Rectangle {
        color: rootItem.drawerAboveContent ? "#C0000000" : "transparent" //should be changed to CoreUI.DrawerAboveContent
    }

    ListView {
        id: listView
        anchors.fill: parent
        interactive: true
        section.property: "category"
        section.criteria: ViewSection.FullString
        headerPositioning: ListView.OverlayHeader
        footerPositioning: ListView.OverlayFooter
        model: drawer.navModel
        property real delegateHeight: 0
        onCountChanged: {
            if(count>=3)
                listView.currentIndex=4
        }

        header: CButton{
            radius: 0
            width: parent.width
            height: toolBar.height
            checkable: false
            icon.height: height-topPadding-bottomPadding
            icon.name: drawer.icon
            icon.color: palette.brightText
            glow: false
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
            glow: false
            alignment: Qt.AlignRight

        }

        delegate: CNavBarDelegate{

        }


        section.delegate: CLabel{
            width: parent.width
            height: 52
            horizontalAlignment: Text.AlignLeft
            leftPadding: 13
            text: section
            font.bold: true
            font.pixelSize: 10
        }

        onCurrentIndexChanged: {
            var item = listView.model.get(listView.currentIndex)
            if (item !== undefined)
                if (item.path !== null)
                    stack.replace(item.path)
        }

    }//listView
}
