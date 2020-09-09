#include "Modbus.hpp"
#include <QModbusTcpServer>
#include <QUrl>
#include <fstream>
#include <iostream>
#include <stdio.h>

#include <QObject>


Modbus::Modbus() {
  content = "";
  serialTimer = nullptr;
   engineSpeed = 0;
   oilPress = 0;
   coolantTemp = 0 ;
   boostPres = 0 ;
   fuelPres = 0;
   fuelRate = 0 ;
   battery = 0 ;
   engineHours = 0;
   engineLoad = 0 ;
   leftAirInlet = 0  ;
   lTurboInlet = 0 ;
   rTurboInlet = 0  ;
   fuelDriffInlet = 0 ;
   exhTempL  = 0  ;
   exhTempR  = 0 ;
   oilDriffInlet = 0 ;

   tripEngineHour = 0 ;
   tripIdleHour  = 0;
   tripFuel   = 0;
   tripIdleFuel  = 0 ;
   avgLoadFactor1  = 0;
   avgFuelConsumption1  = 0;

   lifeTimeIdleHour  = 0;
   lifeTimeEngineHour  = 0;
   lifeTimeIdleFuel  = 0;
   lifeTimeFuel  = 0;
   avgLoadFactor2  = 0;
   avgFuelConsumption2  = 0;

   errVisible = false;
   errSource=0;
   errSPN="";
   errFMI="";
   errSPNCode=0;
   errSPNCode=0;
   player = new QMediaPlayer();


   file = 0;
   speed = 1.0;
   volume = 50;

   valueQml[33] = 10;
   valueQml[32] =50;

   unitLocation = false;
   offScreen = false;
   emit varChanged();
   emit errChanged();
}

void Modbus::startConnection() {
   //QString str = "192.168.0.10:1234";
    QString str = "localhost:502";
    const QUrl url = QUrl::fromUserInput(str);
    // modbusDevice->disconnect();
    //delete modbusDevice;
    //modbusDevice = nullptr;
    modbusDevice = new QModbusTcpServer(this);
    modbusDevice->setConnectionParameter(QModbusDevice::NetworkPortParameter, url.port());
    modbusDevice->setConnectionParameter(QModbusDevice::NetworkAddressParameter, url.host());
    modbusDevice->setServerAddress(1);
    if (!modbusDevice->connectDevice())
      qDebug() << "cannot connect ";
    else
      qDebug() << "connect ";
    QModbusDataUnitMap reg;
    reg.insert(QModbusDataUnit::Coils, { QModbusDataUnit::Coils, 0, 10 });
    reg.insert(QModbusDataUnit::DiscreteInputs, { QModbusDataUnit::DiscreteInputs, 0, 10 });
    reg.insert(QModbusDataUnit::InputRegisters, { QModbusDataUnit::InputRegisters, 0, 10 });
    reg.insert(QModbusDataUnit::HoldingRegisters, { QModbusDataUnit::HoldingRegisters, 0, 50 });
    modbusDevice->setMap(reg);
    connect(modbusDevice, &QModbusServer::dataWritten,
            this, &Modbus::updateData);
}
QString Modbus::userName()
{
    return m_userName;
}
void Modbus::setUserName(const QString &userName)
{
    m_userName = userName;
    emit userNameChanged();
}
void Modbus::updateData(QModbusDataUnit::RegisterType table, int address, int size)
{

    for (int i = 0; i < size; ++i) {
        quint16 value;
        QString text;
        switch (table) {
        case QModbusDataUnit::Coils:
            modbusDevice->data(QModbusDataUnit::Coils, address + i, &value);
            break;
        case QModbusDataUnit::HoldingRegisters:
            modbusDevice->data(QModbusDataUnit::HoldingRegisters, address + i, &value);

            valueQml[address + i]=value;
            qDebug() << value<<" o "<<address + i;
            break;
        default:
            break;
        }
    }
     engineSpeed = valueQml[0];
     oilPress= valueQml[1];
     coolantTemp = valueQml[2];
     boostPres = valueQml[3];
     fuelPres= valueQml[4];
     fuelRate = valueQml[5];
     battery = valueQml[6];
     engineHours = valueQml[7];
     engineLoad = valueQml[8];

     leftAirInlet  = valueQml[9];
     lTurboInlet = valueQml[10];
     rTurboInlet  = valueQml[11];
     fuelDriffInlet = valueQml[12];
     exhTempL   = valueQml[13];
     exhTempR  = valueQml[14];
     oilDriffInlet = valueQml[15];

     tripEngineHour = valueQml[16];
     tripIdleHour = valueQml[17];
     tripFuel  = valueQml[18];
     tripIdleFuel = valueQml[19];
     avgLoadFactor1 = valueQml[20];
     avgFuelConsumption1 = valueQml[21];

     lifeTimeIdleHour = valueQml[22];
     lifeTimeEngineHour = valueQml[23];
     lifeTimeIdleFuel = valueQml[24];
     lifeTimeFuel = valueQml[25];
     avgLoadFactor2 = valueQml[26];
     avgFuelConsumption2 = valueQml[27];

     if (valueQml[34] == 0) unitLocation = false;
     if (valueQml[34] == 1) unitLocation = true;
     if (valueQml[35] == 1) offScreen = true;
     if (valueQml[35] == 0) offScreen = false;
     if (valueQml[28]!=errSource || valueQml[29]!=errSPN || valueQml[30] != errFMI)
     {
        if (valueQml[28]==1)
        {
            errVisible = true;
            emit errChanged();
        }

        if (valueQml[28]==0)
        {
            errVisible = false;
            emit errChanged();
        }

        errSource = valueQml[28];
        errSPN = valueQml[29];
        errFMI = valueQml[30];
        errVisible = true;
        QSqlDatabase mydb=QSqlDatabase::addDatabase("QSQLITE");
        mydb.setDatabaseName("/home/pi/database/testDB.db");
        if (mydb.open()){
            qDebug() << "Open successfully";
            QSqlQuery q;
            QString query;
            QString data="";
            query="SELECT * FROM ERROR where SPN=";
            query =query+ QString::number( valueQml[29]) + " and FMI =" + QString::number( valueQml[30]) ;
            q.exec(query);
            qDebug() <<query;
            while (q.next()){
                data= data + q.value(0).toString() + " - " + q.value(1).toString() + " - " + q.value(2).toString() + " - " +q.value(3).toString() + "\n -----";
                errSPN = q.value(2).toString();
                errFMI = q.value(3).toString();
                errSPNCode = q.value(0).toInt();
                errFMICode = q.value(1).toInt();
                emit errChanged();
            }
           qDebug() << data;
        }
        else qDebug() << "Open failed";

     }


     // play mp3 file
     if (file != valueQml[31]) {
        switch (valueQml[31]) {
            case 0:
                player -> stop();
                break;
            case 1:
                qDebug()<<"play 1";
                player->stop();
                player->setMedia(QUrl::fromLocalFile("/home/pi/database/a.mp3"));
                player->play();
                break;
            case 2:
                 qDebug()<<"play 2";
                player->stop();
                player->setMedia(QUrl::fromLocalFile("/home/pi/database/b.mp3"));
                player->play();
                break;qDebug()<<"play 1";
            case 3:
            qDebug()<<"play 3";
                player->stop();
                player->setMedia(QUrl::fromLocalFile("/home/pi/database/c.mp3"));
                player->play();
                break;
        }
        file = valueQml[31];
     }

     if (volume != valueQml[32]) {

         if (valueQml[32]<=100 ) {
             volume =valueQml[32];
             player->setVolume(volume);
         }
     }

     if (speed != (float) valueQml[33]/10) {

         speed = (float) valueQml [33] /10;
         qint64 pos=player->position();
         player->stop();
         player->setPlaybackRate(speed);
         player->setVolume(volume);
         player->setPosition(pos);
         player->play();
     }
     emit varChanged();
     
}

