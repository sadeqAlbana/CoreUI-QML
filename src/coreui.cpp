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

QColor CoreUI::color(const QColor &color)
{
    return QColor();
}

bool CoreUI::mobileLayout() const
{
    return false;
}

