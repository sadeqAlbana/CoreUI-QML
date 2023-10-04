import QtQuick
import QtQuick.Controls;

CTextField {
    id: control
    function value(){return parseFloat(control.text)}
}
