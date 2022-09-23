set(qml_files
    "Badge.qml"
    "ToastrService.qml"
)

qt_add_library(coreuinotifications STATIC)
qt_add_qml_module(coreuinotifications
    URI "CoreUI.Notifications"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)
