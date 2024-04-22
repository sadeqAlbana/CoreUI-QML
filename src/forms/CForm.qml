import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T
import QtQuick.Dialogs
import CoreUI
import JsonModels
QtObject {
    id: form
    required property list<Item> items
    property var initialValues: null
    property string fetchMethod: "GET"
    property string method: keyValue !== null ? "PUT" : "POST"
    property string url
    property string fetchUrl: form.url

    property var keyValue: null //key value
    property string dataKey: "id" //query param key or json object key, default is id

    property var applyHandler: function (url, method, data) {
        if (method === "POST") {
            NetworkManager.post(url, data).subscribe(function (res) {
                if (res.json('status') === 200) {
                    Router.back()
                } else {
                    console.log("network error: " + res.status(
                                    ) + " " + res.data())
                }
            })
        } else if (method === "PUT") {

            NetworkManager.put(url, data).subscribe(function (res) {
                if (res.json('status') === 200) {
                    Router.back()
                } else {
                    console.log("network error: " + res.status(
                                    ) + " " + res.data())
                }
            })
        }
    }

    property bool readOnly: false
    Component.onCompleted: {
        if (initialValues !== null) {

            //  setInitialValues();
        } else if (keyValue !== null) {
            if (form.fetchMethod === "GET") {
                NetworkManager.get(
                            form.fetchUrl + '?' + dataKey + '=' + keyValue).subscribe(
                            function (response) {
                                form.initialValues = response.json('data')
                            })
            } else if (form.fetchMethod == "POST") {
                NetworkManager.post(form.fetchUrl, {
                                        "dataKey": keyValue
                                    }).subscribe(function (response) {
                                        form.initialValues = response.json(
                                                    'data')
                                    })
            }
        }
    }

    onInitialValuesChanged: setInitialValues()
    function apply() {
        let handler = form.applyHandler
        if (form.url) {
            handler(form.url, form.method, form.data())
        } else {
            let FormData = form.data()
            handler(FormData)
        }
    }

    function validate() {

        let valid = true
        for (var i = 0; i < items.length; i++) {
            let item = items[i]

            if (item instanceof TextInput
                    || item instanceof T.ComboBox) {
                if (!item.acceptableInput) {
                    valid = false
                }
            }
        } //foreach

        return valid
    }

    function indexOfValue(comboBox, value) {
        for (var i = 0; i < comboBox.count; i++) {
            if (comboBox.valueAt(i) === value) {
                return i
            }
        }
        return -i
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
            } else {
                continue
            }

            if (item instanceof TextInput || item instanceof TextEdit) {
                item.text = data
                item.readOnly = form.readOnly
            } else if (item instanceof T.ComboBox) {
                if (form.readOnly) {
                    item.enabled = false //dont ever use enabled=!form.readOnly
                }
                let formValue = initialValues[item.objectName]
                item.currentIndex = indexOfValue(item, formValue)


                //a trick to set the value on asynchronous models
                item.onCountChanged.connect(function onCbCountChanged() {
                    item.currentIndex = indexOfValue(item, formValue)
                    item.onCountChanged.disconnect(onCbCountChanged);
                })

            } else if (item instanceof T.SpinBox) {
                item.value = data
                item.editable = !form.readOnly
            } else if (item instanceof T.Slider) {
                item.value = data
                item.enabled = !form.readOnly
            } else if (item instanceof T.Switch
                       || item instanceof T.SwitchDelegate) {
                item.position = data ? 1 : 0
                item.enabled = !form.readOnly
            } else if (item instanceof T.Dial) {
                item.value = data
            } else if (item instanceof FolderInput) {
                item.dlg.selectedFolder = data
            } else if (item instanceof ListView || item instanceof TableView) {
                item.enabled = !form.readOnly
                //TODO: rewrite the below piece
                let itemModel = item.model;
                if (itemModel?.checkable
                        && typeof itemModel.toJsonArray === 'function') {
                    itemModel.uncheckAll()
                    itemModel.matchChecked(initialValues[key], item.matchKey,
                                           item.matchKey)
                    if (itemModel.hasOwnProperty('onModelReset')) {
                        itemModel.onModelReset.connect(function () {
                            itemModel.uncheckAll()
                            itemModel.matchChecked(initialValues[key],
                                                   item.matchKey, item.matchKey)
                        })
                    }
                }

                if(typeof itemModel.toJsonArray === 'function'){
                    itemModel.records=initialValues[key];
                }

                //TODO: get checked items
            }
            else if(item instanceof T.CheckBox){
                item.checked=data;
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

                if (item instanceof CNumberInput) {
                    data = item.value()
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
            } else if (item instanceof FileInput) {
                let dlg = item.dialog
                switch (dlg.fileMode) {
                case FileDialog.OpenFile:
                    data = dlg.selectedFile
                    break
                case FileDialog.OpenFiles:
                    data = dlg.selectedFiles
                    break
                default:
                    break
                }
            } else if (item instanceof FolderInput) {
                data = item.dlg.selectedFolder
            } else if (item instanceof ListView || item instanceof TableView) {

                if (item instanceof CheckableListView) {
                    let itemModel = item.model
                    if (itemModel?.checkable
                            && typeof item.model["toJsonArray"] === 'function') {

                        data = itemModel.toJsonArray(Qt.Checked);
                    }
                }else{
                    if(typeof item.model["toJsonArray"] === 'function'){
                        data=item.model.toJsonArray();
                    }
                }
            }else if(item instanceof T.CheckBox){
                console.log("item is checked: " + item.checked)
                data=item.checked;
            }

            if (data !== null) {
                formData[key] = data
            }
        } //foreach

        return formData
    }
}
