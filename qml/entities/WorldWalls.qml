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

Item {
    readonly property int wallThick: 1
    property size worldSize

    InvisibleBlocker {
        entityId: "leftWorldWall"
        entityType: "wall"

        x: -wallThick; y: -wallThick
        width: wallThick; height: worldSize.height + wallThick
    }

    InvisibleBlocker {
        entityId: "rightWorldWall"
        entityType: "wall"

        x: worldSize.width; y: -wallThick
        width: wallThick; height: worldSize.height + wallThick
    }

    InvisibleBlocker {
        entityId: "topWorldWall"
        entityType: "wall"

        x: -wallThick; y: -wallThick
        width: worldSize.width + wallThick; height: wallThick
    }

    InvisibleBlocker {
        entityId: "bottomWorldWall"
        entityType: "wall"

        x: -wallThick; y: worldSize.height
        width: worldSize.width + wallThick; height: wallThick
    }
}
