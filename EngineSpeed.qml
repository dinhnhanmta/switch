import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{
    property var name: 33
    property bool night_mode: false
    x: 110
    y: 40
    width: 1000
    height: 600
    scale: 1
    Text {
        y: 4
        text: "ENGINE SPEED"
        anchors.horizontalCenterOffset: -128
        fontSizeMode: Text.HorizontalFit
        scale: 1
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Times New Roman"
        font.pointSize: 28
        color: night_mode===true? "white":"black"
        Text {
            x: -97
            y: 37
            width: 378
            height: 120
            text: Modbus.q_engineSpeed
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 90
            font.bold: true
            color: night_mode===true? "white":"black"
        }
        Text {
            x: 292
            y: 101
            text: "RPM"
            font.family: "Tahoma"
            font.pointSize: 28
            color: night_mode===true? "white":"black"
        }

    }

    Text {
        x: 623
        y: 396
        color: night_mode===true? "white":"black"
        text: "Engine Hours"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -23
            y: 30
            width: 155
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_engineHours
            horizontalAlignment: Text.AlignRight
            font.bold: true
            font.family: "Tahoma"
            font.pointSize: 35
        }
    }

    Text {
        x: 45
        y: 181
        color: night_mode===true? "white":"black"
        text: "Oil Pres"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -12
            y: 33
            width: 160
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_oilPress
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 45
            font.family: "Tahoma"
        }

        Text {
            x: 162
            y: 55
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 50
        y: 290
        color: night_mode===true? "white":"black"
        text: "Boost Pres"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -13
            y: 34
            width: 156
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_boostPres
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 45
        }

        Text {
            x: 158
            y: 68
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 50
        y: 396
        color: night_mode===true? "white":"black"
        text: "Fuel Rate"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -13
            y: 30
            width: 153
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_fuelRate
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 45
            font.family: "Tahoma"
        }

        Text {
            x: 158
            y: 62
            color: night_mode===true? "white":"black"
            text: "LPH"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 326
        y: 181
        color: night_mode===true? "white":"black"
        text: "Coolant Temp"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_coolantTemp
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 45
        }

        Text {
            x: 143
            y: 58
            color: night_mode===true? "white":"black"
            text: "DEG C"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 326
        y: 290
        color: night_mode===true? "white":"black"
        text: "Fuel Pres"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_fuelPres
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 45
        }

        Text {
            x: 144
            y: 62
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 332
        y: 396
        color: night_mode===true? "white":"black"
        text: "Battery"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_battery/100
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 45
        }

        Text {
            x: 139
            y: 61
            color: night_mode===true? "white":"black"
            text: "VOLTS"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }


}

