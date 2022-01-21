import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import "qrc:/CoreUI/components/SharedComponents"
ComboBox{
    id:control
    property string leftIcon
    property int radius: 4
    property alias border: backgroundRect.border
    property color glowColor : "#DCD9F9"
    background: RoundedRect{
        implicitHeight: 40
        id: backgroundRect;
        color : "#fff"
        border.color: "#d8dbe0";
        radius: control.radius

    }



    leftInset: leftDelegateContainer.visible ? leftDelegateContainer.implicitWidth : 0
    leftPadding:leftDelegateContainer.visible ? leftInset+padding : leftPadding



    component Delegate :
        ItemDelegate { //change to item delegate ?
        visible: (icon.source!="")
        //padding: height/2
        anchors.fill: parent;
        implicitWidth: 50
        implicitHeight: parent.height
        contentItem: Image{
            anchors.centerIn: parent
            source: icon.source;
            sourceSize.width: parent.height*0.5
            sourceSize.height: parent.height*0.5
            fillMode: Image.PreserveAspectFit
            layer.enabled: true
            layer.effect: ColorOverlay{
                color:"#5C6873"
            }
        }
    }

    delegate: ItemDelegate {
        width: control.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        font.family: control.font.family
        font.pointSize: control.font.pointSize
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    states: State{
        name: "active"
        PropertyChanges {target: backgroundRect.border; color: "#8AD4EE";}
    }

    layer.enabled: false
    layer.effect: Glow {
        id: glow
        samples: 8
        spread: 1
        color: "#DCD9F9"
        transparentBorder: true
        source: control
        cached: true
    }
    onActiveFocusChanged: {
        state=activeFocus ? "active" : ""
        layer.enabled=activeFocus ? true : false
    }



    RoundedRect{
        id: leftDelegateContainer;
        clip: true
        visible: children.length
        topRight: false
        bottomRight: false
        radius: control.background.radius
        anchors.top: control.top
        anchors.bottom: control.bottom
        anchors.left: control.left
        anchors.bottomMargin: control.bottomInset
        anchors.rightMargin: -1*(control.border.width)

        anchors.right: backgroundRect.left
        //color: "red"
        //implicitWidth: leftDelegateLoader.implicitWidth
        implicitHeight: parent.height
        implicitWidth: leftDelegate.implicitWidth
        //implicitWidth: childrenRect.width

        color: "#F0F3F5"
        z: visible ? -2 : 0

        Component.onCompleted: {
            control.background.topLeft=Qt.binding(function(){return !visible })
            control.background.bottomLeft=Qt.binding(function(){return !visible })
            border.color= control.border.color
            border.width=control.border.width
        }

        Delegate{
            id: leftDelegate
            icon.source: control.leftIcon;
            onClicked: control.entered(control.text)

        }
    }
}
