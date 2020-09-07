import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    x: 120
    y: 40
    width: 1000
    height: 600
    scale: 1
    property bool night_mode: false
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0
        text: "ENGINE SPEED"
        anchors.horizontalCenterOffset: -99
        fontSizeMode: Text.HorizontalFit
        scale: 1
        font.family: "Times New Roman"
        font.pointSize: 28
        color: night_mode===true? "white":"black"
        Text {
            x: -76
            y: 41
            width: 378
            height: 120
            text: Modbus.q_engineSpeed
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 90
            color: night_mode===true? "white":"black"
        }
        Text {
            x: 339
            y: 106
            text: "RPM"
            font.family: "Tahoma"
            font.pointSize: 28
            color: night_mode===true? "white":"black"
        }

    }

    Text {
        x: 8
        y: 181
        color: night_mode===true? "white":"black"
        text: "Left Air Inlet"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 24
            y: 30
            width: 139
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_leftAirInlet
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 169
            y: 49
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 331
        y: 181
        color: night_mode===true? "white":"black"
        text: "L Turbo Inlet"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -12
            y: 33
            width: 160
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_lTurboInlet
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 35
            font.family: "Tahoma"
        }

        Text {
            x: 162
            y: 52
            height: 34
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 336
        y: 290
        color: night_mode===true? "white":"black"
        text: "R Turbo Inlet"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -13
            y: 34
            width: 156
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_rTurboInlet
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 160
            y: 56
            height: 29
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 336
        y: 396
        color: night_mode===true? "white":"black"
        text: "Fuel Driff Inlet"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -13
            y: 30
            width: 153
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_fuelDriffInlet
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.pointSize: 35
            font.family: "Tahoma"
        }

        Text {
            x: 161
            y: 50
            width: 43.2
            height: 29
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 591
        y: 181
        color: night_mode===true? "white":"black"
        text: "Exh Temp L"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_exhTempL
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 130
            y: 52
            color: night_mode===true? "white":"black"
            text: "DEG C"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 591
        y: 290
        color: night_mode===true? "white":"black"
        text: "Exh Temp R"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 34
            width: 111
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_exhTempR
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 129
            y: 58
            color: night_mode===true? "white":"black"
            text: "DEG C"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 597
        y: 396
        color: night_mode===true? "white":"black"
        text: "Oil Driff Inlet"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: night_mode===true? "white":"black"
            text: Modbus.q_oilDriffInlet
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 131
            y: 50
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }


}


