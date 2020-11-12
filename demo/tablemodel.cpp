#include "tablemodel.h"
#include <QDebug>
TableModel::TableModel(QObject *parent) : QAbstractTableModel(parent)
{
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

