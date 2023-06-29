set(qml_files
    "CHorizontalHeaderDelegate.qml"
    "CListView.qml"
    "CListViewDelegate.qml"
    "CListViewHeaderDelegate.qml"
    "CTableView.qml"
    "CTableViewDelegate.qml"
    "CBasicTableView.qml"
    "CTabView.qml"
    "CTableViewEditDelegate.qml"
)
qt_add_library(coreuiviews STATIC)
qt_add_qml_module(coreuiviews
    URI "CoreUI.Views"
    VERSION 1.0
    QML_FILES
        ${qml_files}
)
