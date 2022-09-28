set(qml_files
    "CBorder.qml"
    "CIcon.qml"
    "HorizontalSpacer.qml"
    "VerticalSpacer.qml"
    "RoundedRect.qml"
    "RoundingMask.qml"
    "ButtonBackground.qml"
)

qt_add_library(coreuiimpl STATIC)
qt_add_qml_module(coreuiimpl
    URI "CoreUI.Impl"
    IMPORTS QtQml
    VERSION 1.0
    QML_FILES
        ${qml_files}
)





