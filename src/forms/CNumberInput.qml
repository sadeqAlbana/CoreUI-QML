import QtQuick
import QtQuick.Controls;

CTextField {
    id: control
    validator: IntValidator{}
    function value(){return parseFloat(control.text)}
}
