cmake_minimum_required(VERSION 3.16)
project(CoreUIQml VERSION 0.1 LANGUAGES CXX)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)
find_package(Qt6 COMPONENTS Qml Core5Compat Gui Widgets Charts Quick QmlImportScanner REQUIRED)

add_subdirectory(src)
add_subdirectory(libs/json-model)
add_subdirectory(libs/QmlRoundedRectangle)

if(COREUI_BUILD_EXAMPLES)
add_subdirectory(examples)
endif()
list(APPEND QML_DIRS "${CMAKE_CURRENT_BINARY_DIR}/qml" )

#list(APPEND QML_DIRS "C:/Users/sadeq/projects/Qt/coreuimig/CoreUIQml/src/impl")

target_sources(coreuiplugin
    PUBLIC
        assets/assets.qrc)


    list(APPEND QML_DIRS "${CMAKE_CURRENT_BINARY_DIR}/src")
    list(REMOVE_DUPLICATES QML_DIRS)
    set(QML_IMPORT_PATH ${QML_DIRS}
        CACHE STRING "Qt Creator 4.1 extra qml import paths"
        FORCE
    )


