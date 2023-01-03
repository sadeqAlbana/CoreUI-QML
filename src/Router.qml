pragma Singleton
import QtQuick


//the goal was to create an attached property that the children can inherit so that there can be more than one router in a single app,
//however, it's a little bit complicated to propigate the properties so we'll stick to a singleton for now

QtObject {
    id: router
    property var paths:[]
    signal navigateRequested(var path, var params, var root)
    signal backRequested(var index)

    function navigate(path,params, root){
        navigateRequested(path,params, root);
    }

    function back(index=-1){
        backRequested(index)
    }

}
