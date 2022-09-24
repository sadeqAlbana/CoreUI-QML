set(qml_files
    "Card.qml"
    "CardLabel.qml"
    "DashboardWidget.qml"
)

qt_add_library(coreuibase STATIC)
qt_add_qml_module(coreuibase
    URI "CoreUI.Base"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)
