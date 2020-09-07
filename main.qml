import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Window 2.0
import QtMultimedia 5.0
import Button 1.0
Window {
    visible: true
    width: 1028
    height: 640
    color: button.night_mode===false? "white":"black"




    CurrentEngineTotal {
        visible: button.counter_qml === 1 && button.night_mode === false
    }
    EngineSpeed {
        visible: button.counter_qml === 2 && button.night_mode === false
    }
    FiveGauge {
        visible: button.counter_qml === 3 && button.night_mode === false
    }
    FourGauge {
        visible: button.counter_qml === 4 && button.night_mode === false
    }
    Gauge {
        visible: button.counter_qml === 5 && button.night_mode === false
    }
    MainMenu {
        visible: button.counter_qml === 6 && button.night_mode === false
    }
    Parameter {
        visible: button.counter_qml === 7 && button.night_mode === false
    }
    Error{
        x: 184
        y: 140
        z: 1
        visible: Modbus.q_errVisible && button.night_mode === false ;

    }

    CurrentEngineTotal {
        night_mode: true
        visible: button.counter_qml === 1 && button.night_mode === true
    }
    EngineSpeed {
        night_mode: true
        visible: button.counter_qml === 2 && button.night_mode === true
    }
    FiveGauge {
        night_mode: true
        visible: button.counter_qml === 3 && button.night_mode === true
    }
    FourGauge {
        night_mode: true
        visible: button.counter_qml === 4 && button.night_mode === true
    }
    Gauge {
        night_mode: true
        visible: button.counter_qml === 5 && button.night_mode === true
    }
    MainMenu {
        night_mode: true
        visible: button.counter_qml === 6 && button.night_mode === true
    }
    Parameter {
        night_mode: true
        visible: button.counter_qml === 7 && button.night_mode === true
    }
    Error{
        night_mode: true
        x: 184
        y: 140
        z: 1
        visible: Modbus.q_errVisible && button.night_mode === true ;

    }




}
