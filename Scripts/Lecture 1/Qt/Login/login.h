#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QString>
#include <QVariant>

class Login : public QObject
{
    Q_OBJECT

public:
    Login(QObject *parent = 0);
signals:
    void showResult(QVariant success);
public slots:
    void checkInfo(QString nameToCheck, QString pwToCheck);
    void quitPro();
};

#endif // LOGIN_H
