#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontInfo>
#include <QQmlContext>
#include "tablemodel.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("sadeqTech");
    QCoreApplication::setApplicationName("CoreUIDemo");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    //QCoreApplication::setAttribute(Qt::AA_Use96Dpi);

    QGuiApplication app(argc, argv);

    auto font = app.font();
    QFontInfo fi(font.defaultFamily());
    font.setPixelSize(14);
    app.setFont(font);




    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("TableModel", new TableModel);

    engine.load(url);

    return app.exec();
}
