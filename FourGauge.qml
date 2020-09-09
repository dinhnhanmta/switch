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
    CircularGauge {
    id: engineSpeed2
    x: 105
    y: -89
    width: 590
    height: 496
    scale: 0.5
    z: 1
    value: Modbus.q_engineSpeed
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
            color:  night_mode===true? "white":"black"
        }
        tickmark: Rectangle {

                        implicitWidth: outerRadius * 0.06
                        antialiasing: true
                        implicitHeight: outerRadius * 0.1
                        color:  night_mode===true? "white":"black"
                    }
        tickmarkStepSize : 5
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
        minimumValueAngle: -135
        maximumValueAngle: 135

        labelInset: -30
        labelStepSize : 5

    }
    maximumValue:30
    stepSize: 0.01


    Text {
                id: x100
                color: night_mode===true? "white":"black"
                text: "x100"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpm
                color: night_mode===true? "white":"black"
                text: "RPM"
                anchors.horizontalCenterOffset: 0
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 68
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpmValue
                width: 151
                height: 79
                color: night_mode===true? "white":"black"
                text: engineSpeed2.value
                font.bold: true
                font.pointSize: 61
                anchors.top: rpm.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
        }


}

    CircularGauge {
    id: voltage_gauge
    x: 161
    y: 159
    width: 480
    height: 420
    scale: 0.4
    z: 1
    value: Modbus.q_battery
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
            color:  night_mode===true? "white":"black"
        }
        tickmark: Rectangle {
                        visible: valueToAngle(styleData.value) % 45 == 0
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
        labelStepSize : 16

    }
    maximumValue:32
    stepSize: 0.01

    Text {

                color: night_mode===true? "white":"black"
                text: "BATTERY"
                font.pointSize: 28
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                color: night_mode===true? "white":"black"
                text: "VOLS"
                anchors.horizontalCenterOffset: 0
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 46
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
        y: 291

                width: 151
                height: 79
                color: night_mode===true? "white":"black"
                text: voltage_gauge.value
                anchors.horizontalCenterOffset: 0
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 61
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }


    }

    Text {
        x: 339
        y: 464
        text: "Engine Load"
        font.family: "Helvetica"
        font.pointSize: 19
        color: night_mode===true? "white":"black"
        Text {
            x: 81
            y: 29
            text: Modbus.q_engineLoad
            font.bold: true
            font.family: "Tahoma"
            font.pointSize: 35
            color: night_mode===true? "white":"black"
        }
        Text {
            x: 169
            y: 44
            text: "%"
            font.family: "Tahoma"
            font.pointSize: 17
            color: night_mode===true? "white":"black"
        }

    }

    CircularGauge {
    id: oilpress_gauge
    x: -103
    y: 221
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
        y: 301

                width: 151
                height: 79
                color: night_mode===true? "white":"black"
                text: oilpress_gauge.value
                anchors.horizontalCenterOffset: 0
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 61
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }


    }

    CircularGauge {
    id: coolant_gauge
    x: -103
    y: 9
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
                font.pointSize: 28
                anchors.top: parent.verticalCenter
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                y: 298
                width: 89
                height: 79
                color: night_mode===true? "white":"black"
                text: coolant_gauge.value
                anchors.horizontalCenterOffset: 0
                font.bold: true
                font.pointSize: 61
                anchors.topMargin: 40
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
        }


    }

}


