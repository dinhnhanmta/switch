#ifndef MODBUS_HPP
#define MODBUS_HPP

#include <QDebug>
#include <QModbusClient>
#include <QModbusDataUnit>
#include <QModbusReply>
#include <QModbusRtuSerialMaster>
#include <QObject>
#include <QTimer>
#include <QtSerialPort/QSerialPort>
#include <QModbusTcpServer>
#include <QString>
#include <QtSql>
#include <QDebug>
#include <QFileInfo>
#include <QMediaPlayer>

class rpl : public QObject {};

class Modbus : public QObject {
  Q_OBJECT
   Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)

    Q_PROPERTY( int q_engineSpeed READ getEngineSpeed  NOTIFY varChanged)
    Q_PROPERTY( int q_oilPress READ getOilPress  NOTIFY varChanged)
    Q_PROPERTY( int q_coolantTemp READ getCoolantTemp  NOTIFY varChanged)
    Q_PROPERTY( int q_boostPres READ getBoostPres  NOTIFY varChanged)
    Q_PROPERTY( int q_fuelPres READ getFuelPres  NOTIFY varChanged)
    Q_PROPERTY( int q_fuelRate READ getFuelRate  NOTIFY varChanged)
    Q_PROPERTY( int q_battery READ getBattery  NOTIFY varChanged)
    Q_PROPERTY( int q_engineHours READ getEngineHours  NOTIFY varChanged)
    Q_PROPERTY( int q_engineLoad READ getEngineLoad  NOTIFY varChanged)
    Q_PROPERTY( int q_leftAirInlet READ getLeftAirInlet  NOTIFY varChanged)
    Q_PROPERTY( int q_lTurboInlet READ getLTurboInlet NOTIFY varChanged)
    Q_PROPERTY( int q_rTurboInlet READ getRTurboInlet  NOTIFY varChanged)
    Q_PROPERTY( int q_fuelDriffInlet READ getFuelDriffInlet  NOTIFY varChanged)
    Q_PROPERTY( int q_exhTempL READ getExhTempL  NOTIFY varChanged)
    Q_PROPERTY( int q_exhTempR READ getExhTempR  NOTIFY varChanged)
    Q_PROPERTY( int q_oilDriffInlet READ getOilDriffInlet  NOTIFY varChanged)

    Q_PROPERTY( int q_tripEngineHour READ getTripEngineHour  NOTIFY varChanged)
    Q_PROPERTY( int q_tripIdleHour READ getTripIdleHour  NOTIFY varChanged)
    Q_PROPERTY( int q_tripFuel READ getTripFuel  NOTIFY varChanged)
    Q_PROPERTY( int q_tripIdleFuel READ getTripIdleFuel  NOTIFY varChanged)
    Q_PROPERTY( int q_avgLoadFactor1 READ getAvgLoadFactor1  NOTIFY varChanged)
    Q_PROPERTY( int q_avgFuelConsumption1 READ getAvgFuelConsumption1 NOTIFY varChanged)

    Q_PROPERTY( int q_lifeTimeIdleHour READ getLifeTimeIdleHour  NOTIFY varChanged)
    Q_PROPERTY( int q_lifeTimeEngineHour READ getLifeTimeEngineHour  NOTIFY varChanged)
    Q_PROPERTY( int q_lifeTimeFuel READ getLifeTimeFuel  NOTIFY varChanged)
    Q_PROPERTY( int q_lifeTimeIdleFuel READ getLifeTimeIdleFuel  NOTIFY varChanged)
    Q_PROPERTY( int q_avgLoadFactor2 READ getAvgLoadFactor2  NOTIFY varChanged)
    Q_PROPERTY( int q_avgFuelConsumption2 READ getAvgFuelConsumption2  NOTIFY varChanged)

    Q_PROPERTY( bool q_errVisible READ getErrVisible  NOTIFY errChanged)
    Q_PROPERTY( int q_errSource READ getErrSource  NOTIFY errChanged)
    Q_PROPERTY( QString q_errSPN READ getErrSPN  NOTIFY errChanged)
    Q_PROPERTY( QString q_errFMI READ getErrFMI  NOTIFY errChanged)
    Q_PROPERTY( int q_errSPNCode READ getErrSPNCode  NOTIFY errChanged)
    Q_PROPERTY( int q_errFMICode READ getErrFMICode  NOTIFY errChanged)

    Q_PROPERTY( bool q_unitLocation READ getUnitLocation NOTIFY varChanged)


