set(qml_files
    "BrandDanger.qml"
    "BrandDark.qml"
    "BrandInfo.qml"
    "BrandLight.qml"
    "BrandPrimary.qml"
    "BrandSecondary.qml"
    "BrandSuccess.qml"
    "BrandWarning.qml"
)
qt_add_library(coreuipalettes STATIC)
qt_add_qml_module(coreuipalettes
    URI "CoreUI.Palettes"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)
