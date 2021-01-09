#include <QApplication>
#include <FelgoApplication>

#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
  QApplication app(argc, argv);
  FelgoApplication felgo;

  // Use platform-specific fonts instead of Felgo's default font
  felgo.setPreservePlatformFonts(true);

  QQmlApplicationEngine engine;
  felgo.initialize(&engine);

  /* A different method of using qml files is used for a delivery build
   * and a working build in order to achieve faster compilation.
   * See the pro file for more details.
   */
#ifdef DELIVERY_BUILD
  felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));
#else
  felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
#endif

  engine.load(QUrl(felgo.mainQmlFileName()));
  return app.exec();
}