public:
  Modbus();
  ~Modbus();

public:
   QSqlDatabase db;
   QMediaPlayer * player;
//   QMediaService *svc =player->service();
   void readDatabase();
   void startConnection();
public slots:
  void endConnection();
  void startReading();
  void setNnbytes(int n);
  void setStartAddress(int n);
  QString getContent();

private:
  QModbusRtuSerialMaster *client;
  QString content;
  int nBytes;
  int startAddress;
  QString thu;
  QTimer *serialTimer;
  QModbusTcpServer *modbusDevice;
  void updateData(QModbusDataUnit::RegisterType table, int address, int size);
  QString m_userName;

  void readready() const;
signals:
    void userNameChanged();
public:
     QString userName();
     void setUserName(const QString &userName);
     void visibleChange();
     int getEngineSpeed() {return engineSpeed;}
     int getOilPress() {return oilPress;}
     int getCoolantTemp() {return coolantTemp;}
     int getBoostPres() {return boostPres;}
     int getFuelPres() {return fuelPres;}
     int getFuelRate() {return fuelRate;}
     int getBattery() {return battery;}
     int getEngineHours() {return engineHours;}
     int getEngineLoad() {return engineLoad;}
     int getLeftAirInlet() {return leftAirInlet;}
     int getLTurboInlet() {return lTurboInlet;}
     int getRTurboInlet() {return rTurboInlet;}
     int getFuelDriffInlet() {return fuelDriffInlet;}
     int getExhTempL() {return exhTempL;}
     int getExhTempR() {return exhTempR;}
     int getOilDriffInlet() {return oilDriffInlet;}

     int getTripEngineHour(){return tripEngineHour;}
     int getTripIdleHour () {return tripIdleHour;}
     int getTripFuel  () {return tripFuel;}
     int getTripIdleFuel  () {return tripIdleFuel ;}
     int getAvgLoadFactor1  () {return avgLoadFactor1;}
     int getAvgFuelConsumption1 () {return avgFuelConsumption1;}

     int getLifeTimeIdleHour  () {return lifeTimeIdleHour;}
     int getLifeTimeEngineHour () {return lifeTimeEngineHour;}
     int getLifeTimeFuel () {return lifeTimeFuel;}
     int getLifeTimeIdleFuel  () {return lifeTimeIdleFuel;}
     int getAvgLoadFactor2  () {return avgLoadFactor2;}
     int getAvgFuelConsumption2  () {return avgFuelConsumption2;}
     bool getUnitLocation() {return unitLocation;}
     bool getErrVisible (){return errVisible;}
     int getErrSource () {
         /*if (errSource==0) return  "PORT";
         if (errSource==1) return "STARPOARD";
         else return "";*/
         return errSource;
     }
     QString getErrSPN () {return errSPN;}
     QString getErrFMI () {return errFMI;}
     int getErrSPNCode () {return errSPNCode;}
     int getErrFMICode () {return errFMICode;}



signals:
    void varChanged();
    void errChanged();
private:
     int engineSpeed;
     int oilPress;
     int coolantTemp ;
     int boostPres ;
     int fuelPres;
     int fuelRate ;
     int battery ;
     int engineHours;
     int engineLoad ;

     int leftAirInlet  ;
     int lTurboInlet ;
     int rTurboInlet  ;
     int fuelDriffInlet ;
     int exhTempL   ;
     int exhTempR  ;
     int oilDriffInlet ;

     int tripEngineHour ;
     int tripIdleHour ;
     int tripFuel  ;
     int tripIdleFuel ;
     int avgLoadFactor1 ;
     int avgFuelConsumption1 ;

     int lifeTimeIdleHour ;
     int lifeTimeEngineHour ;
     int lifeTimeIdleFuel ;
     int lifeTimeFuel ;
     int avgLoadFactor2 ;
     int avgFuelConsumption2 ;


     int errSource;
     QString errSPN;
     QString errFMI;
     int errSPNCode;
     int errFMICode;

     int unitLocation = 0;
     //play mp3
     int file;
     int volume;
     qreal speed;
    quint16 valueQml[100];
public:
     bool errVisible;

};

#endif // MODBUS_HPP
