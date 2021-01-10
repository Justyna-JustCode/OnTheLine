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

    // an internal private object
    property QtObject priv: QtObject {
        id: priv
        readonly property string levels_dir: "levels/";
        readonly property string level_ext: "lvl";

        property var levelsFiles: []

        property int currentIndex: 0 // index of a current level
        property url currentPath: levelsFiles.length ? qrc(levels_dir + levelsFiles[currentLevel]) : ""

        function clearLevelData() {
            mapManager.clear()
        }

        function loadLevelData() {
            var levelData = fileUtils.readFile(currentPath)
            if (!levelData.length) {
                console.warn("Level data missing, path:", currentPath)
                return
            }

            mapManager.load(levelData)
        }
    }

    Component.onCompleted: initLevels()

    function initLevels() {
        priv.levelsFiles = fileUtils.listFiles(qrc(priv.levels_dir), "*." + priv.level_ext);
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

    function reload() {
        priv.clearLevelData()
        loadLevel(currentLevel)
    }
}
