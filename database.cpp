#include "database.h"
#include <QObject>
database::database()
{
    player = new QMediaPlayer();
    /*QSqlDatabase mydb=QSqlDatabase::addDatabase("QSQLITE");
    mydb.setDatabaseName("/home/pi/database/testDB.db");

    if (mydb.open()){
        qDebug() << "Open successfully";
        QSqlQuery q;
        QString data;
        q.exec("SELECT * FROM ERROR");
        while (q.next()){
            data += q.value(0).toString() + " =:= ";
            data += q.value(1).toString() + " =:= ";
        }
       // qDebug() << data;
    }
    else qDebug() << "Open failed";*/
   /* timer2 = new QTimer(this);
    obj = new QObject();
    QObject::connect(timer2, SIGNAL(timeout()), this, SLOT(updateRate()));
    timer2->start(25000); //time specified in ms
    player = new QMediaPlayer();
    player->setMedia(QUrl::fromLocalFile("/home/pi/database/a.mp3"));
    player->play();*/
}

void database::updateRate()
{
    static int dem=0;

    if (dem==0){
    qDebug() << "da het thoi gian";
    qint64 pos=player->position();
    player->stop();
    player->setPlaybackRate(1.5);
    player->setVolume(20);
    player->setPosition(pos);
    player->play();
    }
    dem++;
}


