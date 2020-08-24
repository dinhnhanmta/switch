import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    x: 120
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
        x: 8
        y: 181
        color: button.night_mode===true? "white":"#808080"
        text: "Left Air Inlet"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 24
            y: 30
            width: 139
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_leftAirInlet
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 169
            y: 44
            color: button.night_mode===true? "white":"#808080"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 331
        y: 181
        color: button.night_mode===true? "white":"#808080"
        text: "L Turbo Inlet"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -12
            y: 33
            width: 160
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_lTurboInlet
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
        x: 336
        y: 290
        color: button.night_mode===true? "white":"#808080"
        text: "R Turbo Inlet"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -13
            y: 34
            width: 156
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_rTurboInlet
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
        x: 336
        y: 396
        color: button.night_mode===true? "white":"#808080"
        text: "Fuel Driff Inlet"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -13
            y: 30
            width: 153
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_fuelDriffInlet
            horizontalAlignment: Text.AlignRight
            font.pointSize: 35
            font.family: "Tahoma"
        }

        Text {
            x: 161
            y: 44
            color: button.night_mode===true? "white":"#808080"
            text: "KPA"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 591
        y: 181
        color: button.night_mode===true? "white":"#808080"
        text: "Exh Temp L"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_exhTempL
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
        x: 591
        y: 290
        color: button.night_mode===true? "white":"#808080"
        text: "Exh Temp R"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_exhTempR
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 129
            y: 50
            color: button.night_mode===true? "white":"#808080"
            text: "DEG C"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 597
        y: 396
        color: button.night_mode===true? "white":"#808080"
        text: "Oil Driff Inlet"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: button.night_mode===true? "white":"#808080"
            text: Modbus.q_oilDriffInlet
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 131
            y: 42
            color: button.night_mode===true? "white":"#808080"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }


}


