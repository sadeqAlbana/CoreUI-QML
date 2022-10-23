/*
 * Copyright (C) 2022 Sadeq Albana
 *
 * Licensed under the GNU Lesser General Public License v3.0 :
 * https://www.gnu.org/licenses/lgpl-3.0.html
 */
import QtQuick;
import CoreUI

CPalette{
    id: pal
    button: CoreUI.primary //same for all states
    active.button: "#5b4ce2"

    buttonText: "#deffffff" //final

    active.highlight: "#321fdb"
    inactive.highlight: "#D8DBE0"
    active.windowText: "#fff"
    inactive.windowText: "#4f5d73"
    disabled.windowText: "#D8DBE0"
 //   shadow: "#24464b64" //inverted

    //buttontext normal  deffffff
    //buttontext hovered deffffff
    //buttontext active deffffff
    //buttontext disabled deffffff

    //base   #321fdb
    //hover  #5141e0
    //active #5b4ce2
    //disabled #321fdb


    //border normal   #321fdb
    //border hover    #4735df
    //border active   #4735df
    //border disabled #321fdb

//    function test(){
//        return Qt.lighter("#ff00ff",1.5)
//    }
}
