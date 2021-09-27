import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
Popup{
    id: toastrService
    width: 350
    height: listView.height
    background: Rectangle{color: "transparent"}

    clip: true;
    parent: Overlay.overlay
    x: parent.width-listView.width-10
    y: 70
    closePolicy: Popup.NoAutoClose
    margins: 0
    padding: 0

    function push(title, message,type,duration){
        listView.push(title,message,type,duration)
    }

    Component.onCompleted: open();

    contentItem: ListView{

        id: listView
        visible: count>0
        spacing: 5
        width: toastrService.width
        interactive: false



        property int delegateHeight: 100
        height: (count*delegateHeight)+(count*spacing)
        model: ListModel{}

        delegate: Rectangle{
            id: toastr;
            width: ListView.view.width
            height: ListView.view.delegateHeight

            //color: "#2EB85C"
            color: {
                switch(model.type){
                    case "success" : "#2EB85C"; break;
                    case "info" : "#3399FF"; break;
                    case "warning" : "#F9B115"; break;
                    case "error" : "#E55353"; break;
                    default : "white";
                }
            }

            radius: 5

            Label{
                id: titleLabel
                font.pixelSize: 20
                color: "white"
                font.bold: true
                text: model.title
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 14
            }
            Label{
                id: messageLabel
                font.pixelSize: 18
                text: model.message
                color: "white"
                anchors.top: titleLabel.bottom
                anchors.left: parent.left
                anchors.topMargin: 8
                anchors.leftMargin: 14
            }

            AbstractButton{
                id: xBtn
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 10
                padding: 0
                hoverEnabled: true
                background: Rectangle{color: "transparent"}
                onClicked: remove();
                contentItem: Label{
                    id: label
                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 20
                    color: "white"
                    text: "×"
                    styleColor: "#000015"
                    font.bold: true
                    opacity: 0.75
                    states: [State{name: "hovered"; when: xBtn.hovered;
                            PropertyChanges {
                                target: label; opacity : 1; restoreEntryValues: true;
                            }
                        }]
                }
            }

            Timer{
                id: timer;
                interval: model.duration
                running: true
                repeat: false;
                onTriggered: toastr.remove()
            }

            function remove(){
                timer.stop();
                ListView.view.model.remove(toastr.row,1)
            }
        }//delegate

        function push(title, message,type,duration){
            model.append({
                             "title": title,
                             "message": message,
                             "type" :   type,
                             "duration": duration});
        }
    }//listview

}//popup
