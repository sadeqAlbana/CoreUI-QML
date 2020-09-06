import QtQuick 2.0
import QtQuick.Layouts 1.12
import "qrc:/CoreUI/components/base"
import QtQuick.Controls 2.5
import "qrc:/CoreUI/components/forms"
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
            headerText: "Credit Card"
            Layout.fillWidth: true
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

                RowLayout{
                    Layout.fillWidth: true

                    CComboBoxGroup{
                        label.text: "Month"

                    }

                    CComboBoxGroup{
                        label.text: "Year"

                    }

                    CComboBoxGroup{
                        label.text: "CV/CVC"

                    }
                }
            }
        }

        Card{
            headerText: "Company"
            Layout.fillWidth: true
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
            headerText: "Company"
            Layout.fillWidth: true
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

                AdvancedTextInput{
                    placeHolderText: "Text"
                    helpBlock : Label{
                        id: textHelpBlock
                        color: "#3c4b64"
                        text: "This is a help text"
                    }
                }

            }
        }//card

        Card{
            headerText: "Horizontal Form"
            Layout.fillWidth: true
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
        }//card end
    }
}
