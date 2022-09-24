import QtQuick
import QtQuick.Layouts
import CoreUI.Base
import QtQuick.Controls
import CoreUI.Forms
import CoreUI.Buttons
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs
ScrollView{
    id: scrollView
    clip: true
    anchors.fill: parent;
    padding: 25
    property string cardText: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.";
    GridLayout {
        id:grildLayout
        width: parent.parent.width
        columnSpacing: 30
        rowSpacing: 30
        columns: 3
        Card{
            title: "Card title"
            Layout.fillHeight: true
            Layout.fillWidth: true

            ContentTextArea{}
        }

            Card{
                title: "Card with icon"

                Layout.fillHeight: true
                Layout.fillWidth: true

                ContentTextArea{}
            }


            Card{
                title: "Card with switch"
                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
            }

            Card{
                title: "Card with label"
                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
            }

            Card{
                title: "Card with label"


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
            }

            Card{
                title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }

            //repeated
            Card{
                title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }
            Card{
                title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }
            Card{
                title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }
            Card{
                title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }
            Card{
               title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }
            Card{
                title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }
            Card{
                title: "Card Outline";


                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }
            Card{
                title: "Card Outline";
                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }

            Card{
                title: "Card Outline";
                Layout.fillHeight: true
                Layout.fillWidth: true
                ContentTextArea{}
                accentColor: "blue"
            }


        }

        component ContentTextArea : TextArea {

            //width: parent.width
            //height: parent.height

            implicitWidth: 400
            implicitHeight: 110

            text: cardText
            readOnly: true
            wrapMode: Text.WordWrap
            anchors.fill: parent;


        }

    }
