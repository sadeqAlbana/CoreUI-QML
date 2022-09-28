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
                    "title": qsTr("Buttons"),
                    "category":"COMPONENTS",

                    "childItems":[
                        {"title": qsTr("Buttons"),
                        "path":"qrc:/Demo/pages/Buttons.qml"}
                    ]
                }

            ];
}


