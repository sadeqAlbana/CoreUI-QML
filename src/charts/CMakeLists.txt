qt_add_library(coreuicharts STATIC)
qt_add_qml_module(coreuicharts
    URI "CoreUI.Charts"
    IMPORTS QtCharts
    VERSION 1.0
    SOURCES
        csplineseries.h csplineseries.cpp
)
target_link_libraries(coreuicharts PRIVATE Qt6::Core Qt6::Charts)
