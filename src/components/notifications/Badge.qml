import QtQuick 2.12
import QtQuick.Layouts 1.12
Rectangle{
    id: badge;
    property alias textColor: badgeText.color
    property alias text: badgeText.text
    property string hoverTextColor: badgeText.color
    property string hoverColor: color;
    property string variant: ""

    radius: 4
    antialiasing: true
    clip: true
    color: "silver"
    Text {
        id: badgeText
        anchors.fill: parent;
        padding: 1
        antialiasing: true
        fontSizeMode: Text.Fit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        minimumPointSize: 1
        color: "white"
        text: "badge"
    }


    HoverHandler{
        id:hoverHandler
    }
    states:
        State{
        name: "hovered"
        when: hoverHandler.hovered;
        PropertyChanges {target: badge; textColor: hoverTextColor; restoreEntryValues: true}
        PropertyChanges {target: badge; color: hoverColor; restoreEntryValues: true}

    }
    onVariantChanged: {
         var variantMap= {"info":{
            "color":"#39f",
            "textColor":"#fff",
            "hoverTextColor":"#fff",
            "hoverColor": "#0080ff"
            }};
        if(variant in variantMap){
            var selectedVariant=variantMap[variant];
            color=selectedVariant.color;
            textColor=selectedVariant.textColor;
            hoverColor=selectedVariant.hoverColor;
            hoverTextColor=selectedVariant.hoverTextColor;
        }
    }
}
