#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>

#include "login.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    Login login;
    QQuickView viewer(QUrl(QStringLiteral("qrc:/main.qml")));
    QQuickItem *rootObject = viewer.rootObject();
    QObject::connect(rootObject,SIGNAL(btnLoginClicked(QString,QString)),&login,SLOT(checkInfo(QString,QString)));
    QObject::connect(rootObject,SIGNAL(btnQuitClicked()),&login,SLOT(quitPro()));
    QObject::connect(&login,SIGNAL(showResult(QVariant)),rootObject,SLOT(showResultMsg(QVariant)));
    viewer.show();

    return app.exec();
}
