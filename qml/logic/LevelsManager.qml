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
    readonly property int count: priv.levelsFiles.length   // number of available levels
    readonly property alias currentLevel: priv.currentIndex

    // details of a map for currently loaded level
    property size currentMapSize: Qt.size(0, 0)
    property var currentMapData: []

    // an internal private object
    property QtObject priv: QtObject {
        id: priv
        readonly property string levels_dir: "levels/";
        readonly property var valid_lvl_regexp: /[01SPX]/g;

        property var levelsFiles: []

        property int currentIndex: 0 // index of a current level
        property url currentPath: levelsFiles.length ? qrc(levels_dir + levelsFiles[currentLevel]) : ""

        function clearLevelData() {
            currentMapSize = Qt.size(0, 0)
            currentMapData = []
        }

        function loadLevelData() {
            clearLevelData()

            var levelDetails = fileUtils.readFile(currentPath).split('\n')
            if (!levelDetails.length) {
                console.warn("Level data missing, path:", currentPath)
                return
            }

            var sizeData = levelDetails[0].split('x')
            if (sizeData.length !== 2) {
                console.warn("An invalid level size, path:", currentPath)
                return
            }

            var mapSize = Qt.size(sizeData[0], sizeData[1])
            if (levelDetails.length !== mapSize.height + 1) {
                console.warn("Level data mismatch, path:", currentPath)
                return
            }

            var mapData = []
            for (var idx = 1; idx <= mapSize.height; ++idx) {
                var rowData = levelDetails[idx]
                if (!rowData.match(valid_lvl_regexp)) {
                    console.warn("Level data contains invalid characters, path:", currentPath)
                    return
                }

                mapData.push(rowData)
            }

            currentMapSize = mapSize
            currentMapData = mapData
        }
    }

    Component.onCompleted: initLevels()

    function initLevels() {
        priv.levelsFiles = fileUtils.listFiles(qrc(priv.levels_dir), "*.lvl");
    }

    function loadLevel(number) {
        if (number >= count) {
            console.warn("Wrong level number - cannot load.")
            priv.clearLevelData()
            return
        }

        priv.currentIndex = number
        priv.loadLevelData()
    }
}
