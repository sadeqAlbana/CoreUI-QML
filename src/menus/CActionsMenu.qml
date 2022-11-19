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
            Component.onCompleted:{
                if(control.permissionProvider && actions[index].permission.length>0){
                    if(!control.permissionProvider(actions[index].permission)){
                        visible=false
                        height=0
                    }
                }
            }
        }
    }
}
