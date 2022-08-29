/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects
import QtQuick.Controls

import "qrc:/CoreUI/components/SharedComponents"
ComboBox{
    id:control
    palette.buttonText: "#3c4b64"

    property string leftIcon
    property CBorder border: CBorder{
        color: "#d8dbe0";
        radius: 4
    }
    property color glowColor : "#DCD9F9"
    background: RoundedRect{
        implicitHeight: 40
        implicitWidth: 200
        color : "#fff"
        border.color: "#d8dbe0";
        radius: control.border.radius
        topLeft: !leftDelegateContainer.visible
        bottomLeft: !leftDelegateContainer.visible
    }


    leftInset: leftDelegateContainer.visible ? leftDelegateContainer.implicitWidth : 0
    leftPadding:leftDelegateContainer.visible ? leftInset+padding : leftPadding



    component Delegate :
        ItemDelegate { //change to item delegate ?
        visible: (icon.name!="")
        icon.color: "#5C6873"
        //padding: height/2
        anchors.fill: parent;
        implicitWidth: 50
        implicitHeight: parent.height
    }

    delegate: ItemDelegate {
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex === index || hovered
        hoverEnabled: control.hoverEnabled
        palette.highlight: "#0078D7"
        palette.light: "#0078D7"
        palette.midlight: "#0078D7"


        //        palette.buttonText: "#000"
        //        palette.highlightedText: "#000"
    }

    states: State{
        name: "active"
        PropertyChanges {target: control.border; color: "#8AD4EE";}
    }

    layer.enabled: false
    //    layer.effect: Glow {
    //        id: glow
    //        //samples: 8
    //        spread: 1
    //        color: "#DCD9F9"
    //        transparentBorder: true
    //        source: control
    //        cached: true
    //    }
    //    onActiveFocusChanged: {
    //        state=activeFocus ? "active" : ""
    //        layer.enabled=activeFocus ? true : false
    //    }



    RoundedRect{
        id: leftDelegateContainer;
        clip: true
        visible: leftIcon!=""
        topRight: false
        bottomRight: false
        radius: control.border.radius
        anchors.top: control.top
        anchors.bottom: control.bottom
        anchors.left: control.left
        anchors.bottomMargin: control.bottomInset
        anchors.rightMargin: -1*(control.border.width)

        anchors.right: background.left
        //color: "red"
        //implicitWidth: leftDelegateLoader.implicitWidth
        implicitHeight: parent.height
        implicitWidth: leftDelegate.implicitWidth
        //implicitWidth: childrenRect.width

        color: "#F0F3F5"
        z: visible ? -2 : 0

        border.color: control.border.color
        border.width: control.border.width

        Delegate{
            id: leftDelegate
            icon.name: control.leftIcon;
            onClicked: control.entered(control.text)

        }
    }
//    Connections{
//        target: popup;

//        function onOpened(){
//            console.log("popup opened")
//        }
//    }
}
