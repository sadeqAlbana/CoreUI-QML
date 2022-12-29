#include "coreui.h"
#include <QClipboard>
#include <QQmlEngine>
#include <QQmlContext>
#include <QGuiApplication>
CoreUI::CoreUI(QObject *parent)
    : QObject{parent}
{
    m_primary=QRgb(CoreUI::Primary);
    m_danger=QRgb(CoreUI::Danger);

    m_accordionBorderFocus=QRgb(CoreUI::AccordionFocusBorder);
    m_accordionActive=QRgb(CoreUI::AccordionActive);
    m_boxShadow = color(CoreUI::BoxShadow);

}

int CoreUI::borderWidth() const
{
    return m_borderWidth;
}

void CoreUI::setBorderWidth(int newBorderWidth)
{
    if (m_borderWidth == newBorderWidth)
        return;
    m_borderWidth = newBorderWidth;
    emit borderWidthChanged();
}


bool CoreUI::mobileLayout() const
{
    return false;
}

QColor CoreUI::color(const Color clr)
{
    return ((clr >> 24) | 0)? QColor::fromRgba(clr) : QColor(clr);
}

const QColor &CoreUI::primary() const
{
    return m_primary;
}

void CoreUI::setPrimary(const QColor &newPrimary)
{
    if (m_primary == newPrimary)
        return;
    m_primary = newPrimary;
    emit primaryChanged();
}

void CoreUI::resetPrimary()
{
    setPrimary({}); // TODO: Adapt to use your actual default value
}

const QColor &CoreUI::accordionBorderFocus() const
{
    return m_accordionBorderFocus;
}

void CoreUI::setAccordionBorderFocus(const QColor &newAccordionBorderFocus)
{
    if (m_accordionBorderFocus == newAccordionBorderFocus)
        return;
    m_accordionBorderFocus = newAccordionBorderFocus;
    emit accordionBorderFocusChanged();
}

const QColor &CoreUI::accordionActive() const
{
    return m_accordionActive;
}

void CoreUI::setAccordionActive(const QColor &newAccordionActive)
{
    if (m_accordionActive == newAccordionActive)
        return;
    m_accordionActive = newAccordionActive;
    emit accordionActiveChanged();
}

QColor CoreUI::boxShadow() const
{
    return m_boxShadow;
}

void CoreUI::setBoxShadow(const QColor &newBoxShadow)
{
    if (m_boxShadow == newBoxShadow)
        return;
    m_boxShadow = newBoxShadow;
    emit boxShadowChanged();
}

int CoreUI::borderRadius() const
{
    return m_borderRadius;
}

void CoreUI::setBorderRadius(int newBorderRadius)
{
    if (m_borderRadius == newBorderRadius)
        return;
    m_borderRadius = newBorderRadius;
    emit borderRadiusChanged();
}

QColor CoreUI::danger() const
{
    return m_danger;
}

void CoreUI::setDanger(const QColor &newDanger)
{
    if (m_danger == newDanger)
        return;
    m_danger = newDanger;
    emit dangerChanged();
}

const QUrl &CoreUI::userIcon() const
{
    return m_userIcon;
}

void CoreUI::setUserIcon(const QUrl &newUserIcon)
{
    if (m_userIcon == newUserIcon)
        return;
    m_userIcon = newUserIcon;
    emit userIconChanged();
}

void CoreUI::resetUserIcon()
{
    setUserIcon({}); // TODO: Adapt to use your actual default value
}

void CoreUI::copyToClipBoard(const QVariant &data)
{
    QClipboard *clipboard = QGuiApplication::clipboard();
    if(data.typeId()==QMetaType::QString){
        clipboard->setText(data.toString());
    }
}


