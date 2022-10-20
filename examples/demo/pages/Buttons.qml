import QtQuick
import QtQuick.Layouts
import CoreUI.Base
import QtQuick.Controls
import CoreUI.Forms
import CoreUI.Buttons
import Qt5Compat.GraphicalEffects
import QtQuick.Dialogs
import CoreUI.Impl
import QtQuick.Controls.Basic
import CoreUI.Palettes
import CoreUI.Views

Page {
    id: page
    title: qsTr("Buttons")
    background: Rectangle {
        color: "transparent"
    }
    padding: 15
    function createPalette(pal, parent) {
        return Qt.createComponent(
                    "qrc:///CoreUI/Palettes/" + pal + ".qml").createObject(
                    parent)
    }

    property var buttons: [{
            "text": qsTr("Primary"),
            "palette": "BrandPrimary"
        }, {
            "text": qsTr("Secondary"),
            "palette": "BrandSecondary"
        }, {
            "text": qsTr("Success"),
            "palette": "BrandSuccess"
        }, {
            "text": qsTr("Danger"),
            "palette": "BrandDanger"
        }, {
            "text": qsTr("Warning"),
            "palette": "BrandWarning"
        }, {
            "text": qsTr("Info"),
            "palette": "BrandInfo"
        }, {
            "text": qsTr("Light"),
            "palette": "BrandLight"
        }, {
            "text": qsTr("Dark"),
            "palette": "BrandDark"
        }]

    Flickable {
        id: flickable
        anchors.fill: parent
        //implicitWidth: grildLayout.implicitWidth
        contentHeight: grildLayout.implicitHeight

        GridLayout {
            id: grildLayout
            width: parent.parent.width
            height: parent.parent.height
            Layout.minimumWidth: implicitWidth
            columnSpacing: 30
            rowSpacing: 30
            columns: 1

            Card {
                title: "<b>Buttons</b>"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("CoreUI includes a bunch of predefined Bootstrap buttons, each serving its own semantic purpose. CoreUI also offers some unique buttons styles.\n\nButtons show what action will happen when the user clicks or touches it. Bootstrap buttons are used to initialize operations, both in the background or foreground of an experience.\n")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 10
                            rowSpacing: 25
                            columnSpacing: 5

                            CLabel {
                                text: "Normal"
                                Layout.rightMargin: 150
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }

                            CLinkButton {
                                text: qsTr("Link")
                                link: "https://google.com"

                                leftPadding: 10
                                rightPadding: 10
                                visited: true
                            }

                            CLabel {
                                text: "Active State"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    down: true
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }
                            CLinkButton {
                                text: "<a href='https://google.com'> Link</a>"
                                leftPadding: 10
                                rightPadding: 10
                                visited: true
                            }

                            CLabel {
                                text: "Disabled"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    enabled: false
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }
                            CLinkButton {
                                text: "<a href='https://google.com'> Link</a>"
                                leftPadding: 10
                                rightPadding: 10
                                visited: true
                                enabled: false
                            }
                        }
                    }
                }
            } //card end

            Card {
                title: "<b>Buttons</b> with icons"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("You can combine button with our <a href='https://coreui.io/icons'>CoreUI Icons.</a><br>")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 10
                            rowSpacing: 25
                            columnSpacing: 5

                            CLabel {
                                text: "Normal"
                                Layout.rightMargin: 150
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    icon.name: "cil-contrast"

                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }

                            CLinkButton {
                                text: qsTr("Link")
                                link: "https://google.com"
                                icon.name: "cil-contrast"

                                leftPadding: 10
                                rightPadding: 10
                                visited: true
                            }

                            CLabel {
                                text: "Active State"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    icon.name: "cil-contrast"

                                    down: true
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }
                            CLinkButton {
                                text: qsTr("Link")
                                link: "https://google.com"
                                icon.name: "cil-contrast"

                                leftPadding: 10
                                rightPadding: 10
                                visited: true
                            }

                            CLabel {
                                text: "Disabled"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButton {
                                    text: modelData.text
                                    icon.name: "cil-contrast"

                                    enabled: false
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }
                            CLinkButton {
                                text: "<a href='https://google.com'> Link</a>"
                                icon.name: "cil-contrast"

                                leftPadding: 10
                                rightPadding: 10
                                visited: true
                                enabled: false
                            }
                        }
                    }
                }
            } //card end

            Card {
                title: "<b>Buttons</b> tags"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("The .btn classes are designed for <button> , <a> or <input> elements (though some browsers may apply a slightly different rendering).<br><br>")
                        Layout.fillWidth: true
                    }

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr('If you’re using .btn classes on <a> elements that are used to trigger functionality ex. collapsing content, these links should be given a role="button" to adequately communicate their meaning to assistive technologies such as screen readers.<br>')
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        RowLayout {

                            Repeater {
                                model: [qsTr('Link'), qsTr("Button"), qsTr(
                                        "Input"), qsTr("Submit"), qsTr("Reset")]
                                delegate: CButton {
                                    text: modelData
                                    palette: BrandPrimary {}
                                }
                            }
                        }
                    }
                }
            } //buttons tags card

            Card {
                title: "<b>Buttons</b> outline"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("If you need a button, but without the strong background colors. Replace the default modifier classes with the .btn-outline-* ones to remove all background colors on any element with .btn class.<br>")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 9
                            rowSpacing: 25
                            columnSpacing: 5

                            CLabel {
                                text: "Normal"
                                Layout.rightMargin: 150
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButtonOutline {
                                    text: modelData.text
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }

                            CLabel {
                                text: "Active State"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButtonOutline {
                                    text: modelData.text
                                    down: true
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }

                            CLabel {
                                text: "Disabled"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CButtonOutline {
                                    text: modelData.text

                                    enabled: false
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }
                        }
                    }
                }
            } //card end

            Card {
                title: "<b>Buttons</b> ghost"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("Use .btn-ghost-* class for ghost buttons.<br>")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true

                        GridLayout {
                            columns: 9
                            rowSpacing: 25
                            columnSpacing: 5

                            CLabel {
                                text: "Normal"
                                Layout.rightMargin: 150
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CGhostButton {
                                    text: modelData.text
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }

                            CLabel {
                                text: "Active State"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CGhostButton {
                                    text: modelData.text
                                    down: true
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }

                            CLabel {
                                text: "Disabled"
                            }

                            Repeater {
                                model: page.buttons
                                delegate: CGhostButton {
                                    text: modelData.text

                                    enabled: false
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }
                            }
                        }
                    }
                }
            } //card end

            Card {
                title: "<b>Buttons</b> sizes"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("Larger or smaller buttons? Add .btn-lg or .btn-sm for additional sizes.")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {
                            Repeater {
                                model: [{
                                        "palette": "BrandPrimary"
                                    }, {
                                        "palette": "BrandSecondary"
                                    }]
                                delegate: CButton {
                                    text: qsTr("Large Button")
                                    font.pixelSize: 20
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                } //delegate
                            } //repeater
                        } //rowlayout
                    } //tabview

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {
                            Repeater {
                                model: [{
                                        "palette": "BrandPrimary"
                                    }, {
                                        "palette": "BrandSecondary"
                                    }]
                                delegate: CButton {
                                    text: qsTr("Small Button")
                                    font.pixelSize: 12
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                } //delegate
                            } //repeater
                        } //rowlayout
                    } //tabview
                } //ColumnLayout
            } //buttons sizes card

            Card {
                title: "<b>Buttons</b> pill"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {
                            spacing: 5
                            Repeater {
                                model: page.buttons
                                delegate: CPillButton {
                                    text: modelData.text
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }//CPillButton
                            }//Repeater
                        }//RowLayout
                    }//CTabView
                }//ColumnLayout
            } //Card buttons pill

            Card {
                title: "<b>Buttons</b> square"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {
                            spacing: 5
                            Repeater {
                                model: page.buttons
                                delegate: SquareButton {
                                    text: modelData.text
                                    palette: page.createPalette(
                                                 modelData.palette, this)
                                }//CPillButton
                            }//Repeater
                        }//RowLayout
                    }//CTabView
                }//ColumnLayout
            } //Card buttons pill

            Card {
                title: "<b>Buttons</b> disabled state"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20
                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("Add the disabled boolean attribute to any <button> element to make buttons look inactive. Disabled button has pointer-events: none applied to, disabling hover and active states from triggering.")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {

                            CButton{
                                palette: BrandPrimary{}
                                font.pixelSize: 20
                                enabled: false
                                text: qsTr("Primary Button")
                            }

                            CButton{
                                palette: BrandSecondary{}
                                font.pixelSize: 20
                                enabled: false
                                text: qsTr("Button")
                            }
                        }//RowLayout
                    }//CTabView

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("Disabled buttons using the &lt;a&gt; element act a little different:")
                        Layout.fillWidth: true
                    }

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr('&lt;a&gt;s don’t support the disabled attribute, so you have to add .disabled class to make buttons look inactive. The disabled bootstrap button must have the aria-disabled="true" attribute to show the state of the element to assistive technologies.')
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {

                            CButton{
                                palette: BrandPrimary{}
                                font.pixelSize: 20
                                enabled: false
                                text: qsTr("Primary Link")
                            }

                            CButton{
                                palette: BrandSecondary{}
                                font.pixelSize: 20
                                enabled: false
                                text: qsTr("Link")
                            }
                        }//RowLayout
                    }//CTabView
                }
            } //buttons disabled state

            Card {
                title: "<b>Buttons</b> block"
                header.visible: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                padding: 25

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 20

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("Create buttons that span the full width of a parent—by using utilities.")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true
                        ColumnLayout {
                            Repeater {
                                model: 2
                                delegate: CButton {
                                    text: qsTr("Button")
                                    font.pixelSize: 20
                                    palette: BrandPrimary{}
                                    Layout.fillWidth: true
                                } //delegate
                            } //repeater
                        } //rowlayout
                    } //tabview


                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("Here we create a responsive variation, starting with vertically stacked buttons until the md breakpoint, where .d-md-block replaces the .d-grid class, thus nullifying the gap-2 utility. Resize your browser to see them change.")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {
                            Repeater {
                                model: 2
                                delegate: CButton {
                                    text: qsTr("Button")
                                    font.pixelSize: 20
                                    palette: BrandPrimary{}
                                } //delegate
                            } //repeater
                        } //rowlayout
                    } //CTabView

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("You can adjust the width of your block buttons with grid column width classes. For example, for a half-width “block button”, use .col-6. Center it horizontally with .mx-auto, too.")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true
                        ColumnLayout {

                            HorizontalSpacer{}
                            Repeater {
                                model: 2
                                delegate: CButton {
                                    text: qsTr("Button")
                                    font.pixelSize: 20
                                    palette: BrandPrimary{}
                                    Layout.preferredWidth: 600
                                    Layout.alignment: Qt.AlignCenter
                                } //delegate
                            } //repeater
                        } //rowlayout
                    } //CTabView

                    CLabel {
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        text: qsTr("Additional utilities can be used to adjust the alignment of buttons when horizontal. Here we’ve taken our previous responsive example and added some flex utilities and a margin utility on the button to right align the buttons when they’re no longer stacked.")
                        Layout.fillWidth: true
                    }

                    CTabView {
                        Layout.fillWidth: true
                        RowLayout {
                            spacing: 20
                            HorizontalSpacer{}
                            Repeater {
                                model: 2
                                delegate: CButton {
                                    text: qsTr("Button")
                                    font.pixelSize: 20
                                    palette: BrandPrimary{}
                                    Layout.alignment: Qt.AlignCenter | Qt.AlignRight
                                } //delegate
                            } //repeater
                        } //rowlayout
                    } //CTabView

                } //ColumnLayout
            } //buttons sizes card
        } //GridLayout end
    }
}
