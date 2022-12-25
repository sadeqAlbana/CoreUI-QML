import QtQuick
import QtQuick.Controls

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
                else if(item instanceof ComboBox){
                    item.currentValue=data;
                }

                else if(item instanceof SpinBox){
                    item.value=data;
                }

                else if(item instanceof Slider ){
                    item.value=data;
                }

                else if(item instanceof Switch || item instanceof SwitchDelegate){
                    item.position=data? 1 : 0
                }
                else if(item instanceof Dial ){
                    item.value=data;
                }




        }
    }

    function data(){ //returns form data
        let formData={}
        for(var i=0;i<items.length; i++){
            let item=items[i]
            let key=item.objectName

            let data=null

            if(item instanceof TextInput || item instanceof TextEdit){
                data=item.text;
            }
            else if(item instanceof ComboBox){
                data=item.currentValue;
            }

            else if(item instanceof SpinBox){
                data=item.value;
            }

            else if(item instanceof Slider ){
                data=item.value;
            }

            else if(item instanceof Switch || item instanceof SwitchDelegate){
                data=item.position===1;
            }
            else if(item instanceof Dial ){
                data=item.value;
            }

            if(data!==null){
                formData[key]=data;
            }
        }//foreach

        return formData;
    }


}


