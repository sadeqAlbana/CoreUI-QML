import QtQuick
import QtQuick.Controls.Basic
import CoreUI.Base
CMenu {
    id: control
    property list<CAction> actions
    property var permissionProvider: null
    Repeater {
        model: actions.length
        CMenuItem {
            action: actions[index]
            visible: (control.permissionProvider && actions[index].permission)?
                         control.permissionProvider(actions[index].permission) :
                         true
        }
    }
}
