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

QtObject {
    property QtObject priv: QtObject {
        readonly property string blocker_indicator: "1"
        readonly property string player_indicator: 'P'
        readonly property string crate_indicator: 'S'
        readonly property string target_indicator: 'X'

        function findItemPos(field_indicator) {
            if (size.width === 0 || size.height === 0) {
                return Qt.point(0, 0)
            }

            var rowIdx = content.findIndex(function(array, idx) {
                return array.includes(field_indicator);
            });
            if (rowIdx < 0) {
                console.warn("Field not found on a map:", field_indicator)
                return Qt.point(0, 0)
            }

            var colIdx = content[rowIdx].indexOf(field_indicator)
            if (colIdx < 0) {
                console.warn("Field not found on a map:", field_indicator)
                return Qt.point(0, 0)
            }

            return Qt.point(colIdx, rowIdx)
        }
    }

    readonly property size size: Qt.size(content.length ? content[0].length : 0, content.length)
    property var content: []

    readonly property point playerPos: priv.findItemPos(priv.player_indicator)
    readonly property point cratePos: priv.findItemPos(priv.crate_indicator)
    readonly property point targetPos: priv.findItemPos(priv.target_indicator)

    readonly property var blockerFields: {
        var blockersList = []

        for (var row = 0; row < size.height; ++row) {
            for (var col = 0; col < size.width; ++col) {
                if (content[row][col] === priv.blocker_indicator) {
                    blockersList.push(Qt.point(col, row))
                }
            }
        }
        return blockersList
    }

    function clear() {
        content = []
    }
}
