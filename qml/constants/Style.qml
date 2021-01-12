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

pragma Singleton
import QtQuick 2.12

QtObject {
    // tools
    // (we need to define it here to be able to use it for fonts)
    property url appPath: Qt.resolvedUrl("../../")
    property bool isLiveMode: (typeof felgoLiveEngine !== "undefined")

    function qrc(relativePath) {
        if (!isLiveMode && DELIVERY_BUILD) {
            return "qrc:" + relativePath;
        }

        return appPath + relativePath;
    }

    // values
    readonly property QtObject sizes: QtObject {
        readonly property real padding: 5
        readonly property real bigPadding: 10

        readonly property real margin: 15
        readonly property real bigMargin: 30

        readonly property real hugeBorder: 7

        readonly property real defaultButtonSize: 40
    }

    readonly property QtObject behavior: QtObject {
        readonly property int menuFadeTime: 300
        readonly property real backgroundMusicVolume: 0.2
        readonly property real soundEffectVolume: 0.3
    }

    readonly property QtObject compontents: QtObject {
        readonly property size controlSize: Qt.size(100, 100)
        readonly property real controlOpacity: 0.7
    }

    // colors
    readonly property QtObject colors: QtObject {
        readonly property color buttonFont: "white"
    }

    // fonts
    readonly property QtObject fonts: QtObject {
        readonly property int defaultSize: 16
        readonly property int buttonSize: 26
        readonly property int headerSize: 48

        readonly property var defaultFont: FontLoader {
            source: qrc("assets/fonts/rough-typewriter.otf")
        }
        readonly property var headerFont: FontLoader {
            source: qrc("assets/fonts/basica-industrial-free-promo.ttf")
        }
    }
}
