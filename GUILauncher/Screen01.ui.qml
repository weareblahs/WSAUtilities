import QtQuick
import QtQuick.Controls
import GUILauncher 1.0

Rectangle {
    width: Constants.width
    height: Constants.height
    gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop {
            position: 0
            color: "#232323"
        }

        GradientStop {
            position: 1
            color: "#000000"
        }
    }

    Text {
        id: text1
        x: 0
        y: 60
        width: 960
        height: 72
        color: "#ffffff"
        text: qsTr("Welcome to WSAUtilities.")
        font.pixelSize: 54
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text2
        x: 0
        y: 138
        width: 960
        height: 63
        color: "#ffffff"
        text: qsTr("Select what you want to do:")
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
    }

    Button {
        id: button
        x: 132
        y: 234
        width: 696
        height: 48
        text: qsTr("Install Windows Subsystem for Android")
        font.pointSize: 16
        font.capitalization: Font.MixedCase
    }

    Button {
        id: button1
        x: 132
        y: 296
        width: 696
        height: 48
        text: qsTr("Install Windows Subsystem for Android (through mirror)")
        font.capitalization: Font.MixedCase
        font.pointSize: 16
    }

    Button {
        id: button2
        x: 132
        y: 362
        width: 345
        height: 48
        text: qsTr("Install APK files")
        font.capitalization: Font.MixedCase
        font.pointSize: 16
    }

    Button {
        id: button3
        x: 492
        y: 362
        width: 336
        height: 48
        text: qsTr("Install XAPK Files")
        font.capitalization: Font.MixedCase
        font.pointSize: 16
    }

    Button {
        id: button4
        x: 132
        y: 488
        width: 345
        height: 48
        text: qsTr("Install Aurora Store")
        font.capitalization: Font.MixedCase
        font.pointSize: 16
    }

    Button {
        id: button5
        x: 492
        y: 488
        width: 336
        height: 48
        text: qsTr("Install Microsoft Launcher")
        font.capitalization: Font.MixedCase
        font.pointSize: 16
    }

    Button {
        id: button6
        x: 132
        y: 424
        width: 696
        height: 48
        text: qsTr("Check for Windows Subsystem for Android updates")
        font.capitalization: Font.MixedCase
        font.pointSize: 16
    }

    Text {
        id: text3
        x: 0
        y: 610
        width: 960
        height: 30
        color: "#ffffff"
        text: qsTr("WSAUtilities GUI based on WSAUtilities v0.0.9 (en) made by weareblahs / Windows Subsystem of Android is a trademark of Microsoft Corporation")
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66;height:640;width:960}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}D{i:9}
D{i:10}D{i:11}D{i:12}D{i:13}
}
##^##*/
