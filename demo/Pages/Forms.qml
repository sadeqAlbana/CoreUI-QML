import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import "qrc:/CoreUI/components/forms"
import "qrc:/CoreUI/components/buttons"
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.3
ScrollView{
    id:scrollView
    clip: true
    anchors.fill: parent;

    GridLayout {
        id:grildLayout
        width: parent.parent.width
        height: parent.parent.height
        columnSpacing: 30
        rowSpacing: 30
        columns: 2




        Card{
            //headerComponent: Qt.createObject(header);
            headerComponent: CardLabel{
                text: "Credit Card form"
            }

            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10

            content: ColumnLayout {
                spacing: 20
                CTextInputGroup{
                    label.text: "Name"
                    textInput.placeholderText: "Enter your name"
                }

                CTextInputGroup{
                    label.text: "Credit Card Number"
                    textInput.placeholderText: "0000 0000 0000 0000"
                }

                GridLayout{
                    Layout.fillWidth: true
                    rows:2
                    columns:3


                    Label{
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        color: "#3c4b64"
                        text: "Month"
                    }
                    CComboBox{
                        Layout.fillWidth: true
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        model: ListModel {
                            ListElement { modelData: 1;}
                            ListElement { modelData: 2; }
                            ListElement { modelData: 3;}
                            ListElement { modelData: 4;}
                            ListElement { modelData: 5;}
                            ListElement { modelData: 6;}
                            ListElement { modelData: 7;}
                            ListElement { modelData: 8;}
                            ListElement { modelData: 9;}
                            ListElement { modelData: 10;}
                            ListElement { modelData: 11;}
                            ListElement { modelData: 12;}
                        }
                    }

                    Label{
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        color: "#3c4b64"
                        text: "Year"
                    }


                    CComboBox{
                        Layout.fillWidth: true
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        model: ListModel {
                            ListElement { modelData: 2020;}
                            ListElement { modelData: 2021; }
                            ListElement { modelData: 2022;}
                            ListElement { modelData: 2023;}
                            ListElement { modelData: 2024;}
                            ListElement { modelData: 2025;}
                            ListElement { modelData: 2026;}
                            ListElement { modelData: 2027;}
                            ListElement { modelData: 2028;}
                            ListElement { modelData: 2029;}
                            ListElement { modelData: 2030;}


                        }
                    }

                    Label{
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10

                        color: "#3c4b64"
                        text: "CV/CVC"
                    }

                    CTextInput{
                        Layout.fillWidth: true
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        placeholderText: "123"
                        validator: IntValidator{
                            bottom: 100
                            top:999
                        }
                    }



                    layoutDirection: Qt.LeftToRight
                    flow: GridLayout.TopToBottom
                }
            }
        }

        Card{
            headerComponent: CardLabel{
                text: "Company"
            }
            Layout.fillWidth: true
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            content: ColumnLayout {
                spacing: 20
                CTextInputGroup{
                    label.text: "Company"
                    textInput.placeholderText: "Enter your company name"
                }

                CTextInputGroup{
                    label.text: "VAT"
                    textInput.placeholderText: "pl1234567890"
                }

                CTextInputGroup{
                    label.text: "Street"
                    textInput.placeholderText: "Enter street name"
                }

                RowLayout{
                    CTextInputGroup{
                        label.text: "City"
                        textInput.placeholderText: "Enter your city"
                    }

                    CTextInputGroup{
                        label.text: "Postal Code"
                        textInput.placeholderText: "Postal Code"
                    }
                }

                CTextInputGroup{
                    label.text: "Country"
                    textInput.placeholderText: "Country name"
                }
            }
        }//end Card
        Card{
            headerComponent: CardLabel{
                anchors.fill: parent
                text: "Company"
            }
            Layout.fillWidth: true
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            content: GridLayout {
                columns: 2
                rowSpacing: 30
                columnSpacing: 100
                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Static"
                }
                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Username"
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Text Input"
                    bottomPadding: 25
                }

                //                AdvancedTextInput{
                //                    placeHolderText: "Text"
                //                    helpBlock : Label{
                //                        id: textHelpBlock
                //                        color: "#3c4b64"
                //                        text: "This is a help text"
                //                    }
                //                }

                TestTextField{
                    Layout.fillWidth: true
                    placeholderText: "test222222222222"
                    helpBlock : Label{
                        id: textHelpBlock
                        color: "#3c4b64"
                        text: "This is a help text"
                        topPadding: 6
                    }

                    leftRectContent: Label{
                        leftPadding: 10
                        rightPadding: 10
                        anchors.fill: parent;
                        clip:true
                        anchors.centerIn: parent
                        text: "Left"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    rightRectContent: Label{
                        leftPadding: 10
                        rightPadding: 10
                        anchors.fill: parent;
                        clip:true
                        anchors.centerIn: parent
                        text: "Right"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Email"
                    bottomPadding: 25
                }
                AdvancedTextInput{
                    Layout.fillWidth: true
                    helpBlock : Label{
                        color: "#3c4b64"
                        text: "Please enter your email"
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Password"
                    bottomPadding: 25
                }
                AdvancedTextInput{
                    Layout.fillWidth: true
                    echoMode: TextInput.Password
                    helpBlock : Label{
                        color: "#3c4b64"
                        text: "Please enter your password"
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Date Input"
                    bottomPadding: 25
                }
                AdvancedTextInput{
                    Layout.fillWidth: true

                    textInput.inputMask: "00/00/0000"
                    //text:"202002-02"
                    placeHolderText:"dd/mm/yyyy"
                    helpBlock : Label{
                        color: "#3c4b64"
                        text: "Please enter a valid date"
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled"

                }
                AdvancedTextInput{
                    Layout.fillWidth: true
                    placeHolderText:"Disabled"
                    enabled: false
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    Layout.alignment: Qt.AlignTop
                    color: "#3c4b64"
                    text: "Textarea"

                }


                CTextArea{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    placeholderText: "Content..."


                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Select"
                }

                CComboBox{
                    Layout.fillWidth: true
                    model: ListModel {
                        ListElement { modelData: "Option #1"; }
                        ListElement { modelData: "Option #2";  }
                        ListElement { modelData: "Option #3"; }
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Select Large"
                }

                CComboBox{
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight*1.3
                    model: ListModel {
                        ListElement { modelData: "Option #1"; }
                        ListElement { modelData: "Option #2";  }
                        ListElement { modelData: "Option #3"; }
                    }
                }


                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Select Small"
                }

                CComboBox{
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight/1.3
                    model: ListModel {
                        ListElement { modelData: "Option #1"; }
                        ListElement { modelData: "Option #2";  }
                        ListElement { modelData: "Option #3"; }
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Disabled Select"
                }

                CComboBox{
                    Layout.fillWidth: true
                    enabled: false
                    model: ListModel {
                        ListElement { modelData: "Option #1"; }
                        ListElement { modelData: "Option #2";  }
                        ListElement { modelData: "Option #3"; }
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Multiple select"
                }

                CListView{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 500
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Radios"
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    RadioButton {
                        checked: true
                        text: qsTr("Option 1")
                    }
                    RadioButton {
                        text: qsTr("Option 2")
                    }
                    RadioButton {
                        text: qsTr("Option 3")
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Inline Radios"
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    RadioButton {
                        checked: true
                        text: qsTr("One")
                    }
                    RadioButton {
                        text: qsTr("Two")
                    }
                    RadioButton {
                        text: qsTr("Three")
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Checkboxes"
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    CheckBox {
                        checked: true
                        text: qsTr("Option 1")
                    }
                    CheckBox {
                        text: qsTr("Option 2")
                    }
                    CheckBox {
                        checked: true
                        text: qsTr("Option 3")
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Inline Checkboxes"
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    CheckBox {
                        checked: true
                        text: qsTr("One")
                    }
                    CheckBox {
                        text: qsTr("Two")
                    }
                    CheckBox {
                        checked: true
                        text: qsTr("Three")
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "File Input"
                }



                CButton{
                    implicitWidth: 150
                    implicitHeight: 43
                    text: "Browse..."
                    background: Rectangle{
                        color: "#d8dbe0";
                    }


                    onClicked: {
                        fileDialog.visible=true
                    }
                    FileDialog {
                        id: fileDialog
                        title: "Please choose a file"
                        //folder: shortcuts.home
                        onAccepted: {
                            console.log("You chose: " + fileDialog.fileUrls)
                            //Qt.quit()
                        }
                        onRejected: {
                            console.log("Canceled")
                        }
                        //Component.onCompleted: visible = true
                    }
                }


            }
        }//card

        Card{
            headerComponent: CardLabel{
                text: "Horizontal Form"

            }
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.leftMargin: 10
            Layout.rightMargin: 10

            content: GridLayout {
                columns: 2
                rowSpacing: 30
                columnSpacing: 100
                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Email"
                    bottomPadding: 25
                }
                AdvancedTextInput{
                    Layout.fillWidth: true
                    helpBlock : Label{
                        color: "#3c4b64"
                        text: "Please enter your email"
                    }
                }

                Label{
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10
                    color: "#3c4b64"
                    text: "Password"
                    bottomPadding: 25
                }
                AdvancedTextInput{
                    Layout.fillWidth: true
                    echoMode: TextInput.Password
                    helpBlock : Label{
                        color: "#3c4b64"
                        text: "Please enter your password"
                    }
                }

            }


            footerComponent: RowLayout{
                anchors.fill: parent;
                anchors.margins: 10

                CButton{
                    text: "Submit"
                    color: "#321fdb"
                    textColor: "#ffffff"
                    Layout.fillHeight: true
                    implicitWidth: 60
                }


                CButton{
                    text: "Reset"
                    color: "#e55353"
                    textColor: "#ffffff"
                    Layout.fillHeight: true
                    implicitWidth: 60
                }
            }
        }//card end
    }
}
