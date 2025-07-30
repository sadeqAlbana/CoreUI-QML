#ifndef COREUI_H
#define COREUI_H

#include <QObject>
#include <QQuickAttachedPropertyPropagator>
#include <QQmlEngine>
#include <QColor>
class CoreUI : public QQuickAttachedPropertyPropagator
{
    Q_OBJECT
    QML_ELEMENT
    QML_ATTACHED(CoreUI)
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

       Primary = 0x5856d6,
       Secondary = 0x6b7785,
       Success = 0x1b9e3e,
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
        AccordionActive=0xebe9fb,
        BoxShadow = 0x40321fdb

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
    Q_INVOKABLE QColor rgba(const QColor &color, const int alpha);
    Q_INVOKABLE QColor blend(const QColor &a, const QColor &b, qreal factor) const;
    const QColor &primary() const;
    void setPrimary(const QColor &newPrimary);
    void resetPrimary();

    const QColor &accordionBorderFocus() const;
    void setAccordionBorderFocus(const QColor &newAccordionBorderFocus);

    const QColor &accordionActive() const;
    void setAccordionActive(const QColor &newAccordionActive);

    QColor boxShadow() const;
    void setBoxShadow(const QColor &newBoxShadow);

    int borderRadius() const;
    void setBorderRadius(int newBorderRadius);

    QColor danger() const;
    void setDanger(const QColor &newDanger);

    const QUrl &userIcon() const;
    void setUserIcon(const QUrl &newUserIcon);
    void resetUserIcon();

    Q_INVOKABLE void copyToClipBoard(const QVariant &data);

    QColor success() const;
    void setSuccess(const QColor &newSuccess);


protected:
    void attachedParentChange(QQuickAttachedPropertyPropagator *newParent, QQuickAttachedPropertyPropagator *oldParent);

signals:
    void borderWidthChanged();

    void mobileLayoutChanged();

    void primaryChanged();

    void accordionBorderFocusChanged();

    void accordionActiveChanged();

    void boxShadowChanged();

    void borderRadiusChanged();

    void dangerChanged();

    void userIconChanged();

    void successChanged();

private:
    int m_borderWidth=1;
    int m_borderRadius=6;

    Theme m_theme=ThemeLight;

    QColor m_primary;
    QColor m_danger;
    QColor m_success;


    QColor m_accordionBorderFocus;
    QColor m_accordionActive;
    QColor m_boxShadow;
    static QUrl m_userIcon;

    Q_PROPERTY(int borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
    Q_PROPERTY(bool mobileLayout READ mobileLayout NOTIFY mobileLayoutChanged)
    Q_PROPERTY(QColor primary READ primary WRITE setPrimary RESET resetPrimary NOTIFY primaryChanged)
    Q_PROPERTY(QColor accordionBorderFocus READ accordionBorderFocus WRITE setAccordionBorderFocus NOTIFY accordionBorderFocusChanged)
    Q_PROPERTY(QColor accordionActive READ accordionActive WRITE setAccordionActive NOTIFY accordionActiveChanged)
    Q_PROPERTY(QColor boxShadow READ boxShadow WRITE setBoxShadow NOTIFY boxShadowChanged)
    Q_PROPERTY(int borderRadius READ borderRadius WRITE setBorderRadius NOTIFY borderRadiusChanged)
    Q_PROPERTY(QColor danger READ danger WRITE setDanger NOTIFY dangerChanged)
    Q_PROPERTY(QUrl userIcon READ userIcon WRITE setUserIcon RESET resetUserIcon NOTIFY userIconChanged)
    Q_PROPERTY(QColor success READ success WRITE setSuccess NOTIFY successChanged)
};

#endif // COREUI_H
