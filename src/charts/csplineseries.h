#ifndef CSPLINESERIES_H
#define CSPLINESERIES_H

#include <QObject>
#include <QSplineSeries>
#include <QQmlEngine>
class CSplineSeries : public QSplineSeries
{
    Q_OBJECT
    QML_ELEMENT
public:
    Q_INVOKABLE explicit CSplineSeries(QObject *parent = nullptr);

signals:
};

#endif // CSPLINESERIES_H
