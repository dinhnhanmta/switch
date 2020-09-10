import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    width: 1024
    height: 600
    CircularGauge {
    id: gaugeMain
    x: -13
    y: -17
    width: 480
    height: 420
    scale: 0.7
    z: 1
    value: 13.9
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
                           ctx.strokeStyle = "black";
                           ctx.lineWidth = outerRadius * 0.05;

                           ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                               degreesToRadians(valueToAngle(0) - 90), degreesToRadians(valueToAngle(30) - 90));
                           ctx.moveTo(outerRadius,outerRadius);
                           ctx.lineTo(outerRadius-Math.sqrt(2)/2*outerRadius,Math.sqrt(2)/2*outerRadius+outerRadius);
                            ctx.moveTo(outerRadius,outerRadius);
                           ctx.lineTo(outerRadius+Math.sqrt(2)/2*outerRadius,Math.sqrt(2)/2*outerRadius+outerRadius);
                            ctx.stroke();
                       }
                   }
        needle: Rectangle {
            y: outerRadius * 0.03
            implicitWidth: outerRadius * 0.03
            implicitHeight: outerRadius * 0.9
            antialiasing: true
            color:  "black"
        }
        tickmark: Rectangle {
                        visible: styleData.value < 80 || styleData.value % 10 == 0
                        implicitWidth: outerRadius * 0.02
                        antialiasing: true
                        implicitHeight: outerRadius * 0.06
                        color:  "black"
                    }
        minorTickmark: Rectangle {
                        visible: styleData.value < 0
                        implicitWidth: outerRadius * 0.01
                        antialiasing: true
                        implicitHeight: outerRadius * 0.03
                        color: "black"
                    }
        tickmarkLabel:  Text {
            font.pixelSize: 28
            text: styleData.value
            color: "black"
            antialiasing: true
        }
        minimumValueAngle: -135
        maximumValueAngle: 135

        labelInset: -30
        labelStepSize : 5

    }
    maximumValue:30
    stepSize: 0.01


    Text {
                id: x100
                color: "black"
                text: "x100"
                font.pointSize: 18
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpm
                color: "black"
                text: "RPM"
                font.pointSize: 18
                anchors.top: parent.verticalCenter
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpmValue
                width: 151
                height: 79
                color: "black"
                text: gaugeMain.value*100
                font.pointSize: 51
                anchors.top: rpm.bottom
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    //anchors.horizontalCenter: rectangleBackground.horizontalCenter
    //anchors.verticalCenter: rectangleBackground.verticalCenter

}


    Text {
        id: text3
        x: 22
        y: 361
        color: "black"
        text: qsTr("Coolant Temp")
        font.family: "Times New Roman"
        font.pixelSize: 18
    }

    Text {
        id: text5
        x: 127
        y: 411
        color: "black"
        text: qsTr("DEG C")
        font.pixelSize: 22
    }

    Text {
        id: text6
        x: 65
        y: 382
        color: "black"
        text: qsTr("81")
        font.pixelSize: 51
    }

        Text {
            id: text4
            x: 207
            y: 361
            color: "black"
            text: qsTr("Oil Press")
            font.pixelSize: 18
        }

        Text {
            id: text7
            x: 363
            y: 411
            color: "black"
            text: qsTr("KPA")
            font.pixelSize: 22
        }

        Text {
            id: text8
            x: 264
            y: 382
            color: "black"
            text: qsTr("568")
            font.pixelSize: 51
        }
        Gauge {
            id: battery_gauge
            height: 100
            scale: 1
            width: 100
            rotation: 0
            anchors.rightMargin: 77
            anchors.bottomMargin: 405
            anchors.leftMargin: 535
            anchors.topMargin: 29
            anchors.fill: parent
            anchors.margins: 10
            maximumValue: 32
            minimumValue: 0
            value: 24
            minorTickmarkCount: 6
            tickmarkStepSize: 32
            orientation: Qt.Horizontal


            Behavior on value {
                NumberAnimation {
                    duration: 1000
                }
            }

            style: GaugeStyle {
                background: Rectangle {

                    border.color: "black"
                    border.width: 5
                }
                valueBar: Rectangle {
                    implicitWidth: 15
                    color:"black"

                }


                tickmark: Item {

                    implicitWidth: 5
                    implicitHeight: 3

                    Rectangle {

                        color: "black"
                        anchors.fill: parent

                    }
                }
                minorTickmark: Item {
                    implicitWidth: 5
                    implicitHeight: 3

                    Rectangle {
                        color: "black"
                        anchors.fill: parent

                    }
                }
                tickmarkLabel: Text {
                    color: "black"
                    visible: styleData.value === 0 || styleData.value === 32
                    font.pixelSize: 20
                    text: styleData.value === 0 ? "0" : (styleData.value === 32 ? "32" : "")
                    anchors.verticalCenter: parent.bottom
                }


            }
            Text {
                x: 43
                y: -27
                text: "Battery"
                font.family: "Helvetica"
                font.pointSize: 16
                color: "black"}

            Text {
                x: 183
                y: -6
                color: "black"
                text: "VOLTS"
                font.family: "Helvetica"
                font.pointSize: 16
            }

            Text {
                x: 60
                y: 21
                width: 71
                height: 25
                color: "black"
                text: battery_gauge.value
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                font.family: "Helvetica"
            }

        }

        Gauge {
            id: crankcase_gauge
            x: 9
            y: 0
            width: 100
            height: 100
            anchors.bottomMargin: 331
            style: GaugeStyle {
                valueBar: Rectangle {
                    color: "black"
                    implicitWidth: 15
                }
                tickmarkLabel: Text {
                    color: "black"
                    text: styleData.value === -60 ? "-60" : (styleData.value === 20 ? "20" : "")
                    visible: styleData.value === -60 || styleData.value === 20
                    anchors.verticalCenter: parent.bottom
                    font.pixelSize: 20
                }
                background: Rectangle {
                    border.color: "black"
                    border.width: 5
                }
                minorTickmark: Item {
                    Rectangle {
                        color: "black"
                        anchors.fill: parent
                    }
                    implicitHeight: 3
                    implicitWidth: 5
                }
                tickmark: Item {
                    Rectangle {
                        color: "black"
                        anchors.fill: parent
                    }
                    implicitHeight: 3
                    implicitWidth: 5
                }
            }
            tickmarkStepSize: 80
            value: -1
            anchors.topMargin: 104
            minorTickmarkCount: 6
            rotation: 0
            orientation: Qt.Horizontal
            anchors.leftMargin: 535
            scale: 1
            anchors.rightMargin: 77
            anchors.margins: 10
            maximumValue: 20
            minimumValue: -60
            Text {
                x: 45
                y: -28
                color: "black"
                text: "Crankcase"
                font.pointSize: 16
                font.family: "Helvetica"
            }

            Text {
                x: 202
                y: -4
                color: "black"
                text: "KPA"
                font.pointSize: 16
                font.family: "Helvetica"
            }

            Text {
                x: 72
                y: 20
                width: 46
                height: 25
                color: "black"
                text:crankcase_gauge.value
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                font.family: "Helvetica"
            }

            anchors.fill: parent
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
                               ctx.strokeStyle = "black";
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
                 color:  "black"
             }
             tickmark: Rectangle {
                 visible: styleData.value === -2 ||styleData.value === 24||styleData.value === 50 ||styleData.value === 76 ||styleData.value === 103
                 implicitWidth: outerRadius * 0.03
                 antialiasing: true
                 implicitHeight: outerRadius * 0.1
                 color:  "black"
             }

             tickmarkStepSize : 1
             minorTickmark: Rectangle {
                 visible: styleData.value < 0
                 implicitWidth: outerRadius * 0.01
                 antialiasing: true
                 implicitHeight: outerRadius * 0.03
                 color: "black"
             }
             tickmarkLabel:  Text {
                 font.pixelSize: 28
                 text: styleData.value
                 color: "black"
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

            color: "black"
            text: "XMSN TEMP"
            font.pointSize: 28
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            color: "black"
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
            color: "black"
            text: xmsn_temp_gauge.value
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
        value: 1200
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
                               ctx.strokeStyle = "black";
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
                 color:  "black"
             }
             tickmark: Rectangle {
                 visible: styleData.value === 438 ||styleData.value === 1094||styleData.value === 1750 ||styleData.value === 2406 ||styleData.value === 3062
                 implicitWidth: outerRadius * 0.03
                 antialiasing: true
                 implicitHeight: outerRadius * 0.1
                 color:  "black"
             }

             tickmarkStepSize : 1
             minorTickmark: Rectangle {
                 visible: styleData.value < 0
                 implicitWidth: outerRadius * 0.01
                 antialiasing: true
                 implicitHeight: outerRadius * 0.03
                 color: "black"
             }
             tickmarkLabel:  Text {
                 font.pixelSize: 28
                 text: styleData.value
                 color: "black"
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

            color: "black"
            text: "XMSN Pres"
            font.pointSize: 28
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            color: "black"
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
            color: "black"
            text: xmsn_pres_gauge.value
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 6
            font.pointSize: 61
            anchors.top: rpm.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }


        }
}


