QT += quick serialbus serialport sql multimedia
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
IMAGE_INSTALL += " \
    packagegroup-petalinux-multimedia \
    packagegroup-petalinux-audio \
    qtmultimedia \
    qtmultimedia-plugins \
    qtmultimedia-qmlplugins \
    "
PACKAGECONFIG_append_pn-qtmultimedia = " alsa gstreamer"
GST_VERSION=1.0
# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    #Modbus.cpp \
    button.cpp \
    database.cpp \
    main.cpp \
    modbus.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =$$PWD/modules

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =
target.path =/home/pi
INSTALLS +=target
# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    Modbus.hpp \
    button.hpp \
INCLUDEPATH    += /usr/local/include \
    database.h +/usr/lib/arm-linux-gnueabihf/gstreamer-1.0
LIBS += -L/usr/local/lib -lwiringPi
LIBS += -L/usr/lib/arm-linux-gnueabihf/gstreamer-1.0
QT_DEBUG_PLUGINS=1
#INCLUDEPATH += $$PWD/WiringPi-Qt
#include(WiringPi-Qt/WiringPi-Qt.pri)
