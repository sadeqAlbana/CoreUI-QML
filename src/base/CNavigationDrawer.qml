import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Controls.impl as Impl
import CoreUI.Notifications
import QtQuick.Dialogs
import QtQuick.Layouts
import CoreUI.Palettes
import CoreUI.Buttons
import CoreUI
Drawer {
    id: drawer
    property var navModel;
    property url icon;
    property int iconWidth: 24
    property int iconHeight: 24
    property alias currentIndex: listView.currentIndex
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



        header: CButton{
            id: control
            radius: 0
            width: parent.width
            height: toolBar.height
            checkable: false
            icon.color: palette.brightText
            icon.source: drawer.icon
            icon.height: drawer.iconHeight
            icon.width: drawer.iconWidth;
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
                    Router.navigate(item.path,null,true)
        }

    }//listView
}
