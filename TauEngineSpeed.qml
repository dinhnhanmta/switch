import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    width: 800
    height: 480


    Text {
        x: 71
        y: 8
        text: "ENGINE SPEED"
        fontSizeMode: Text.HorizontalFit
        scale: 1
        font.family: "Times New Roman"
        font.pointSize: 28
        color: "#808080"
        Text {
            x: 115
            y: 31
            width: 378
            height: 120
            text: "1234"
            horizontalAlignment: Text.AlignHCenter
            font.family: "Tahoma"
            font.pointSize: 90
            color: "#808080"
        }
        Text {
            x: 477
            y: 100
            text: "RPM"
            font.family: "Tahoma"
            font.pointSize: 28
            color: "#808080"
        }

    }

    Text {
        x: 596
        y: 396
        color: "#808080"
        text: "Engine Hours"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -23
            y: 30
            width: 155
            height: 56
            color: "#808080"
            text: "1356"
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }
    }

    Text {
        x: 45
        y: 181
        color: "#808080"
        text: "Oil Pres"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -12
            y: 33
            width: 160
            height: 56
            color: "#808080"
            text: "100"
            horizontalAlignment: Text.AlignRight
            font.pointSize: 35
            font.family: "Tahoma"
        }

        Text {
            x: 162
            y: 49
            color: "#808080"
            text: "KPA"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 50
        y: 290
        color: "#808080"
        text: "Boost Pres"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: -13
            y: 34
            width: 156
            height: 56
            color: "#808080"
            text: "0"
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 160
            y: 48
            color: "#808080"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 50
        y: 396
        color: "#808080"
        text: "Fuel Rate"
        font.pointSize: 19
        font.family: "Helvetica"
        Text {
            x: -13
            y: 30
            width: 153
            height: 56
            color: "#808080"
            text: "0"
            horizontalAlignment: Text.AlignRight
            font.pointSize: 35
            font.family: "Tahoma"
        }

        Text {
            x: 161
            y: 44
            color: "#808080"
            text: "LPH"
            font.pointSize: 17
            font.family: "Tahoma"
        }
    }

    Text {
        x: 326
        y: 181
        color: "#808080"
        text: "Coolant Temp"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: "#808080"
            text: "0"
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 130
            y: 44
            color: "#808080"
            text: "DEG C"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 326
        y: 290
        color: "#808080"
        text: "Fuel Pres"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: "#808080"
            text: "0"
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 129
            y: 50
            color: "#808080"
            text: "KPA"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 332
        y: 396
        color: "#808080"
        text: "Battery"
        font.family: "Helvetica"
        font.pointSize: 19
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: "#808080"
            text: "0"
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
        }

        Text {
            x: 126
            y: 44
            color: "#808080"
            text: "VOLTS"
            font.family: "Tahoma"
            font.pointSize: 17
        }
    }

    Text {
        x: 595
        y: 181
        color: "#808080"
        text: "Manifold Temp"
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: "#808080"
            text: "0"
            font.pointSize: 35
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
        }

        Text {
            x: 130
            y: 44
            color: "#808080"
            text: "DEG C"
            font.pointSize: 17
            font.family: "Tahoma"
        }
        font.pointSize: 19
        font.family: "Helvetica"
    }

    Text {
        x: 595
        y: 290
        color: "#808080"
        text: "Oil Temp"
        Text {
            x: 0
            y: 30
            width: 111
            height: 56
            color: "#808080"
            text: "0"
            font.pointSize: 35
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
        }

        Text {
            x: 130
            y: 44
            color: "#808080"
            text: "DEG C"
            font.pointSize: 17
            font.family: "Tahoma"
        }
        font.pointSize: 19
        font.family: "Helvetica"
    }


}


