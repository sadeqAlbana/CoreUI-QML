set(qml_files
    "CCheckableComboBox.qml"
    "CComboBox.qml"
    "CDateInput.qml"
    "CheckableComboBox.qml"
    "CheckableListView.qml"
    "CMonthGrid.qml"
    "CTextArea.qml"
    "CTextField.qml"
    "CMonthGridButton.qml"
    "DateUtils.js"
    "CCheckableComboBoxGroup.qml"
    "CComboBoxGroup.qml"
    "CTextFieldGroup.qml"
    "CTextInputGroup.qml"
    "FormGroup.qml"

)

qt_add_library(coreuiforms STATIC)
qt_add_qml_module(coreuiforms
    URI "CoreUI.Forms"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)
