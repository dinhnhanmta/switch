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
    scale: 1.25
Rectangle
{
    width: 640
    height: 384
    color: "white"
    border.color: "black"
    border.width: 3
    Text {
        x: 77
        y: 8
        text: "DIAGNOSTIC CODE"
        fontSizeMode: Text.HorizontalFit
        scale: 1
        font.family: "Times New Roman"
        font.pointSize: 24
        color: button.night_mode===true? "white":"#808080"
    }

    Text {
        x: 77
        y: 55
        color: button.night_mode===true? "white":"#808080"
        text: "SOURCE:"
        fontSizeMode: Text.HorizontalFit
        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"

        Text {
            x: 148
            y: 0
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_errSource
            fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"
        }
        Text {
            x: 37
            y: 37
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_errSource===0? "PORT":"STARPOARD"
            fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"
        }
    }

    Text {
        x: 77
        y: 130
        color: button.night_mode===true? "white":"#808080"
        text: "SPN: "
        fontSizeMode: Text.HorizontalFit
        Text {
            x: 148
            y: 0
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_errSPNCode
            fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"

        }

        Text {
            x: 36
            y: 34
            width: 521
            height: 79
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_errSPN
            //fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"
             wrapMode: Text.Wrap
        }
        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"
    }

    Text {
        x: 77
        y: 242
        color: button.night_mode===true? "white":"#808080"
        text: "FMI:"
        fontSizeMode: Text.HorizontalFit
        Text {
            x: 148
            y: 0
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_errFMICode
            fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"
        }

        Text {
            x: 32
            y: 36
            width: 523
            height: 88
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_errFMI
            //fontSizeMode: Text.HorizontalFit
            font.pointSize: 24
            scale: 1
            font.family: "Times New Roman"
              wrapMode: Text.Wrap
        }
        font.pointSize: 24
        scale: 1
        font.family: "Times New Roman"
    }

}
}


