#include "coreui.h"

//static QQuickMaterialStyle::Theme globalTheme = QQuickMaterialStyle::Light;
//static uint globalPrimary = QQuickMaterialStyle::Indigo;
//static uint globalAccent = QQuickMaterialStyle::Pink;
static uint globalForeground = 0xDD000000; // primaryTextColorLight
static uint globalBackground = 0xFFFAFAFA; // backgroundColorLight
// These represent whether a global foreground/background was set.
// Each style's m_hasForeground/m_hasBackground are initialized to these values.
static bool hasGlobalForeground = false;
static bool hasGlobalBackground = false;
// These represent whether or not the global color value was specified as one of the
// values that QColor accepts, as opposed to one of the pre-defined colors like Red.
static bool globalPrimaryCustom = false;
static bool globalAccentCustom = false;
static bool globalForegroundCustom = true;
static bool globalBackgroundCustom = true;
// This is global because:
// 1) The theme needs access to it to determine font sizes.
// 2) There can only be one variant used for the whole application.
//static QQuickMaterialStyle::Variant globalVariant = QQuickMaterialStyle::Normal;

static const QRgb backgroundColorLight = 0xFFFAFAFA;
static const QRgb backgroundColorDark = 0xFF303030;
static const QRgb dialogColorLight = 0xFFFFFFFF;
static const QRgb dialogColorDark = 0xFF424242;
static const QRgb primaryTextColorLight = 0xDD000000;
static const QRgb primaryTextColorDark = 0xFFFFFFFF;
static const QRgb secondaryTextColorLight = 0x89000000;
static const QRgb secondaryTextColorDark = 0xB2FFFFFF;
static const QRgb hintTextColorLight = 0x60000000;
static const QRgb hintTextColorDark = 0x4CFFFFFF;
static const QRgb dividerColorLight = 0x1E000000;
static const QRgb dividerColorDark = 0x1EFFFFFF;
static const QRgb iconColorLight = 0x89000000;
static const QRgb iconColorDark = 0xFFFFFFFF;
static const QRgb iconDisabledColorLight = 0x42000000;
static const QRgb iconDisabledColorDark = 0x4CFFFFFF;
static const QRgb raisedButtonColorLight = 0xFFD6D7D7;
static const QRgb raisedButtonColorDark = 0x3FCCCCCC;
static const QRgb raisedButtonDisabledColorLight = dividerColorLight;
static const QRgb raisedButtonDisabledColorDark = dividerColorDark;
static const QRgb frameColorLight = hintTextColorLight;
static const QRgb frameColorDark = hintTextColorDark;
static const QRgb switchUncheckedTrackColorLight = 0x42000000;
static const QRgb switchUncheckedTrackColorDark = 0x4CFFFFFF;
static const QRgb switchDisabledTrackColorLight = 0x1E000000;
static const QRgb switchDisabledTrackColorDark = 0x19FFFFFF;
static const QRgb rippleColorLight = 0x10000000;
static const QRgb rippleColorDark = 0x20FFFFFF;
static const QRgb spinBoxDisabledIconColorLight = 0xFFCCCCCC;
static const QRgb spinBoxDisabledIconColorDark = 0xFF666666;
static const QRgb sliderDisabledColorLight = 0xFF9E9E9E;
static const QRgb sliderDisabledColorDark = 0xFF616161;

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
