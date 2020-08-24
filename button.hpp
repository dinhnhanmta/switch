#ifndef BUTTON_H
#define BUTTON_H
#include <time.h>
#include <QObject>
#include <QtDebug>
#include <QTimer>
#include <QString>
#include "Modbus.hpp"

class button : public QObject
{
    Q_OBJECT
    Q_PROPERTY( int counter_qml READ getVar  NOTIFY varChanged)
    Q_PROPERTY( bool night_mode READ getMode  NOTIFY modeChanged)
public:
    int getVar() {return counter;}
    bool getMode() {return mode;}
    Modbus *pModbus;
    button(int pin_increase_input,int pin_decrease_input,int pin_mode_input, int pin_ring_input, Modbus *p);
    explicit button(QObject *parent = nullptr);
signals:
    void varChanged();
    void modeChanged();
public slots:
    void readValue();
private:
    int counter;
    bool mode;
    int state;
    unsigned int now;
    QTimer *timer;
    int pin_increase;
    int pin_decrease;
    int pin_mode;
    int pin_ring;
};
#endif // BUTTON_H
