import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4

Item {
    x: 110
    y: 70
    width: 800
    height: 480
    scale: 1
    property bool night_mode: false
    z: 1

Rectangle
{
    width: 640
    height: 384
    color: night_mode? "black":"white"
    border.color: night_mode? "white":"black"
    border.width: 3
    Text {
        id: diagnostic_text
        x: 77
        y: 31
        text: "DIAGNOSTIC CODE"
        anchors.horizontalCenterOffset: 0
        fontSizeMode: Text.HorizontalFit
        scale: 1
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Times New Roman"
        font.pointSize: 24
        color: night_mode? "white":"black"
    }

    Text {
        x: 77
        y: 80
        color: night_mode? "white":"black"
        text: "SOURCE:"
        fontSizeMode: Text.HorizontalFit
        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"

        Text {
            x: 205
            y: 0
            color: night_mode? "white":"black"
            text: Modbus.q_errSource
            fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"
        }

    }
    Text {
        y: 117
        text: Modbus.q_errSource===1? "PORT":"STARPOARD"
        anchors.horizontalCenterOffset: 0
        fontSizeMode: Text.HorizontalFit
        font.pointSize: 24
        anchors.horizontalCenter: diagnostic_text.horizontalCenter
        scale: 1
        font.family: "Times New Roman"
    }

    Text {
        x: 77
        y: 154
        color: night_mode? "white":"black"
        text: "SPN: "
        fontSizeMode: Text.HorizontalFit
        Text {
            x: 204
            y: 0
            color: night_mode? "white":"black"
            text: Modbus.q_errSPNCode
            fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"

        }


        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"
    }
    Text {
        y: 188
        width: 570
        height: 79
        color: night_mode? "white":"black"
        text: Modbus.q_errSPN
        anchors.horizontalCenterOffset: 10
        //fontSizeMode: Text.HorizontalFit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"
         wrapMode: Text.Wrap
    }

    Text {
        x: 77
        y: 264
        color: night_mode? "white":"black"
        text: "FMI:"
        fontSizeMode: Text.HorizontalFit
        Text {
            x: 204
            y: 0
            color: night_mode? "white":"black"
            text: Modbus.q_errFMICode
            fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"
        }


        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"
    }
    Text {
        y: 298
        width: 570
        height: 79
        color: night_mode? "white":"black"
        text: Modbus.q_errFMI
        anchors.horizontalCenterOffset: 10
        //fontSizeMode: Text.HorizontalFit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"
          wrapMode: Text.Wrap
    }

}
}


