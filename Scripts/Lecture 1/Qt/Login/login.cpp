#include "login.h"
#include <QDebug>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>

Login::Login(QObject *parent):QObject(parent)
{

}

void Login::checkInfo(QString nameToCheck, QString pwToCheck)
{
    bool success = false;

    QSqlDatabase database = QSqlDatabase::addDatabase("QSQLITE");
    database.setDatabaseName("database.db");
    database.setUserName("root");
    database.setPassword("123456");
    if(database.open())
    {
        QSqlQuery query;
        query.exec("CREATE TABLE Login"
                   "(Name CHAR(20) PRIMARY KEY,"
                   " PW CHAR(8) NOT NULL)");
        query.exec("INSERT INTO Login(Name,PW)"
                   "VALUES('Ji','12345')");
        query.exec("INSERT INTO Login(Name,PW)"
                   "VALUES('Wang','23456')");
        query.exec("INSERT INTO Login(Name,PW)"
                   "VALUES('Zhou','34567')");

        query.exec("SELECT * FROM Login");
        while(query.next())
        {
            QString name = query.value(0).toString();
            QString pw = query.value(1).toString();
            if (nameToCheck == name && pwToCheck == pw)
                success = true;
        }
    }

    emit showResult(success);
}

void Login::quitPro()
{
    exit(0);
}
