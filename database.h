#ifndef DATABASE_HPP
#define DATABASE_HPP
#include <QtSql>
#include <QDebug>
#include <QFileInfo>
#include <QMediaPlayer>
#include <QUrl>
#include <QTimer>
#include <QObject>
#include <QAudioDeviceInfo>
#include <QAudioOutput>

class database: public QObject  {
    Q_OBJECT
public:
    database();
    QSqlDatabase db;
    QMediaPlayer * player;
    QTimer *timer2;
    QObject *obj;

public slots:
    void updateRate();//{qDebug()<<"hihih";};
};

#endif // DATABASE_HPP
