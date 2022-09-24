import QtQuick
import QtQuick.Controls.Basic

CMenu {
    property list<Action> actions
    Repeater {
        model: actions.length
        CMenuItem {
            action: actions[index]
        }
    }
}
