import QtQuick 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import "Components"

Pane {
    id: root

    height: config.ScreenHeight || Screen.height
    width: config.ScreenWidth || Screen.width

    LayoutMirroring.enabled: config.ForceRightToLeft === "true" || Qt.application.layoutDirection === Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    padding: config.ScreenPadding
    palette.button: "transparent"
    palette.highlight: config.AccentColor
    palette.text: config.MainColor
    palette.buttonText: config.MainColor
    palette.window: config.BackgroundColor

    font.family: config.Font
    font.pointSize: config.FontSize !== "" ? config.FontSize : parseInt(height / 80)
    focus: true

    Item {
        id: sizeHelper
        anchors.fill: parent

        LoginForm {
            id: form
            height: parent.height
            width: parent.width / 2.5

            anchors {
                horizontalCenter: config.FormPosition === "center" ? parent.horizontalCenter : undefined
                left: config.FormPosition === "left" ? parent.left : undefined
                right: config.FormPosition === "right" ? parent.right : undefined
            }

            virtualKeyboardActive: virtualKeyboard.state === "visible"
            z: 1
        }

        Image {
            id: backgroundImage

            height: parent.height
            width: (config.HaveFormBackground === "true" &&
                    config.FormPosition !== "center" &&
                    config.PartialBlur !== "true")
                    ? parent.width - form.width
                    : parent.width

            anchors {
                left: (config.HaveFormBackground === "true" &&
                       config.PartialBlur === "false" &&
                       config.FormPosition === "left") ? form.right : undefined

                right: (config.HaveFormBackground === "true" &&
                        config.PartialBlur === "false" &&
                        config.FormPosition === "right") ? form.left : undefined
            }

            horizontalAlignment: config.BackgroundImageHAlignment === "left" ? Image.AlignLeft
                                 : config.BackgroundImageHAlignment === "right" ? Image.AlignRight
                                 : Image.AlignHCenter

            verticalAlignment: config.BackgroundImageVAlignment === "top" ? Image.AlignTop
                               : config.BackgroundImageVAlignment === "bottom" ? Image.AlignBottom
                               : Image.AlignVCenter

            source: config.background || config.Background
            fillMode: config.ScaleImageCropped === "true" ? Image.PreserveAspectCrop : Image.PreserveAspectFit
            asynchronous: true
            cache: true
            clip: true
            mipmap: true
        }

        MouseArea {
            anchors.fill: backgroundImage
            onClicked: parent.forceActiveFocus()
        }
    }
}
