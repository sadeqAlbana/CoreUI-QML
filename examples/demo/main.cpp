#include <QApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QIcon>
#include <QtQml/qqmlextensionplugin.h>
#include <QFile>
#include <QDir>
#include <QFont>
#include <QFontDatabase>

Q_IMPORT_QML_PLUGIN(CoreUIPlugin)

int main(int argc, char *argv[])
{
    //#ifndef Q_OS_ANDROID
       // qputenv("QT_FONT_DPI","96");
    //#endif


    //#ifndef Q_OS_ANDROID
        QApplication::setAttribute(Qt::AA_Use96Dpi);
    //#endif
    QApplication app(argc, argv);
    QIcon::setThemeName("CoreUI");
    QFont font=QApplication::font();
    //font.setFamily("Segoe UI");
    font.setFamilies({
                     "Segoe UI"
                     "Helvetica Neue",
                     "Noto Sans",
                     "Liberation Sans",
                     "Arial",
                     "sans-serif",
                     "Apple Color Emoji",
                     "Segoe UI Emoji",
                     "Segoe UI Symbol",
                     "Noto Color Emoji"});
    font.setWeight(QFont::Weight::Normal);
    font.setPixelSize(16);
    QApplication::setFont(font);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral(":/"));
    engine.addImportPath(QStringLiteral(":/qml"));

    const QUrl url(u"qrc:/Demo/main.qml"_qs);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
