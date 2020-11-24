#ifndef TABLEMODEL_H
#define TABLEMODEL_H



#include <QAbstractTableModel>
#include <QDebug>
class TableModel : public QAbstractTableModel
{
    Q_OBJECT
//    QML_ELEMENT
//    QML_ADDED_IN_MINOR_VERSION(1)

public:

    explicit TableModel (QObject *parent=nullptr);
    int rowCount(const QModelIndex & = QModelIndex()) const override
    {
        return 100;
    }

    int columnCount(const QModelIndex & = QModelIndex()) const override
    {
        return 2;
    }

    QVariant data(const QModelIndex &index, int role) const override
    {
        //qDebug()<<"data requested " << index <<" " << role;
        switch (role) {
            case Qt::DisplayRole:
                return QString("%1, %2").arg(index.column()).arg(index.row());
//        case Qt::UserRole+1:
//            return index.row();
            default:
                break;
        }

        return QVariant();
    }

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;



};
#endif // TABLEMODEL_H
