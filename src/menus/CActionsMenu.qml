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
            Component.onCompleted: {
                console.log(((control.permissionProvider!==null) && (actions[index].permission.length>0)))
            }
            visible: (control.permissionProvider!==null) && (actions[index].permission.length>0)?
                         control.permissionProvider(actions[index].permission) :
                         true
            enabled: (control.permissionProvider!==null) && (actions[index].permission.length>0)?
                         control.permissionProvider(actions[index].permission) :
                         true
        }
    }
}
