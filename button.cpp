#include "button.hpp"
#include "wiringPi.h"
#include <QDebug>

button::button(QObject* parent) : QObject(parent)
{
   counter=0;
}
button::button(int pin_increase_input,int pin_decrease_input,int pin_mode_input, int pin_ring_input, Modbus *p)
{
   pModbus = p;
   counter=3;
   now=0;
   mode=false;
   pin_increase=pin_increase_input;
   pin_decrease=pin_decrease_input;
   pin_mode=pin_mode_input;
   pin_ring = pin_ring_input;
   wiringPiSetup () ;
   pinMode (pin_increase, INPUT) ;
   pullUpDnControl(pin_increase,PUD_UP);
   pinMode (pin_decrease, INPUT) ;
   pullUpDnControl(pin_decrease,PUD_UP);
   pinMode (pin_mode, INPUT) ;
   pullUpDnControl(pin_mode,PUD_UP);
   pinMode (pin_ring, INPUT) ;
   pullUpDnControl(pin_ring,PUD_UP);
   timer = new QTimer(this);
   QObject::connect(timer, SIGNAL(timeout()), this, SLOT(readValue()));
   timer->start(100); //time specified in ms
}
void button::readValue()
{
   static bool trigger_increase=false;
   static bool trigger_decrease=false;
   static bool trigger_mode=false;
   static bool trigger_ring=false;
   if (digitalRead(pin_increase)==0) {
       trigger_increase=true;
   }
   if (trigger_increase==true)
   {
       if (digitalRead(pin_increase)==1) {if (counter<7) counter++;trigger_increase=false;    emit varChanged();}
   }

   if (digitalRead(pin_decrease)==0) {
       trigger_decrease=true;
   }

   if (trigger_decrease==true)
   {
       qDebug()<< "button decreas press";
       if (digitalRead(pin_decrease)==1) {if (counter>1) counter--; trigger_decrease=false;emit varChanged();}
   }

   if (digitalRead(pin_mode)==0) {
       trigger_mode=true;
   }

   if (trigger_mode==true)
   {
       if (digitalRead(pin_mode)==1) {mode=!mode;trigger_mode=false;emit modeChanged();}
   }

   if (digitalRead(pin_ring)==0) {
       trigger_ring=true;
   }
   if (trigger_ring==true)
   {
       if (digitalRead(pin_ring)==1) {
           qDebug()<< "button ring press";
           trigger_ring=false; pModbus->errVisible=!pModbus->errVisible; emit pModbus->errChanged();}
   }

}

