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

import "scenes"

GameWindow {
    id: root

    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: mainMenuScene
                active: true
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameScene
                active: true
            }
        }
    ]

    state: "menu"

    function startGame() {
        state = "game"
    }
    function quitGame() {
        // TODO: add a confirmation?
        Qt.quit();
    }

    MainMenuScene {
        id: mainMenuScene

        onStartGame: root.startGame()
        onQuitGame: root.quitGame()
    }
    GameScene {
        id: gameScene
    }

    // global tools
    readonly property url mainQmlPath: Qt.resolvedUrl("./")
    function isLiveMode() {
        return typeof felgoLiveEngine !== "undefined";
    }
    function qrc(relativePath) {
        if (!isLiveMode() && DELIVERY_BUILD) {
            return "qrc:" + relativePath;
        }
        console.log(mainQmlPath + "../" + relativePath)
        return mainQmlPath + "../" + relativePath;
    }
}
