import QtQuick
import QtQuick.Layouts
GridLayout {
    id: layout

    columns: {
        let childCount = 0
        let childrenWidth=0;
        let columnCount=1;
        for (var i = 0; i < layout.children.length; i++) {
            let child = layout.children[i]
            childrenWidth+= child.Layout.minimumWidth>child.implicitWidth? child.Layout.minimumWidth: child.implicitWidth


            if (!child.width <= 0) {
                childCount++
            }

        }

        let totalWidth=layout.width
        if(childCount>0 && columnSpacing>0){
            totalWidth-=(layout.columnSpacing-(childCount-1));
        }

        let decimalColumnCount = totalWidth/(childrenWidth/childCount)

        if(decimalColumnCount%1>0)
            decimalColumnCount--

        if(Number.isNaN(decimalColumnCount) || decimalColumnCount<=1)
            return 1


        columnCount=parseInt(decimalColumnCount,10)
        return columnCount;

    }//columns
}
