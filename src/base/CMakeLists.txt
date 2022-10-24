set(qml_files
    "Card.qml"
    "CardLabel.qml"
    "DashboardWidget.qml"
    "CApplicationWindow.qml"
    "CToolBar.qml"
    "CLabel.qml"
    "CNavigationDrawer.qml"
    "CNavBarDelegate.qml"
    "CItemDelegate.qml"
    "CPage.qml"
    "CTabBar.qml"
    "CLink.qml"
    "Accordion.qml"
    "AccordionDelegate.qml"
    "AccordionContentItem.qml"
)

qt_add_library(coreuibase STATIC)
qt_add_qml_module(coreuibase
    URI "CoreUI.Base"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)

target_link_libraries(coreuibase PRIVATE Qt6::Charts)
