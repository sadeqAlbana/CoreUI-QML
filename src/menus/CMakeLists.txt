set(qml_files
    "CActionsMenu.qml"
    "CMenu.qml"
    "CMenuBar.qml"
    "CMenuItem.qml"
)
qt_add_library(coreuimenus STATIC)
qt_add_qml_module(coreuimenus
    URI "CoreUI.Menus"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)
