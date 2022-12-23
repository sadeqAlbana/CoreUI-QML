cmake_minimum_required(VERSION 3.14)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


qt_add_executable(appdemo
    main.cpp
)

qt_add_qml_module(appdemo
    URI "Demo"
    VERSION 1.0
    QML_FILES main.qml
    pages/Dashboard.qml
    pages/Cards.qml
    pages/Buttons.qml
    pages/Forms.qml
    pages/Colors.qml
    pages/Typography.qml
    pages/Accordions.qml
    pages/BreadcrumbPage.qml
    pages/forms/FormControl.qml
    pages/forms/SelectPage.qml
    pages/forms/MultiSelectPage.qml
    components/DemoChartView.qml
    components/DemoValueAxis.qml
)

set_target_properties(appdemo PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appdemo
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(appdemo
    PRIVATE Qt6::Quick Qt6::Gui Qt6::Charts coreuiplugin)
