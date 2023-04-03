import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

QtObject {
    id: form
    required property list<Item> items;
    property var initialValues: null
    property string method: "POST";
    property string url;
    required property var applyHandler;
    Component.onCompleted: setInitialValues();

    function apply(){
        if(form.url){
            form.applyHandler(url,method,data())
        }
        else{
            form.applyHandler(data())
        }
    }


    function setInitialValues(){
        if(initialValues==null)
            return;

        for(var i=0;i<items.length; i++){
            let item=items[i];
            let key=item.objectName

            let data=null

            if(initialValues.hasOwnProperty(key)){
                data=initialValues[key];
            }


                if(item instanceof TextInput || item instanceof TextEdit){
                    item.text=data
                }
                else if(item instanceof T.ComboBox){
                    item.currentIndex=item.indexOfValue(data);
                }

                else if(item instanceof T.SpinBox){
                    item.value=data;
                }

                else if(item instanceof T.Slider ){
                    item.value=data;
                }

                else if(item instanceof T.Switch || item instanceof T.SwitchDelegate){
                    item.position=data? 1 : 0
                }
                else if(item instanceof T.Dial ){
                    item.value=data;
                }




        }
    }

    function data(){ //returns form data
        let formData=initialValues?? {}

        for(var i=0;i<items.length; i++){
            let item=items[i]
            let key=item.objectName

            let data=null

            if(item instanceof TextInput || item instanceof TextEdit){
                data=item.text;
            }
            else if(item instanceof T.ComboBox){
                data=item.currentValue;
            }

            else if(item instanceof T.SpinBox){
                data=item.value;
            }

            else if(item instanceof T.Slider ){
                data=item.value;
            }

            else if(item instanceof T.Switch || item instanceof T.SwitchDelegate){
                data=item.position===1;
            }
            else if(item instanceof T.Dial ){
                data=item.value;
            }

            if(data!==null){
                formData[key]=data;
            }
        }//foreach

        return formData;
    }


}


