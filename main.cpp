/********************************************
** On the line!
** Copyright 2021 Justyna JustCode
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 3 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program. If not, see <http://www.gnu.org/licenses/>.
**
********************************************/

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
