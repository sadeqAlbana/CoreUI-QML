#ifndef COREUI_H
#define COREUI_H

#include <QObject>
#include <QQmlEngine>
#include <QColor>
class CoreUI : public QObject
{
    Q_OBJECT
    QML_ATTACHED(CoreUI)
    QML_ELEMENT

public:
    enum  Theme{
        ThemeLight,
        ThemeDark
    };

    //create shade enum?

    enum  Color{
        BrandPrimary,
        BrandSecondary,
        BrandSuccess,
        BrandDanger,
        BrandWarning,
        BrandInfo,
        BrandLight,
        BrandDark
    };



    Q_INVOKABLE explicit CoreUI(QObject *parent = nullptr);
    int borderWidth() const;
    void setBorderWidth(int newBorderWidth);

    Q_INVOKABLE QColor color(const QColor &color);
    static CoreUI *qmlAttachedProperties(QObject *object)
    {
        return new CoreUI(object);
    }

signals:
    void borderWidthChanged();

private:
    int m_borderWidth=0;
    Theme m_there=ThemeLight;


    Q_PROPERTY(int borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
};

#endif // COREUI_H
