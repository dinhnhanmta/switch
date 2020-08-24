import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
import QtMultimedia 5.0

Window {
    visible: true
    width: 1028
    height: 640
    color: button.night_mode===false? "white":"#808080"


    CurrentEngineTotal {
        visible: button.counter_qml === 1
    }
    EngineSpeed {
        visible: button.counter_qml === 2
    }
    FiveGauge {
        visible: button.counter_qml === 3
    }
    FourGauge {
        visible: button.counter_qml === 4
    }
    Gauge {
        visible: button.counter_qml === 5
    }
    MainMenu {
        visible: button.counter_qml === 6
    }
    Parameter {
        visible: button.counter_qml === 7
    }
    Error{
        x: 184
        y: 140
        z: 1
         visible: Modbus.q_errVisible;

    }




}
