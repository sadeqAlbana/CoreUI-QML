import QtQuick
import QtQuick.Layouts
GridLayout {
    id: layout
    property int maxImplicitWidth: 0
    Layout.minimumWidth: maxImplicitWidth
    onWidthChanged: updateValues()
    onImplicitWidthChanged: updateValues()

    function updateValues() {
        let maxLength = 0
        let count = 0
        for (var i = 0; i < layout.children.length; i++) {
            let child = layout.children[i]

            if (!child.width <= 0) {
                if (child.implicitWidth > maxLength) {
                    maxLength = child.implicitWidth
                }

                count++
            }
        }
        maxImplicitWidth = maxLength
        let childCount = count

        //part 2
        let decimalColumnCount = (layout.width - (columnSpacing * childCount))
            / (maxImplicitWidth)

        for (var j = 0; j < layout.children.length; j++) {
            let c = layout.children[j]
            if (!c.width <= 0) {
                c.Layout.minimumWidth = maxImplicitWidth
            }
        }

        let columnCount = parseInt(decimalColumnCount, 10)

        if (columnCount <= 0) {
            columns = 1
            return
        }

        if (Number.isNaN(columnCount) || columnCount <= 1) {
            columns = columnCount
            return
        }

        if (columnCount >= childCount) {
            columns = childCount
            return
        }

        if (childCount % 2 === 0
                && childCount % columnCount !== 0) {
            while (childCount % columnCount !== 0) {
                if (columnCount <= 1) {
                    columns = columnCount
                    return
                }
                columnCount--
            }
        }

        columns = columnCount
    }
}
