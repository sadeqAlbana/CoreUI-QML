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
    enum Theme{
        ThemeLight,
        ThemeDark
    };

    //create shade enum?


    //you must change these to properties !
    enum Color{
        Blue = 0x0d6efd,
        Indigo  = 0x6610f2,
        Purple = 0x6f42c1,
        Pink  = 0xd63384,
        Red  = 0xdc3545,
        Orange  = 0xfd7e14,
        Yellow  = 0xffc107,
        Green  = 0x198754,
        Teal  = 0x20c997,
        Cyan  = 0x0dcaf0,
        Black  = 0x000015,
        White  = 0xfff,
        Gray  = 0x8a93a2,

        Graydark = 0x636f83,
        Gray100 = 0xebedef,
        Gray200 = 0xd8dbe0,
        Gray300 = 0xc4c9d0,
        Gray400 = 0xb1b7c1,
        Gray500 = 0x9da5b1,
        Gray600 = 0x8a93a2,
        Gray700 = 0x768192,
        Gray800 = 0x636f83,
        Gray900 = 0x4f5d73,

       Primary = 0x321fdb,
       Secondary = 0x9da5b1,
       Success = 0x2eb85c,
       Info = 0x39f,
       Warning = 0xf9b115,
       Danger = 0xe55353,
       Light = 0xebedef,
       Dark = 0x4f5d73,

        BorderColor = 0xd8dbe0,

        //headingColor = unset
        LinkColor = 0x321fdb,
        LinkHovercolor = 0x2819af,
        CodeColor = 0xd63384,
        HighlightBg = 0xfff3cd,
        Tab = 0xF9FAFA,
        CardHeader = 0xF7F7F7, //set it to #00001508,
        AccordionFocusBorder=0x998fed,
        AccordionActive=0xebe9fb

    };
    Q_ENUM(Color)

    Q_INVOKABLE explicit CoreUI(QObject *parent = nullptr);
    int borderWidth() const;
    void setBorderWidth(int newBorderWidth);

    static CoreUI *qmlAttachedProperties(QObject *object)
    {
        return new CoreUI(object);
    }

    bool mobileLayout() const;
    void setMobileLayout(bool newMobileLayout);

    Q_INVOKABLE QColor color(const CoreUI::Color clr);


    const QColor &primary() const;
    void setPrimary(const QColor &newPrimary);
    void resetPrimary();

    const QColor &accordionBorderFocus() const;
    void setAccordionBorderFocus(const QColor &newAccordionBorderFocus);

    const QColor &accordionActive() const;
    void setAccordionActive(const QColor &newAccordionActive);

signals:
    void borderWidthChanged();

    void mobileLayoutChanged();

    void primaryChanged();

    void accordionBorderFocusChanged();

    void accordionActiveChanged();

private:
    int m_borderWidth=1;
    Theme m_there=ThemeLight;

    QColor m_primary;
    QColor m_accordionBorderFocus;
    QColor m_accordionActive;
    Q_PROPERTY(int borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
    Q_PROPERTY(bool mobileLayout READ mobileLayout NOTIFY mobileLayoutChanged)
    Q_PROPERTY(QColor primary READ primary WRITE setPrimary RESET resetPrimary NOTIFY primaryChanged)
    Q_PROPERTY(QColor accordionBorderFocus READ accordionBorderFocus WRITE setAccordionBorderFocus NOTIFY accordionBorderFocusChanged)
    Q_PROPERTY(QColor accordionActive READ accordionActive WRITE setAccordionActive NOTIFY accordionActiveChanged)
};

#endif // COREUI_H
