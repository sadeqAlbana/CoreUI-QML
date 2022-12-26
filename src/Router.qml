pragma Singleton
import QtQuick


//the goal was to create an attached property that the children can inherit so that there can be more than one router in a single app,
//however, it's a little bit complicated to propigate the properties so we'll stick to a singleton for now

QtObject {
    id: router
    property string path;
    property var paths:['Home','Dashboard']
    signal navigateRequested(var path, var params, var root)
    function navigate(path,params, root){
        router.path=path
        navigateRequested(path,params, root);
    }

}
