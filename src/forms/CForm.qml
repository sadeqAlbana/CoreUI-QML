import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import QtQuick.Dialogs
import CoreUI
QtObject {
    id: form
    required property list<Item> items
    property var initialValues: null
    property string fetchMethod: "GET"
    property string method: keyValue!==null? "PUT" : "POST"
    property string url
    property string fetchUrl: form.url

    property var keyValue : null //key value
    property string dataKey: "id"; //query param key or json object key, default is id


    property var applyHandler: function (url,method,data){
                if(method==="POST"){
                    NetworkManager.post(url,data).subscribe(function(res){
                        if(res.json('status')===200){
                            Router.back();
                        }else{
                            console.log("network error: " + res.status() + " "  + res.data())


                        }
                    })
                }else if(method==="PUT"){

                    NetworkManager.put(url,data).subscribe(function(res){
                        if(res.json('status')===200){
                            Router.back();
                        }else{
                            console.log("network error: " + res.status() + " "  + res.data())
                        }
                    })
                }

            }

    property bool readOnly: false
    Component.onCompleted: {
        if(initialValues!==null){
            setInitialValues();
        }else if(keyValue!==null){
            if(form.fetchMethod==="GET"){
                NetworkManager.get(form.fetchUrl+'?'+dataKey+'='+keyValue).subscribe(function(response){
                form.initialValues=response.json('data');
                    setInitialValues();
            });

            }
            else if(form.fetchMethod=="POST"){
                NetworkManager.post(form.fetchUrl,{dataKey: keyValue}).subscribe(function(response){
                form.initialValues=response.json('data');
                    setInitialValues();

            });

            }
        }
    }

    onInitialValuesChanged: setInitialValues();
    function apply() {
        if (form.url) {
            form.applyHandler(form.url, form.method, form.data())
        } else {
            form.applyHandler(form.data())
        }
    }

    function validate() {

        let valid = true
        for (var i = 0; i < items.length; i++) {
            let item = items[i]

            if (item instanceof TextInput || item instanceof TextEdit
                    || item instanceof T.ComboBox) {
                if (!item.acceptableInput) {
                    valid = false
                }
            }
        } //foreach

        return valid
    }

    function setInitialValues() {
        if (initialValues == null)
            return

        for (var i = 0; i < items.length; i++) {
            let item = items[i]
            let key = item.objectName

            let data = null

            if (initialValues.hasOwnProperty(key)) {
                data = initialValues[key]
            }else{
                continue;
            }

            if (item instanceof TextInput || item instanceof TextEdit) {
                item.text = data;
                item.readOnly=form.readOnly;
            } else if (item instanceof T.ComboBox) {
                    item.enabled=!form.readOnly;
                item.currentIndex = item.indexOfValue(data)

                if(item.model instanceof AbstractItemModel){
                    item.model.onModelReset.connect(function(){
                        item.currentIndex = initialValues[item.objectName]
                    })
                }

            } else if (item instanceof T.SpinBox) {
                item.value = data
                item.editable=!form.readOnly
            } else if (item instanceof T.Slider) {
                item.value = data
                item.enabled=!form.readOnly
            } else if (item instanceof T.Switch
                       || item instanceof T.SwitchDelegate) {
                item.position = data ? 1 : 0
                item.enabled=!form.readOnly

            } else if (item instanceof T.Dial) {
                item.value = data
            }else if (item instanceof CheckableListView) {
                item.enabled=!form.readOnly
                //TODO: rewrite the below piece
                let itemModel= item.model
                if(itemModel?.checkable &&  typeof  item.model.toJsonArray ===  'function'){
                    itemModel.uncheckAll()
                    itemModel.matchChecked(initialValues[key], item.matchKey, item.matchKey)
                    if(itemModel.hasOwnProperty('onModelReset')){
                        itemModel.onModelReset.connect(function(){
                            itemModel.uncheckAll()
                            itemModel.matchChecked(initialValues[key], item.matchKey, item.matchKey)
                        })
                    }
                }

                //TODO: get checked items
            }
        }
    }

    function data() {
        //returns form data
        let formData = initialValues ?? {}

        for (var i = 0; i < items.length; i++) {
            let item = items[i]
            let key = item.objectName

            let data = null

            if (item instanceof TextInput || item instanceof TextEdit) {
                data = item.text

                if(item instanceof CNumberInput){
                    data=item.value();

                }

            } else if (item instanceof T.ComboBox) {
                data = item.currentValue
            } else if (item instanceof T.SpinBox) {
                data = item.value
            } else if (item instanceof T.Slider) {
                data = item.value
            } else if (item instanceof T.Switch
                       || item instanceof T.SwitchDelegate) {
                data = item.position === 1
            } else if (item instanceof T.Dial) {
                data = item.value
            }

            else if (item instanceof FileInput) {
                            let dlg=item.dialog
                            switch(dlg.fileMode){
                            case FileDialog.OpenFile: data=dlg.selectedFile; break;
                            case FileDialog.OpenFiles: data=dlg.selectedFiles; break;
                            default: break;

                            }

            }

            else if (item instanceof CheckableListView) {
                let itemModel=item.model;
                if(itemModel?.checkable &&  typeof  item.model.toJsonArray ===  'function'){

                    data = itemModel.toJsonArray(Qt.Checked)
                }

                }


            if (data !== null) {
                formData[key] = data
            }
        } //foreach


        return formData
    }
}
