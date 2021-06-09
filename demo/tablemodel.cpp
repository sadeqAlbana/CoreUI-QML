#include "tablemodel.h"
#include <QDebug>
TableModel::TableModel(QObject *parent) : QAbstractTableModel(parent)
{
}

QHash<int, QByteArray> TableModel::roleNames() const
{

    return {
        {Qt::UserRole+1, "reference"},
        {Qt::UserRole+2, "date"},
        {Qt::UserRole+3, "application"},
        {Qt::UserRole+4, "amount"},
        {Qt::UserRole+5, "status"},
        {Qt::UserRole+6, "data"},
    };

}

QVariant TableModel::headerData(int section, Qt::Orientation orientation, int role) const
{

    if(orientation!=Qt::Horizontal)
        return QVariant();

    if(role!=Qt::DisplayRole)
        return QVariant();


    qDebug()<<"header data";
    QStringList list{"Username"  ,"Date registered"  , "Role" ,"Status" ,"Actions"} ;


    return list.value(section);

}

