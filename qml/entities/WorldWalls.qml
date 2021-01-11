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

import "../constants"

Item {
    readonly property int wallThick: Statics.sizes.outsideWallThick
    property size worldSize

    // TODO: improve with repeater, move more logic to Wall
    Wall {
        entityId: "leftWorldWall"
        isHorizontal: false

        x: -wallThick; y: -wallThick
        width: wallThick; height: worldSize.height + wallThick
    }

    Wall {
        entityId: "rightWorldWall"
        isHorizontal: false

        x: worldSize.width; y: -wallThick
        width: wallThick; height: worldSize.height + wallThick
    }

    Wall {
        entityId: "topWorldWall"
        isHorizontal: true

        x: -wallThick; y: -wallThick
        width: worldSize.width + wallThick; height: wallThick
    }

    Wall {
        entityId: "bottomWorldWall"
        isHorizontal: true

        x: -wallThick; y: worldSize.height
        width: worldSize.width + wallThick; height: wallThick
    }
}
