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

import QtQuick 2.12

Item {
    // intput parameters
    property size mapSize: Qt.size(0, 0)

    // output data
    readonly property size worldSize: Qt.size(mapSize.width * fieldSize, mapSize.height * fieldSize)
    readonly property alias fieldSize: priv.fieldSize

    QtObject {
        id: priv
        // a field size is the biggest possible size of a single item, to fit a mapSize and worldSize
        readonly property real fieldSize: {
            if (mapSize.width === 0 || mapSize.height === 0 ||
                    width === 0 || height === 0) {
                return 0
            }


            // base size define possible width and height of a block
            var baseSize = Qt.size(width / mapSize.width, height / mapSize.height)

            // we need to take a smaller one to with both sizes
            return Math.min(baseSize.width, baseSize.height)
        }
    }
}
