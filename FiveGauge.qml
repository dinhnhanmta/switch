import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    x: 110
    y: 40
    width: 1024
    height: 600
    scale: 1
    property bool night_mode: false
    Text {
        x: 247
        y: 8
        text: "ENGINE SPEED"
        fontSizeMode: Text.HorizontalFit
        scale: 1
        font.family: "Times New Roman"
        font.pointSize: 28
        color: night_mode===true? "white":"black"
        Text {
            x: -41
            y: 17
            width: 320
            height: 129
            text:Modbus.q_engineSpeed
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.bottom
            anchors.topMargin: 10
            font.family: "Tahoma"
            font.pointSize: 90
            color: night_mode===true? "white":"black"
        }
        Text {
            x: 281
            y: 89
            text: "RPM"
            font.family: "Tahoma"
            font.pointSize: 28
            color: night_mode===true? "white":"black"
        }

    }

    Text {
        x: 319
        y: 394
        text: "Battery"
        font.family: "Helvetica"
        font.pointSize: 19
        color: night_mode===true? "white":"black"
        Text {
            x: -139
            y: 30
            width: 186
            height: 56
            text: Modbus.q_battery/100
            font.bold: true
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
            color: night_mode===true? "white":"black"
        }
        Text {
            x: 59
            y: 44
            text: "VOLTS"
            font.family: "Tahoma"
            font.pointSize: 17
            color: night_mode===true? "white":"black"
        }

    }

    CircularGauge {
    id: oilpress_gauge
    x: -103
    y: 192
    width: 480
    height: 420
    scale: 0.4
    z: 1
    value: Modbus.q_oilPress
    visible: true
    rotation: 0
    style: CircularGaugeStyle {
        function degreesToRadians(degrees) {
                       return degrees * (Math.PI / 180);
                   }
         background: Canvas {
                       onPaint: {
                           var ctx = getContext("2d");
                           ctx.reset();

                           ctx.beginPath();
                           ctx.strokeStyle = night_mode===true? "white":"black";
                           ctx.lineWidth = outerRadius * 0.05;

                           ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                               degreesToRadians(valueToAngle(0) - 90), degreesToRadians(valueToAngle(700) - 90));
                           ctx.moveTo(outerRadius,outerRadius);
                           ctx.lineTo(outerRadius-Math.sqrt(3)/2*outerRadius,1/2*outerRadius+outerRadius);
                            ctx.moveTo(outerRadius,outerRadius);
                           ctx.lineTo(outerRadius+Math.sqrt(3)/2*outerRadius,1/2*outerRadius+outerRadius);
                            ctx.stroke();
                       }
                   }
        needle: Rectangle {
            y: outerRadius * 0.03
            implicitWidth: outerRadius * 0.03
            implicitHeight: outerRadius * 0.9
            antialiasing: true
            color:  night_mode===true? "white":"black"
        }
        tickmark: Rectangle {
                        visible: styleData.value === 613||  styleData.value === 350||  styleData.value === 88||  styleData.value === 219|| styleData.value === 481
                        implicitWidth: outerRadius * 0.03
                        antialiasing: true
                        implicitHeight: outerRadius * 0.1
                        color:  night_mode===true? "white":"black"
                    }

        tickmarkStepSize : 1
        minorTickmark: Rectangle {
                        visible: styleData.value < 0
                        implicitWidth: outerRadius * 0.01
                        antialiasing: true
                        implicitHeight: outerRadius * 0.03
                        color: night_mode===true? "white":"black"
                    }
        tickmarkLabel:  Text {
            font.pixelSize: 28
            text: styleData.value
            color: night_mode===true? "white":"black"
            antialiasing: true
        }
        minimumValueAngle: -120
        maximumValueAngle: 120

        labelInset: -30
        labelStepSize : 350

    }
    maximumValue:700
    stepSize: 0.01

    Text {

                color: night_mode===true? "white":"black"
                text: "OIL PRESS"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                color: night_mode===true? "white":"black"
                text: "KPA"
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
        y: 309
                z: 1
                width: 298
                height: 93
                color: night_mode===true? "white":"black"
                text: oilpress_gauge.value
                font.bold: true
                anchors.horizontalCenterOffset: 5
                font.pointSize: 61
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
        }


    }

    CircularGauge {
    id: coolant_gauge
    x: -103
    y: 18
    width: 480
    height: 420
    scale: 0.4
    z: 1
    value: Modbus.q_coolantTemp
    visible: true
    rotation: 0
    style: CircularGaugeStyle {
        function degreesToRadians(degrees) {
                       return degrees * (Math.PI / 180);
                   }
         background: Canvas {
                       onPaint: {

                           var ctx = getContext("2d");
                           ctx.reset();

                           ctx.beginPath();
                           ctx.strokeStyle = night_mode===true? "white":"black";
                           ctx.lineWidth = outerRadius * 0.05;

                           ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                               degreesToRadians(valueToAngle(-20) - 90), degreesToRadians(valueToAngle(120) - 90));
                           ctx.moveTo(outerRadius,outerRadius);
                           ctx.lineTo(outerRadius-Math.sqrt(3)/2*outerRadius,1/2*outerRadius+outerRadius);
                            ctx.moveTo(outerRadius,outerRadius);
                           ctx.lineTo(outerRadius+Math.sqrt(3)/2*outerRadius,1/2*outerRadius+outerRadius);
                            ctx.stroke();
                       }
                   }
        needle: Rectangle {
            y: outerRadius * 0.03
            implicitWidth: outerRadius * 0.03
            implicitHeight: outerRadius * 0.9
            antialiasing: true
            color:  night_mode===true? "white":"black"
        }
        tickmark: Rectangle {
                        visible: styleData.value === 33 ||styleData.value === 52 ||styleData.value === 70 ||styleData.value === 108 ||styleData.value === 89
                        implicitWidth: outerRadius * 0.03
                        antialiasing: true
                        implicitHeight: outerRadius * 0.1
                        color:  night_mode===true? "white":"black"
                    }

        tickmarkStepSize : 1
        minorTickmark: Rectangle {
                        visible: styleData.value < 0
                        implicitWidth: outerRadius * 0.01
                        antialiasing: true
                        implicitHeight: outerRadius * 0.03
                        color: night_mode===true? "white":"black"
                    }
        tickmarkLabel:  Text {
            font.pixelSize: 28
            text: styleData.value
            color: night_mode===true? "white":"black"
            antialiasing: true
        }
        minimumValueAngle: -120
        maximumValueAngle: 120

        labelInset: -30
        labelStepSize : 70

    }
    maximumValue: 120
    minimumValue: -20
    stepSize: 1

    Text {

                color: night_mode===true? "white":"black"
                text: "COOLANT"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                color: night_mode===true? "white":"black"
                text: "DEG C"
                anchors.horizontalCenterOffset: 0
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 50
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
        y: 304
                z:1
                width: 235
                height: 92
                color: night_mode===true? "white":"black"
                text: coolant_gauge.value
                anchors.horizontalCenterOffset: 1
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 61
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }


    }

    Gauge {
        id: gauge
        height: 100
        scale: 1
        width: 100
        rotation: 0
        anchors.rightMargin: 434
        anchors.bottomMargin: 246
        anchors.leftMargin: 296
        anchors.topMargin: 187
        anchors.fill: parent
        anchors.margins: 10
        maximumValue: 350
        minimumValue: 0
        value: Modbus.q_boostPres
        minorTickmarkCount: 6
        tickmarkStepSize: 350
        orientation: Qt.Horizontal


        Behavior on value {
            NumberAnimation {
                duration: 1000
            }
        }

        style: GaugeStyle {
            background: Rectangle {

                border.color: night_mode===true? "white":"black"
                border.width: 5
            }
            valueBar: Rectangle {
                implicitWidth: 15
                color:night_mode===true? "white":"black"

            }


            tickmark: Item {
                id: tick
                implicitWidth: 5
                implicitHeight: 3

                Rectangle {

                    color: night_mode===true? "white":"black"
                    anchors.fill: parent

                }
            }
            minorTickmark: Item {
                implicitWidth: 5
                implicitHeight: 3

                Rectangle {
                    color: night_mode===true? "white":"black"
                    anchors.fill: parent

                }
            }
            tickmarkLabel: Text {
                color: night_mode===true? "white":"black"
                visible: styleData.value === 0 || styleData.value === 350
                font.pixelSize: 20
                text: styleData.value === 0 ? "0" : (styleData.value === 350 ? "350" : "")
                anchors.verticalCenter: parent.bottom
            }


        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: -27
            text: "Boost Pres"
            font.family: "Helvetica"
            font.pointSize: 16
            color: night_mode===true? "white":"black"}

        Text {
            x: 304
            y: -5
            width: 46
            height: 15
            color: night_mode===true? "white":"black"
            text: "KPA"
            font.family: "Helvetica"
            font.pointSize: 16
        }

    }

    Gauge {
        id: gauge1
        x: 3
        y: 0
        width: 100
        height: 100
        anchors.margins: 10
        value: Modbus.q_engineLoad
        tickmarkStepSize: 100
        orientation: Qt.Horizontal
        minorTickmarkCount: 6
        anchors.bottomMargin: 168
        rotation: 0
        anchors.topMargin: 265
        anchors.leftMargin: 296
        minimumValue: 0
        anchors.fill: parent
        style: GaugeStyle {
            tickmark: Item {
                id: tick1
                Rectangle {
                    color: night_mode===true? "white":"black"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            minorTickmark: Item {
                Rectangle {
                    color: night_mode===true? "white":"black"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            tickmarkLabel: Text {
                color: night_mode===true? "white":"black"
                text: styleData.value === 0 ? "0" : (styleData.value === 100 ? "100" : "")
                anchors.verticalCenter: parent.bottom
                visible: styleData.value === 0 || styleData.value === 100
                font.pixelSize: 20
            }
            background: Rectangle {
                border.color: night_mode===true? "white":"black"
                border.width: 5
            }
            valueBar: Rectangle {
                color: night_mode===true? "white":"black"
                implicitWidth: 15
            }
        }
        maximumValue: 100
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: -27
            color: night_mode===true? "white":"black"
            text: "Engine Load"
            font.family: "Helvetica"
            font.pointSize: 16
        }

        Text {
            color: night_mode===true? "white":"black"
            text: "%"
            anchors.verticalCenterOffset: -71
            font.family: "Helvetica"
            font.pointSize: 16
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            anchors.leftMargin: 10
        }
        anchors.rightMargin: 434
        scale: 1
    }

    Gauge {
        id: gauge2
        anchors.horizontalCenter: parent.horizontalCenter
        y: 8
        width: 100
        height: 100
        anchors.margins: 10
        value: Modbus.q_fuelRate
        tickmarkStepSize: 200
        orientation: Qt.Horizontal
        minorTickmarkCount: 6
        anchors.bottomMargin: 99
        rotation: 0
        anchors.topMargin: 334
        anchors.leftMargin: 296
        minimumValue: 0
        anchors.fill: parent
        style: GaugeStyle {
            tickmark: Item {
                id: tick2
                Rectangle {
                    color: night_mode===true? "white":"black"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            minorTickmark: Item {
                Rectangle {
                    color: night_mode===true? "white":"black"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            tickmarkLabel: Text {
                color: night_mode===true? "white":"black"
                text: styleData.value === 0 ? "0" : (styleData.value === 200 ? "200" : "")
                anchors.verticalCenter: parent.bottom
                visible: styleData.value === 0 || styleData.value === 200
                font.pixelSize: 20
            }
            background: Rectangle {
                border.color: night_mode===true? "white":"black"
                border.width: 5
            }
            valueBar: Rectangle {
                color: night_mode===true? "white":"black"
                implicitWidth: 15
            }
        }
        maximumValue: 200
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: -27
            color: night_mode===true? "white":"black"
            text: "Fuel Rate"
            font.family: "Helvetica"
            font.pointSize: 16
        }

        Text {

            color: night_mode===true? "white":"black"
            text: "LPH"
            anchors.verticalCenterOffset: -71
            font.family: "Helvetica"
            font.pointSize: 16
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.right
            anchors.leftMargin: 10
        }
        anchors.rightMargin: 434
        scale: 1
    }
}


