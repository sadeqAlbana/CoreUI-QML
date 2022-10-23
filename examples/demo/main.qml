import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import CoreUI
import CoreUI.Impl
import CoreUI.Base
import CoreUI.Buttons
import CoreUI.Forms
CApplicationWindow {


    rootLoader.sourceComponent: MainScreen{
        anchors.fill: parent;
        initialIndex: 4
    }

}
