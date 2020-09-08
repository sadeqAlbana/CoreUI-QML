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
                    text:"test"
//                    onTextChanged: {
//                        var regex= /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;
//                        var validator = new RegExpValidator(regex);
//                        console.log(validator.validate(text))


//                    }

//                    textInput.validator : RegExpValidator{
//                        regExp: /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/

//                    }

                    helpBlock : Label{
                        color: "#3c4b64"
                        text: "Please enter a valid date"
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
