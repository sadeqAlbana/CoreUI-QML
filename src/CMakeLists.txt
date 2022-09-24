set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

add_subdirectory(impl)
add_subdirectory(base)
add_subdirectory(buttons)
add_subdirectory(forms)
add_subdirectory(palettes)
add_subdirectory(notifications)
add_subdirectory(menus)
add_subdirectory(views)

qt_add_library(coreui STATIC)
qt_add_qml_module(coreui
    URI "CoreUI"
    VERSION 1.0
    SOURCES
        test.h test.cpp
    IMPORTS
        CoreUI.Impl
    QML_FILES
        MainScreen.qml
        nav.js
    RESOURCES "../assets/assets.qrc"
)

target_link_libraries(coreui
    PUBLIC coreuiimpl coreuibase coreuibuttons coreuiforms coreuipalettes
coreuinotifications coreuimenus coreuiviews)
