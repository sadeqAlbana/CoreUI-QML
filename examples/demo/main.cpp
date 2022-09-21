#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QtQml/qqmlextensionplugin.h>
Q_IMPORT_QML_PLUGIN(CoreUIPlugin)
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral(":/"));
    const QUrl url(u"qrc:/Demo/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
