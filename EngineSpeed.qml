import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{
    property var name: 33

    x: 110
    y: 70
    width: 1000
    height: 600
    scale: 1.25
    Text {
        x: 32
        y: 8
        text: "ENGINE SPEED"
        fontSizeMode: Text.HorizontalFit
        scale: 1
        font.family: "Times New Roman"
        font.pointSize: 28
        color: button.night_mode===true? "white":"#808080"
        Text {
            x: -97
            y: 23
            width: 378
            height: 120
            text: Modbus.q_engineSpeed
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 90
            color: button.night_mode===true? "white":"#808080"
        }
        Text {
            x: 295
            y: 94
            text: "RPM"
            font.family: "Tahoma"
            font.pointSize: 28
            color: button.night_mode===true? "white":"#808080"
        }

    }

    Text {
        x: 623
        y: 396
        color: button.night_mode===true? "white":"#808080"
        text: "Engine Hours"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -23
            y: 30
            width: 155
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_engineHours
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }
    }

    Text {
        x: 45
        y: 181
        color: button.night_mode===true? "white":"#808080"
        text: "Oil Pres"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -12
            y: 33
            width: 160
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_oilPress
            horizontalAlignment: Text.AlignRight
            font.pointSize: 35
            font.family: "Tahoma"
        }

        Text {
            x: 162
            y: 49
            color: button.night_mode===true? "white":"#808080"
            text: "KPA"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 50
        y: 290
        color: button.night_mode===true? "white":"#808080"
        text: "Boost Pres"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -13
            y: 34
            width: 156
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_boostPres
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 160
            y: 48
            color: button.night_mode===true? "white":"#808080"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 50
        y: 396
        color: button.night_mode===true? "white":"#808080"
        text: "Fuel Rate"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -13
            y: 30
            width: 153
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_fuelRate
            horizontalAlignment: Text.AlignRight
            font.pointSize: 35
            font.family: "Tahoma"
        }

        Text {
            x: 161
            y: 44
            color: button.night_mode===true? "white":"#808080"
            text: "LPH"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 326
        y: 181
        color: button.night_mode===true? "white":"#808080"
        text: "Coolant Temp"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_coolantTemp
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 130
            y: 44
            color: button.night_mode===true? "white":"#808080"
            text: "DEG C"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 326
        y: 290
        color: button.night_mode===true? "white":"#808080"
        text: "Fuel Pres"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_fuelPres
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 129
            y: 50
            color: button.night_mode===true? "white":"#808080"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 332
        y: 396
        color: button.night_mode===true? "white":"#808080"
        text: "Battery"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_battery
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 126
            y: 44
            color: button.night_mode===true? "white":"#808080"
            text: "VOLTS"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }


}

