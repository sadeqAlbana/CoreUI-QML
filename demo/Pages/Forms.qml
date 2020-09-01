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
            content: ColumnLayout {
                spacing: 20
                CTextInputGroup{
                    label.text: "Email"
                    textInput.placeholderText: "Country name"
                    horizontal: true
                }
            }
        }
    }
}
