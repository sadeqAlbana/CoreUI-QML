set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


add_subdirectory(impl)
add_subdirectory(base)
add_subdirectory(buttons)
add_subdirectory(forms)
add_subdirectory(palettes)
add_subdirectory(notifications)
add_subdirectory(menus)
add_subdirectory(views)
add_subdirectory(charts)

set_source_files_properties(Router.qml PROPERTIES
    QT_QML_SINGLETON_TYPE TRUE
)

add_custom_target(coreui_other_assets SOURCES style.css)
qt_add_library(coreui STATIC)
qt_add_qml_module(coreui
    URI "CoreUI"
    VERSION 1.0
    IMPORTS QmlRoundedRectangle
    SOURCES
        coreui.h coreui.cpp
    IMPORTS
        CoreUI.Impl QtCharts
    QML_FILES
        MainScreen.qml
        Router.qml
        nav.js
)



target_link_libraries(coreui PRIVATE Qt6::Gui Qt6::Widgets Qt6::Quick Qt6::Charts Qt6::Core5Compat libQmlRoundedRectangleplugin)
target_link_libraries(coreui
    PUBLIC coreuiimpl coreuibase coreuibuttons coreuiforms coreuipalettes
coreuinotifications coreuimenus coreuiviews coreuicharts jsonmodelplugin)
