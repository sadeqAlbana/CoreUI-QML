import QtQuick 2.0
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../SharedComponents"
ListView{
    id : list
    layer.enabled: false
    property alias radius: backgroundRect.radius
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"


    clip: true
     RoundedRect{
         anchors.fill: parent;
        id: backgroundRect;
        color : "#fff"
        border.color: "#d8dbe0";
        radius: 4
        z:-1
    }

    delegate: CheckDelegate{
        id: listDelegate
        onCheckedChanged: model.checked=checked
        width: parent.width;
        leftInset: backgroundRect.border.width
        rightInset: backgroundRect.border.width
        background: RoundedRect{
           color : "#fff"
           radius: 4
       }
        text: model.text
        highlighted: ListView.isCurrentItem;
        onClicked: {
            if (list.currentIndex !== index) {
                list.currentIndex = index
            }
        }

    }
    model: ListModel {

        ListElement { text: "Option #1"; checked : false;}
        ListElement { text: "Option #2"; checked : false;}
        ListElement { text: "Option #3"; checked : false;}
        ListElement { text: "Option #4"; checked : false;}
        ListElement { text: "Option #5"; checked : false;}
        ListElement { text: "Option #6"; checked : false;}
        ListElement { text: "Option #7"; checked : false;}
        ListElement { text: "Option #8"; checked : false;}
        ListElement { text: "Option #9"; checked : false;}
        ListElement { text: "Option #10"; checked : false;}
    }
}
