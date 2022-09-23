#ifndef TEST_H
#define TEST_H

#include <QObject>
#include <QQmlEngine>
class Test : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Test(QObject *parent = nullptr);

signals:

};

#endif // TEST_H
