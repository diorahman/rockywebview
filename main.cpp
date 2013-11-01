#include <QApplication>
#include <qdeclarative.h>
#include "qmlapplicationviewer.h"

#include "rockywebview.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    qmlRegisterType<QDeclarativeWebView>("RockyBars", 1, 0, "RockyWebView");

    QmlApplicationViewer viewer;
    viewer.addImportPath(QLatin1String("modules"));
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/customweb/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
