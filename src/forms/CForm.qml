import QtQuick
import QtQuick.Controls

QtObject {
    id: form

    required property list<Item> items;
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


