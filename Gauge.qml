import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.0
import QtQuick.Controls 1.1
    import QtQuick.Extras 1.4
//import QtQuick.Enterprise.Controls 1.1

Item{
    property bool night_mode: false
    x: 110
    y: 70
    width: 1000
    height: 600
    scale: 1
    CircularGauge {
    id: engineSpeed3
    x: -13
    y: -17
    width: 480
    height: 420
    scale: 0.7
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
                        visible: styleData.value < 80 || styleData.value % 10 == 0
                        implicitWidth: outerRadius * 0.02
                        antialiasing: true
                        implicitHeight: outerRadius * 0.06
                        color:  night_mode===true? "white":"black"
                    }
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
                font.pointSize: 18
                anchors.bottom: parent.verticalCenter
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpm
                color: night_mode===true? "white":"black"
                text: "RPM"
                font.pointSize: 18
                anchors.top: parent.verticalCenter
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    Text {
                id: rpmValue
                width: 172
                height: 79
                color: night_mode===true? "white":"black"
                text: engineSpeed3.value*100
                font.bold: true
                font.pointSize: 51
                horizontalAlignment: Text.AlignHCenter
                anchors.top: rpm.bottom
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
        }
    //anchors.horizontalCenter: rectangleBackground.horizontalCenter
    //anchors.verticalCenter: rectangleBackground.verticalCenter

}


    Gauge {
        id: battery3
        height: 100
        scale: 1
        width: 100
        rotation: 0
        anchors.rightMargin: 263
        anchors.bottomMargin: 373
        anchors.leftMargin: 496
        anchors.topMargin: 52
        anchors.fill: parent
        anchors.margins: 10
        maximumValue: 32
        minimumValue: 0
        value: Modbus.q_battery/100
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
                                           visible: styleData.value === 0 || styleData.value === 32
                                           font.pixelSize: 20
                                           text: styleData.value === 0 ? "0" : (styleData.value === 32 ? "32" : "")
                                           anchors.verticalCenter: parent.bottom
                }


            }
    }

    Text {
        id: text1
        x: 604
        y: 12
        color: night_mode===true? "white":"black"
        text: qsTr("Battery")
        font.pixelSize: 18
    }

    Text {
        id: text2
        x: 743
        y: 52
        color: night_mode===true? "white":"black"
        text: qsTr("VOLTS")
        font.pixelSize: 18
    }

    Text {
        id: text3
        x: 26
        y: 364
        color: night_mode===true? "white":"black"
        text: qsTr("Coolant Temp")
        font.family: "Times New Roman"
        font.pixelSize: 19
    }

    Text {
        id: text5
        x: 175
        y: 404
        color: night_mode===true? "white":"black"
        text: qsTr("DEG C")
        font.pixelSize: 22
    }

    Text {
        id: text6
        x: 48
        y: 382
        width: 121
        height: 58
        color: night_mode===true? "white":"black"
        text: Modbus.q_coolantTemp
        font.bold: true
        font.pixelSize: 51
    }

        Text {
            id: text4
            x: 313
            y: 364
            color: night_mode===true? "white":"black"
            text: qsTr("Oil Press")
            font.pixelSize: 19
        }

        Text {
            id: text7
            x: 457
            y: 404
            color: night_mode===true? "white":"black"
            text: qsTr("KPA")
            font.pixelSize: 22
        }

        Text {
            id: text8
            x: 313
            y: 382
            width: 147
            height: 58
            color: night_mode===true? "white":"black"
            text: Modbus.q_oilPress
            font.bold: true
            font.pixelSize: 51
        }



}


