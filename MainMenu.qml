import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    x: 110
    y: 40
    width: 1000
    height: 600
    scale: 1

    Text {
        x: 31
        y: 108
        color: button.night_mode===true? "white":"black"
        text: "SYSTEM INFORMATION"
        z: 1
        font.family: "Helvetica"
        font.pointSize: 34
    }

    Text {
        x: 31
        y: 165
        color: button.night_mode===true? "white":"black"
        text: "User Name:"
        font.family: "Helvetica"
        font.pointSize: 18

        Text {
            x: 358
            y: 0
            color: button.night_mode===true? "white":"black"
            text: "USER000002 (2)"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 29
        y: 199
        color: button.night_mode===true? "white":"black"
        text: "Software Version:"
        font.family: "Helvetica"
        font.pointSize: 18

        Text {
            x: 358
            y: 0
            width: 161
            height: 29
            color: button.night_mode===true? "white":"black"
            text: "244-1029-00"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 29
        y: 233
        color: button.night_mode===true? "white":"black"
        text: "RBL Verson:"
        font.family: "Helvetica"
        font.pointSize: 18

        Text {
            x: 358
            y: 0
            width: 70
            height: 29
            color: button.night_mode===true? "white":"black"
            text: "01.06"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 29
        y: 267
        color: button.night_mode===true? "white":"black"
        text: "Serial Number:"
        font.family: "Helvetica"
        font.pointSize: 18

        Text {
            x: 358
            y: 0
            color: button.night_mode===true? "white":"black"
            text: "0765G026MP"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 29
        y: 301
        color: button.night_mode===true? "white":"black"
        text: "Unit Location:"
        font.pointSize: 18
        font.family: "Helvetica"

        Text {
            x: 358
            y: 0
            color: button.night_mode===true? "white":"black"
            text: "Bridge"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 31
        y: 335
        color: button.night_mode===true? "white":"black"
        text: "Engine Location:"
        font.pointSize: 18
        font.family: "Helvetica"

        Text {
            x: 358
            y: 0
            color: button.night_mode===true? "white":"black"
            text: "Port"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 29
        y: 369
        color: button.night_mode===true? "white":"black"
        text: "Display Units:"
        font.pointSize: 18
        font.family: "Helvetica"

        Text {
            x: 358
            y: 0
            color: button.night_mode===true? "white":"black"
            text: "Metric"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 29
        y: 403
        color: button.night_mode===true? "white":"black"
        text: "Vessel Spd Units:"
        font.pointSize: 18
        font.family: "Helvetica"

        Text {
            x: 358
            y: 0
            color: button.night_mode===true? "white":"black"
            text: "KPH"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 29
        y: 437
        color: button.night_mode===true? "white":"black"
        text: "Language:"
        font.pointSize: 18
        font.family: "Helvetica"

        Text {
            x: 358
            y: 0
            color: button.night_mode===true? "white":"black"
            text: "English"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }


    Text {
        x: 220
        y: 23
        color: button.night_mode===true? "white":"black"
        text: "Marine\nPower\nDisplay"
        z: 1
        font.pointSize: 18
        font.family: "Tahoma"
    }
    Rectangle {
    width: 115
    height: 139
        x:655
        y:0
        color: "white"
        border.color: button.night_mode===true? "white":"black"
    border.width: 3

    Text {
        x: 32
        y: 55
        color: button.night_mode===true? "white":"black"
        text: "Menu"
        font.pointSize: 18
        font.family: "Tahoma"
    }
    }


    Image {
        x: 31
        y: 14
        width: 174
        height: 96
        z: -1
      source: "dentrang.jpg"

    }



}


