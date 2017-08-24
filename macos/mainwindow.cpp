#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <iostream>
#include <fstream>
#include <string>

#include <Poco/Poco.h>
#include <Poco/FileStream.h>
#include <Poco/StreamCopier.h>
#include <Poco/Crypto/Crypto.h>
#include <Poco/Crypto/CipherFactory.h>
#include <Poco/Crypto/Cipher.h>
#include <Poco/Crypto/RSAKey.h>
#include <Poco/Crypto/CryptoStream.h>

#include <QDropEvent>
#include <QMimeData>
#include <QDir>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::dragEnterEvent(QDragEnterEvent *e)
{
    if (e->mimeData()->hasUrls()) {
        e->acceptProposedAction();
    }
}

QString MainWindow::darwinPath()
{
    QString public_key = QDir::currentPath();
    public_key = public_key.left(public_key.lastIndexOf("/"));
    public_key = public_key.left(public_key.lastIndexOf("/"));
    public_key = public_key.left(public_key.lastIndexOf("/"));
    return public_key;
}

void MainWindow::dropEvent(QDropEvent *e)
{
    foreach (const QUrl &url, e->mimeData()->urls()) {
        ui->label->setText(url.toLocalFile());
    }
}

void MainWindow::on_pushButton_clicked()
{
    Poco::Crypto::CipherFactory &factory = Poco::Crypto::CipherFactory::defaultFactory();
    Poco::Crypto::Cipher* pCipher = factory.createCipher(Poco::Crypto::RSAKey(darwinPath().toStdString() + "/public_rsa.pem"));

    Poco::Crypto::CryptoTransform *pEncryptor = NULL;
    pEncryptor = pCipher->createEncryptor();

    Poco::FileOutputStream sink(darwinPath().toStdString() + "/encrypted.bin");
    Poco::Crypto::CryptoOutputStream encryptor(sink, pEncryptor);

    Poco::FileInputStream source(ui->label->text().toStdString());
    Poco::StreamCopier::copyStream(source, encryptor);

    // Always close output streams to flush all internal buffers
    encryptor.close();
    sink.close();
}
