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

import Felgo 3.0
import QtQuick 2.12
import QtQuick.Controls 2.12

import "../../logic"
import "../../constants"

Grid {
    id: root
    property MapData mapData
    property real fieldSize

    columns: mapData.size.width
    rows: mapData.size.height

    Repeater {
        model: root.columns * root.rows // number of all fields

        MultiResolutionImage {
            width: fieldSize
            height: fieldSize

            source: qrc("assets/game/floor.png")
        }
    }
}
