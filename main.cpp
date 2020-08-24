#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <unistd.h>
#include "database.h"
#include <button.hpp>
#include <Modbus.hpp>

#define INCREASE_BUTTON 7
#define DECREASE_BUTTON 9
#define MODE_BUTTON 8
#define RING_BUTTON 0

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    Modbus *m;
    m = new Modbus();
    engine.rootContext()->setContextProperty("Modbus", m);
    m->startConnection();
    button buttonvar(INCREASE_BUTTON,DECREASE_BUTTON,MODE_BUTTON,RING_BUTTON,m);
    context->setContextProperty("button", &buttonvar);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
