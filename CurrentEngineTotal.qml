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
        x: 65
        y: 89
        color: button.night_mode===true? "white":"black"
        text: "Trip Engine Hours:"
        fontSizeMode: Text.HorizontalFit
        font.family: "Helvetica"
        font.pointSize: 18
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_tripEngineHour
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 18
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Hours"
            font.family: "Tahoma"
            font.pointSize: 18
        }
    }

    Text {
        x: 195
        y: 8
        width: 432
        height: 54
        color: button.night_mode===true? "white":"black"
        text: "Current Engine Totals"
        font.family: "Helvetica"
        font.pointSize: 34
    }

    Text {
        x: 65
        y: 113
        color: button.night_mode===true? "white":"black"
        text: "Trip Idle Hours:"
        font.family: "Helvetica"
        font.pointSize: 18
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_tripIdleHour
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 18
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Hours"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 138
        color: button.night_mode===true? "white":"black"
        text: "Trip Fuel:"
        font.family: "Helvetica"
        font.pointSize: 18
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_tripFuel
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 18
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Liters"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 163
        color: button.night_mode===true? "white":"black"
        text: "Trip Idle Fuel:"
        font.family: "Helvetica"
        font.pointSize: 18
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_tripIdleFuel
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 18
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Liters"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 189
        color: button.night_mode===true? "white":"black"
        text: "Avg. Load Factor:"
        font.family: "Helvetica"
        font.pointSize: 18
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_avgLoadFactor1
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 18
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "%"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 215
        color: button.night_mode===true? "white":"black"
        text: "Avg. Fuel Consumption:"
        font.family: "Helvetica"
        font.pointSize: 18
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_avgFuelConsumption1
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 18
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "L/Hr"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 256
        color: button.night_mode===true? "white":"black"
        text: "Lifetime Engine Hours:"
        font.family: "Helvetica"
        font.pointSize: 18
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeEngineHour
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 18
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Hours"
            font.family: "Tahoma"
            font.pointSize: 18
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 282
        color: button.night_mode===true? "white":"black"
        text: "Lifetime Idle Hours:"
        font.pointSize: 18
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeIdleHour
            horizontalAlignment: Text.AlignRight
            font.pointSize: 18
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Hours"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 309
        color: button.night_mode===true? "white":"black"
        text: "Lifetime Fuel:"
        font.pointSize: 18
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeFuel
            horizontalAlignment: Text.AlignRight
            font.pointSize: 18
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Liters"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 337
        color: button.night_mode===true? "white":"black"
        text: "Lifetime Idle Fuel:"
        font.pointSize: 18
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_lifeTimeIdleFuel
            horizontalAlignment: Text.AlignRight
            font.pointSize: 18
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "Liters"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 364
        color: button.night_mode===true? "white":"black"
        text: "Avg. Load Factor:"
        font.pointSize: 18
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_avgLoadFactor2
            horizontalAlignment: Text.AlignRight
            font.pointSize: 18
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "%"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 65
        y: 391
        color: button.night_mode===true? "white":"black"
        text: "Avg. Fuel Consumption:"
        font.pointSize: 18
        font.family: "Helvetica"
        Text {
            x: 431
            y: -3
            width: 178
            height: 28
            color: button.night_mode===true? "white":"black"
            text: Modbus.q_avgFuelConsumption2
            horizontalAlignment: Text.AlignRight
            font.pointSize: 18
            font.family: "Tahoma"
        }

        Text {
            x: 639
            y: -4
            color: button.night_mode===true? "white":"black"
            text: "L/Hr"
            font.pointSize: 18
            font.family: "Tahoma"
        }
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        x: 244
        y: 444
        color: button.night_mode===true? "white":"black"
        text: "Depress → and ← to Clear Trip"
        font.family: "Helvetica"
        font.pointSize: 18
        fontSizeMode: Text.HorizontalFit
    }


}


