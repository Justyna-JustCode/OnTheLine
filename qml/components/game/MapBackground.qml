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
import QtQuick.Controls 2.12

import "../../logic"
import "../../styles"

Grid {
    id: root
    property var mapData: ({})

    // a block size if the biggest possible size of a single item, to fit the mapData
    readonly property real blockSize: {
        if (!mapData.size ||
                mapData.size.width === 0 ||
                mapData.size.height === 0) {
            return 0
        }

        // base size define possible width and height of a block
        var baseSize = Qt.size(parent.width / mapData.size.width, parent.height / mapData.size.height)

        // we need to take a smaller one to with both sizes
        return Math.min(baseSize.width, baseSize.height)
    }

    anchors.centerIn: parent

    columns: mapData.size ? mapData.size.width : 0
    rows: mapData.size ? mapData.size.width : 0

    Repeater {
        model: root.columns * root.rows // number of all blocks

        // TODO: real nice look
        Rectangle {
            readonly property int row: index / root.columns
            readonly property int column: index - root.columns * row
            readonly property bool isEmpty: root.mapData.content[row][column] === '0'   // in a level description 0 means empty field

            width: blockSize
            height: blockSize

            opacity: isEmpty ? 0 : 1

            color: "gray"
            border {
                width: 2
                color: "white"
            }
        }
    }
}
