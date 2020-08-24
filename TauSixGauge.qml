import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
import QtQuick.Extras 1.4


Item{

    width: 800
    height: 480
    CircularGauge {
    id: rmpGauge
    x: 169
    y: -79
    width: 480
    height: 420
    scale: 0.5
    z: 1
    value: 18.5
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
            color:  "#808080"
        }
        tickmark: Rectangle {

                        implicitWidth: outerRadius * 0.06
                        antialiasing: true
                        implicitHeight: outerRadius * 0.1
                        color:  "#808080"
                    }
        tickmarkStepSize : 5
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
        minimumValueAngle: -135
        maximumValueAngle: 135

        labelInset: -30
        labelStepSize : 5

    }
    maximumValue:30
    stepSize: 0.01


    Text {
                id: x100
                color: "#808080"
                text: "x100"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpm
                color: "#808080"
                text: "RPM"
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpmValue
                width: 151
                height: 79
                color: "#808080"
                text: 15.8*100
                anchors.horizontalCenterOffset: -12
                font.pointSize: 61
                anchors.top: rpm.bottom
                anchors.topMargin: 16
                anchors.horizontalCenter: parent.horizontalCenter
        }


}

    CircularGauge {
    id: voltage_gauge
    x: 169
    y: 116
    width: 480
    height: 420
    scale: 0.4
    z: 1
    value: 18.5
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
                               degreesToRadians(valueToAngle(0) - 90), degreesToRadians(valueToAngle(32) - 90));
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
                        visible: valueToAngle(styleData.value) % 45 == 0
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
        labelStepSize : 16

    }
    maximumValue:32
    stepSize: 0.01

    Text {

                color: "#808080"
                text: "BATTERY"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                color: "#808080"
                text: "VOLS"
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
                text: voltage_gauge.value
                anchors.horizontalCenterOffset: 6
                font.pointSize: 61
                anchors.top: rpm.bottom
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }


    }

    Text {
        x: 330
        y: 402
        text: "Engine Load"
        font.family: "Helvetica"
        font.pointSize: 19
        color: "#808080"
        Text {
            x: 81
            y: 30
            text: "29"
            font.family: "Tahoma"
            font.pointSize: 35
            color: "#808080"
        }
        Text {
            x: 169
            y: 44
            text: "%"
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

        width: 161
        height: 79
        color: "#808080"
        text: "120"
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 6
        font.pointSize: 61
        anchors.top: rpm.bottom
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
    }


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


