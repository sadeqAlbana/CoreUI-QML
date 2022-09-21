cmake_minimum_required(VERSION 3.16)

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Quick)

qt_add_library(CoreUIQml STATIC)
qt_add_qml_module(CoreUIQml
    URI "CoreUI"
    IMPORTS CoreUI.Impl
    OPTIONAL_IMPORTS CoreUI.Base CoreUI.Palettes CoreUI.Notifications
    VERSION 1.0
    QML_FILES
        MainScreen.qml

)

add_subdirectory(impl)
#add_subdirectory(base)
#add_subdirectory(notifications)
#add_subdirectory(palettes)



target_link_libraries(CoreUIQml
    PRIVATE Qt6::Quick)

install(TARGETS CoreUIQml
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