void Modbus::startReading() {
  if (serialTimer) {
    serialTimer->stop();
    delete serialTimer;
    serialTimer = nullptr;
    qDebug() << "stopped reading";
  } else {
    serialTimer = new QTimer();
   // connect(serialTimer, &QTimer::timeout, this, &Modbus::query);
    serialTimer->start(70);
    qDebug() << "started reading";
  }
}


void Modbus::readready() const {
  QModbusReply *reply = qobject_cast<QModbusReply *>(sender());
  const QModbusDataUnit result = reply->result();
  qDebug() << "read ";
  qDebug() << "";

  for (int j = 0; j < nBytes; j++)
    qDebug() << QString("The value of %1 is %2").arg(j).arg(result.value(j));
}

void Modbus::endConnection() {
  if (serialTimer) {
    serialTimer->stop();
    delete serialTimer;
    serialTimer = nullptr;
  }

  client->disconnectDevice();
  delete client;
  client = nullptr;

  qDebug() << "connection closed";
}

QString Modbus::getContent() { return content; }

Modbus::~Modbus() {
  client->disconnectDevice();
  delete client;
  client = nullptr;
}

void Modbus::setNnbytes(int n) { nBytes = n; }

void Modbus::setStartAddress(int n) { startAddress = n; }

void Modbus::readDatabase()
{
    QSqlDatabase mydb=QSqlDatabase::addDatabase("QSQLITE");
    mydb.setDatabaseName("/home/pi/database/testDB.db");

    if (mydb.open()){
        qDebug() << "Open successfully";
    }
    else qDebug() << "Open failed";
    QSqlQuery q;
    QString data;
    q.exec("SELECT * FROM COMPANY");
    while (q.next()){
        data += q.value(0).toString() + " =:= ";
        data += q.value(1).toString() + " =:= ";
        data += q.value(2).toString() + " =:= ";
        data += q.value(3).toString() + " =:= ";
        data += q.value(4).toString() + "\n";
    }
    qDebug() << data;
}

