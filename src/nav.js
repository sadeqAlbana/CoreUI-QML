.pragma library

function navBar(){
    return [
                {
                    "title": qsTr("Dashboard"),
                    "category":"",
                    "image":"cil-speedometer",
                    "path":"qrc:/Demo/pages/Dashboard.qml",
                    "badge": {
                        "variant": "info",
                        "text": "NEW"
                    }
                },
                {
                    "title": qsTr("Colors"),
                    "image": "cil-drop",
                    "category":"THEME",
                    "path":"qrc:/Demo/pages/Colors.qml",

                },
                {
                    "title": qsTr("Typography"),
                    "image": "cil-pen",
                    "category":"THEME",
                    "path":"qrc:/Demo/pages/Typography.qml",

                },

                {
                    "title": qsTr("Base"),
                    "image": "cil-puzzle",
                    "category":"COMPONENTS",

                    "childItems":[
                        {"title": qsTr("Accordion"),
                        "path":"qrc:/Demo/pages/Accordions.qml"
                        },
                        {"title": qsTr("Breadcrumb"),
                        "path":"qrc:/Demo/pages/BreadcrumbPage.qml"
                        },
                        {"title": qsTr("Cards"),
                        "path":"qrc:/Demo/pages/CardsPage.qml"
                        }

                    ]
                },

                {
                    "title": qsTr("Buttons"),
                    "image": "cil-cursor",
                    "category":"COMPONENTS",

                    "childItems":[
                        {"title": qsTr("Buttons"),
                        "path":"qrc:/Demo/pages/Buttons.qml"
                        }
                    ]
                },

                {
                    "title": qsTr("Forms"),
                    "image": "cil-notes",
                    "category":"COMPONENTS",

                    "childItems":[
                        {"title": qsTr("Form Control"),
                        "path":"qrc:/Demo/pages/forms/FormControl.qml"
                        },
                        {"title": qsTr("Select"),
                        "path":"qrc:/Demo/pages/forms/SelectPage.qml"
                        },
                        {"title": qsTr("Multi Select"),
                        "path":"qrc:/Demo/pages/forms/SelectPage.qml",
                            "badge": {
                                "variant": "danger",
                                "text": "PRO"
                            }
                        }
                    ]
                },


            ];
}


