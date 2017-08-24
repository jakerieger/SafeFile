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


### WINDOWS LIBRARIES ###

win32: LIBS += -L$$PWD/../../build-openssl-32/lib/ -llibcrypto

INCLUDEPATH += $$PWD/../../build-openssl-32/include
DEPENDPATH += $$PWD/../../build-openssl-32/include

win32: LIBS += -L$$PWD/../../build-openssl-32/lib/ -llibssl

INCLUDEPATH += $$PWD/../../build-openssl-32/include
DEPENDPATH += $$PWD/../../build-openssl-32/include

win32: LIBS += -L$$PWD/../../poco-build/lib/release/ -lPocoCrypto

INCLUDEPATH += $$PWD/../../poco/Crypto/include
DEPENDPATH += $$PWD/../../poco/Crypto/include


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../poco-build/lib/release/ -lPocoFoundation
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../poco-build/lib/debug/ -lPocoFoundation

INCLUDEPATH += $$PWD/../../poco/Foundation/include
DEPENDPATH += $$PWD/../../poco/Foundation/include
