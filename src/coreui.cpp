#include "coreui.h"
#include <QQmlEngine>
#include <QQmlContext>

CoreUI::CoreUI(QObject *parent)
    : QObject{parent}
{
    m_primary=QRgb(CoreUI::Primary);
    m_accordionBorderFocus=QRgb(CoreUI::AccordionFocusBorder);
    m_accordionActive=QRgb(CoreUI::AccordionActive);

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

