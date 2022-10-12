#include "coreui.h"
#include <QQmlEngine>
#include <QQmlContext>

CoreUI::CoreUI(QObject *parent)
    : QObject{parent}
{

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
    return QColor(clr);
}

