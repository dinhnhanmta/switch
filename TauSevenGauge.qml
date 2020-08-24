import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    width: 800
    height: 480


    Text {
        x: 247
        y: 8
        text: "ENGINE SPEED"
        fontSizeMode: Text.HorizontalFit
        scale: 1
        font.family: "Times New Roman"
        font.pointSize: 28
        color: "#808080"
        Text {
            x: -41
            y: 17
            width: 320
            height: 129
            text: "0"
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 90
            color: "#808080"
        }
        Text {
            x: 281
            y: 89
            text: "RPM"
            font.family: "Tahoma"
            font.pointSize: 28
            color: "#808080"
        }

    }


    Text {
        x: 297
        y: 394
        text: "Battery"
        font.family: "Helvetica"
        font.pointSize: 19
        color: "#808080"
        Text {
            x: -23
            y: 30
            width: 186
            height: 56
            text: "29.5"
            horizontalAlignment: Text.AlignRight
            font.family: "Tahoma"
            font.pointSize: 35
            color: "#808080"
        }
        Text {
            x: 169
            y: 44
            text: "VOLTS"
            font.family: "Tahoma"
            font.pointSize: 17
            color: "#808080"
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
    value: 400
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
                           ctx.strokeStyle = "#808080";
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
            color:  "#808080"
        }
        tickmark: Rectangle {
                        visible: styleData.value === 613||  styleData.value === 350||  styleData.value === 88||  styleData.value === 219|| styleData.value === 481
                        implicitWidth: outerRadius * 0.03
                        antialiasing: true
                        implicitHeight: outerRadius * 0.1
                        color:  "#808080"
                    }

        tickmarkStepSize : 1
        minorTickmark: Rectangle {
                        visible: styleData.value < 0
                        implicitWidth: outerRadius * 0.01
                        antialiasing: true
                        implicitHeight: outerRadius * 0.03
                        color: "#808080"
                    }
        tickmarkLabel:  Text {
            font.pixelSize: 28
            text: styleData.value
            color: "#808080"
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

                color: "#808080"
                text: "OIL PRESS"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                color: "#808080"
                text: "KPA"
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
        y: 284

                width: 151
                height: 79
                color: "#808080"
                text: oilpress_gauge.value
                anchors.horizontalCenterOffset: 6
                font.pointSize: 61
                anchors.top: rpm.bottom
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
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
    value: 67
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
                           ctx.strokeStyle = "#808080";
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
             color:  "#808080"
         }
         tickmark: Rectangle {
             visible: styleData.value === -2 ||styleData.value === 24||styleData.value === 50 ||styleData.value === 76 ||styleData.value === 103
             implicitWidth: outerRadius * 0.03
             antialiasing: true
             implicitHeight: outerRadius * 0.1
             color:  "#808080"
         }

         tickmarkStepSize : 1
         minorTickmark: Rectangle {
             visible: styleData.value < 0
             implicitWidth: outerRadius * 0.01
             antialiasing: true
             implicitHeight: outerRadius * 0.03
             color: "#808080"
         }
         tickmarkLabel:  Text {
             font.pixelSize: 28
             text: styleData.value
             color: "#808080"
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

                color: "#808080"
                text: "COOLANT"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                color: "#808080"
                text: "DEG C"
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
        y: 284

                width: 89
                height: 79
                color: "#808080"
                text: coolant_gauge.value
                anchors.horizontalCenterOffset: 6
                font.pointSize: 61
                anchors.top: rpm.bottom
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
        anchors.rightMargin: 316
        anchors.bottomMargin: 246
        anchors.leftMargin: 296
        anchors.topMargin: 187
        anchors.fill: parent
        anchors.margins: 10
        maximumValue: 350
        minimumValue: 0
        value: 30
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

                border.color: "#808080"
                border.width: 5
            }
            valueBar: Rectangle {
                implicitWidth: 15
                color:"#808080"

            }


            tickmark: Item {
                id: tick
                implicitWidth: 5
                implicitHeight: 3

                Rectangle {

                    color: "#808080"
                    anchors.fill: parent

                }
            }
            minorTickmark: Item {
                implicitWidth: 5
                implicitHeight: 3

                Rectangle {
                    color: "#808080"
                    anchors.fill: parent

                }
            }
            tickmarkLabel: Text {
                color: "#808080"
                visible: styleData.value === 0 || styleData.value === 350
                font.pixelSize: 20
                text: styleData.value === 0 ? "0" : (styleData.value === 350 ? "350" : "")
                anchors.verticalCenter: parent.bottom
            }


        }
        Text {
            x: 43
            y: -27
            text: "Boost Pres"
            font.family: "Helvetica"
            font.pointSize: 16
            color: "#808080"}

        Text {
            x: 194
            y: 0
            color: "#808080"
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
        value: 30
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
                    color: "#808080"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            minorTickmark: Item {
                Rectangle {
                    color: "#808080"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            tickmarkLabel: Text {
                color: "#808080"
                text: styleData.value === 0 ? "0" : (styleData.value === 100 ? "100" : "")
                anchors.verticalCenter: parent.bottom
                visible: styleData.value === 0 || styleData.value === 100
                font.pixelSize: 20
            }
            background: Rectangle {
                border.color: "#808080"
                border.width: 5
            }
            valueBar: Rectangle {
                color: "#808080"
                implicitWidth: 15
            }
        }
        maximumValue: 100
        Text {
            x: 43
            y: -27
            color: "#808080"
            text: "Engine Load"
            font.family: "Helvetica"
            font.pointSize: 16
        }

        Text {
            x: 194
            y: 0
            color: "#808080"
            text: "%"
            font.family: "Helvetica"
            font.pointSize: 16
        }
        anchors.rightMargin: 316
        scale: 1
    }

    Gauge {
        id: gauge2
        x: 7
        y: 8
        width: 100
        height: 100
        anchors.margins: 10
        value: 30
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
                    color: "#808080"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            minorTickmark: Item {
                Rectangle {
                    color: "#808080"
                    anchors.fill: parent
                }
                implicitHeight: 3
                implicitWidth: 5
            }
            tickmarkLabel: Text {
                color: "#808080"
                text: styleData.value === 0 ? "0" : (styleData.value === 200 ? "200" : "")
                anchors.verticalCenter: parent.bottom
                visible: styleData.value === 0 || styleData.value === 200
                font.pixelSize: 20
            }
            background: Rectangle {
                border.color: "#808080"
                border.width: 5
            }
            valueBar: Rectangle {
                color: "#808080"
                implicitWidth: 15
            }
        }
        maximumValue: 200
        Text {
            x: 43
            y: -27
            color: "#808080"
            text: "Fuel Rate"
            font.family: "Helvetica"
            font.pointSize: 16
        }

        Text {
            x: 194
            y: 0
            color: "#808080"
            text: "LPH"
            font.family: "Helvetica"
            font.pointSize: 16
        }
        anchors.rightMargin: 316
        scale: 1
    }
    CircularGauge {
    id: xmsn_temp_gauge
    x: 428
    y: 18
    width: 480
    height: 420
    scale: 0.4
    z: 1
    value: 67
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
                           ctx.strokeStyle = "#808080";
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
             color:  "#808080"
         }
         tickmark: Rectangle {
             visible: styleData.value === -2 ||styleData.value === 24||styleData.value === 50 ||styleData.value === 76 ||styleData.value === 103
             implicitWidth: outerRadius * 0.03
             antialiasing: true
             implicitHeight: outerRadius * 0.1
             color:  "#808080"
         }

         tickmarkStepSize : 1
         minorTickmark: Rectangle {
             visible: styleData.value < 0
             implicitWidth: outerRadius * 0.01
             antialiasing: true
             implicitHeight: outerRadius * 0.03
             color: "#808080"
         }
         tickmarkLabel:  Text {
             font.pixelSize: 28
             text: styleData.value
             color: "#808080"
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

        color: "#808080"
        text: "XMSN TEMP"
        font.pointSize: 28
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        color: "#808080"
        text: "DEG C"
        font.pointSize: 28
        anchors.top: parent.verticalCenter
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        y: 284

        width: 149
        height: 79
        color: "#808080"
        text: coolant_gauge.value
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 6
        font.pointSize: 61
        anchors.top: rpm.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }


    }


    CircularGauge {
    id: xmsn_pres_gauge
    x: 428
    y: 192
    width: 480
    height: 420
    scale: 0.4
    z: 1
    value: 67
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
                           ctx.strokeStyle = "#808080";
                           ctx.lineWidth = outerRadius * 0.05;

                           ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                               degreesToRadians(valueToAngle(0) - 90), degreesToRadians(valueToAngle(3500) - 90));
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
             color:  "#808080"
         }
         tickmark: Rectangle {
             visible: styleData.value === 438 ||styleData.value === 1094||styleData.value === 1750 ||styleData.value === 2406 ||styleData.value === 3062
             implicitWidth: outerRadius * 0.03
             antialiasing: true
             implicitHeight: outerRadius * 0.1
             color:  "#808080"
         }

         tickmarkStepSize : 1
         minorTickmark: Rectangle {
             visible: styleData.value < 0
             implicitWidth: outerRadius * 0.01
             antialiasing: true
             implicitHeight: outerRadius * 0.03
             color: "#808080"
         }
         tickmarkLabel:  Text {
             font.pixelSize: 28
             text: styleData.value
             color: "#808080"
             antialiasing: true
         }
         minimumValueAngle: -120
         maximumValueAngle: 120

         labelInset: -30
         labelStepSize : 1750

    }
    maximumValue: 3500
    minimumValue: 0
    stepSize: 1

    Text {

        color: "#808080"
        text: "XMSN Pres"
        font.pointSize: 28
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        color: "#808080"
        text: "KPA"
        font.pointSize: 28
        anchors.top: parent.verticalCenter
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Text {
        y: 284

        width: 189
        height: 79
        color: "#808080"
        text: "12"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 6
        font.pointSize: 61
        anchors.top: rpm.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }


    }

}


