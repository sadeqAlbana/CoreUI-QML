set(qml_files
    "CButton.qml"
    "CButtonOutline.qml"
    "CCheckBox.qml"
    "CGhostButton.qml"
    "CPillButton.qml"
    "SquareButton.qml"
    "CTabButton.qml"
    "CLinkButton.qml"
)

qt_add_library(coreuibuttons STATIC)
qt_add_qml_module(coreuibuttons
    URI "CoreUI.Buttons"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)
