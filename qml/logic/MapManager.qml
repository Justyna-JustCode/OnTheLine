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
    readonly property alias mapData: mapData

    property QtObject priv: QtObject {
        readonly property var valid_lvl_regexp: /[01SPX]/g;

        property var _mapData: MapData {
            id: mapData
        }
    }

    function clear() {
        mapData.clear()
    }

    // levels format:
    // <height>x<width>
    // <row-secription>
    // <row-secription>
    //
    // available fields:
    // 0 - empty field / wall
    // 1 - floor
    // P - player starting position
    // S - crate starting position
    // X - crate destination position
    function load(dataBytes) {
        mapData.clear()

        var data = dataBytes.split('\n')

        var sizeData = data[0].split('x')
        if (sizeData.length !== 2) {
            console.warn("An invalid map size")
            return
        }

        var mapSize = Qt.size(sizeData[1], sizeData[0])
        if (data.length !== mapSize.height + 1) {
            console.warn("Map data height mismatch")
            return
        }

        var mapContent = []
        for (var idx = 1; idx <= mapSize.height; ++idx) {
            var rowData = data[idx]
            if (rowData.length !== mapSize.width) {
                console.warn("Map data width mismatch")
                return
            }
            if (!rowData.match(priv.valid_lvl_regexp)) {
                console.warn("Map data contains invalid characters")
                return
            }

            mapContent.push(rowData)
        }

        mapData.content = mapContent
    }
}
