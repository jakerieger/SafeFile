#-------------------------------------------------
#
# Project created by QtCreator 2017-08-20T19:33:50
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = SafeFile
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp \
        mainwindow.cpp

HEADERS += \
        mainwindow.h

FORMS += \
        mainwindow.ui

macx: LIBS += -L$$PWD/../../Desktop/poco/lib/ -lPocoCrypto.48

INCLUDEPATH += $$PWD/../../Desktop/poco/include
DEPENDPATH += $$PWD/../../Desktop/poco/include

macx: LIBS += -L$$PWD/../../../../usr/local/lib/ -lcrypto.1.1

INCLUDEPATH += $$PWD/../../../../usr/local/include
DEPENDPATH += $$PWD/../../../../usr/local/include

macx: LIBS += -L$$PWD/../../Desktop/poco/lib/ -lPocoFoundation.48

INCLUDEPATH += $$PWD/../../Desktop/poco/include
DEPENDPATH += $$PWD/../../Desktop/poco/include

RESOURCES += \
    resources.qrc
