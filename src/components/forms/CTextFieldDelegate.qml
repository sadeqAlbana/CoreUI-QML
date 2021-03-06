/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */

import QtQuick;import QtQuick.Controls.Basic;
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
ItemDelegate { //change to item delegate ?
    id: delegate

    visible: true

    //padding: height/2
    //anchors.fill: parent;
    implicitWidth: 50
    implicitHeight: 50
    anchors.fill: parent;


    //contentItem: Rectangle{color: "red"}
    Image{
        id: img
        source: icon.source
       // anchors.fill: parent;
        //            sourceSize.width: parent.height*0.5
        //            sourceSize.height: parent.height*0.5

        //Rectangle{color:"red"; anchors.fill: parent;}

        onSourceChanged: console.log(source)

        //            Timer{
        //                interval: 1000
        //                running: true
        //                repeat: true
        //                onTriggered: {
        //                    console.log(img.source)
        //                    img.source="";
        //                    img.source=delegate.icon.source
        //                }
        //            }

        sourceSize.width: 40
        sourceSize.height: 40
        width: 40
        height: 40
        fillMode: Image.PreserveAspectFit
        layer.enabled: true
        layer.effect: ColorOverlay{
            color:"#5C6873"
        }
    }

//    background: Rectangle{
//        //anchors.fill: parent;
//        color: "red"
//    }
}
