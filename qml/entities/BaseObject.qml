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

EntityBase {
    property real blockSize // a size of a single field (see WorldData)

    property point pos: Qt.size(0, 0)    // defines an object position an a map fields (see MapData)
    property real sizeModifier: 1   // defines an object size in a realtion to field size

    readonly property alias collider: collider

    x: pos.x * blockSize
    y: pos.y * blockSize

    width: blockSize * sizeModifier
    height: blockSize * sizeModifier

    BoxCollider {
        id: collider
        anchors.fill: parent
    }
}
