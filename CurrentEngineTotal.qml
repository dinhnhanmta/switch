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
    property bool night_mode: false
    Text {
        x: 64
        y: 53
        color: night_mode===true? "white":"black"
        text: "Trip Engine Hours:"
        fontSizeMode: Text.HorizontalFit
        font.family: "Helvetica"
        font.pointSize: 22
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_tripEngineHour
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 22
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Hours"
            font.family: "Tahoma"
            font.pointSize: 22
        }
    }

    Text {
        x: 196
        y: -21
        width: 432
        height: 54
        color: night_mode===true? "white":"black"
        text: "Current Engine Totals"
        font.bold: true
        font.family: "Helvetica"
        font.pointSize: 36
    }

    Text {
        x: 65
        y: 87
        color: night_mode===true? "white":"black"
        text: "Trip Idle Hours:"
        font.family: "Helvetica"
        font.pointSize: 22
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_tripIdleHour
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 22
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Hours"
            font.family: "Tahoma"
            font.pointSize: 22
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 121
        color: night_mode===true? "white":"black"
        text: "Trip Fuel:"
        font.family: "Helvetica"
        font.pointSize: 22
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_tripFuel
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 22
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Liters"
            font.family: "Tahoma"
            font.pointSize: 22
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 155
        color: night_mode===true? "white":"black"
        text: "Trip Idle Fuel:"
        font.family: "Helvetica"
        font.pointSize: 22
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_tripIdleFuel
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 22
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Liters"
            font.family: "Tahoma"
            font.pointSize: 22
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 189
        color: night_mode===true? "white":"black"
        text: "Avg. Load Factor:"
        font.family: "Helvetica"
        font.pointSize: 22
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_avgLoadFactor1
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 22
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "%"
            font.family: "Tahoma"
            font.pointSize: 22
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 223
        color: night_mode===true? "white":"black"
        text: "Avg. Fuel Consumption:"
        font.family: "Helvetica"
        font.pointSize: 22
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_avgFuelConsumption1
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 22
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "L/Hr"
            font.family: "Tahoma"
            font.pointSize: 22
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 64
        y: 279
        color: night_mode===true? "white":"black"
        text: "Lifetime Engine Hours:"
        font.family: "Helvetica"
        font.pointSize: 22
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeEngineHour
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 22
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Hours"
            font.family: "Tahoma"
            font.pointSize: 22
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 313
        color: night_mode===true? "white":"black"
        text: "Lifetime Idle Hours:"
        font.pointSize: 22
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeIdleHour
            horizontalAlignment: Text.AlignRight
            font.pointSize: 22
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Hours"
            font.pointSize: 22
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 64
        y: 347
        color: night_mode===true? "white":"black"
        text: "Lifetime Fuel:"
        font.pointSize: 22
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeFuel
            horizontalAlignment: Text.AlignRight
            font.pointSize: 22
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Liters"
            font.pointSize: 22
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 381
        color: night_mode===true? "white":"black"
        text: "Lifetime Idle Fuel:"
        font.pointSize: 22
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeIdleFuel
            horizontalAlignment: Text.AlignRight
            font.pointSize: 22
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "Liters"
            font.pointSize: 22
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 415
        color: night_mode===true? "white":"black"
        text: "Avg. Load Factor:"
        font.pointSize: 22
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_avgLoadFactor2
            horizontalAlignment: Text.AlignRight
            font.pointSize: 22
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: night_mode===true? "white":"black"
            text: "%"
            font.pointSize: 22
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 449
        color: night_mode===true? "white":"black"
        text: "Avg. Fuel Consumption:"
        font.pointSize: 22
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: night_mode===true? "white":"black"
            text: Modbus.q_avgFuelConsumption2
            horizontalAlignment: Text.AlignRight
            font.pointSize: 22
            font.family: "Tahoma"
        }

        Text {
            x: 641
            y: 0
            color: night_mode===true? "white":"black"
            text: "L/Hr"
            font.pointSize: 22
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 237
        y: 501
        width: 335
        height: 35
        color: night_mode===true? "white":"black"
        text: "Depress → and ← to Clear Trip"
        font.family: "Helvetica"
        font.pointSize: 22
        fontSizeMode: Text.HorizontalFit
    }


}


