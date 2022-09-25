#include <QApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QIcon>
#include <QtQml/qqmlextensionplugin.h>
#include <QFile>
#include <QDir>

Q_IMPORT_QML_PLUGIN(CoreUIPlugin)

int main(int argc, char *argv[])
{

    QApplication app(argc, argv);
    QIcon::setThemeName("CoreUI");

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
