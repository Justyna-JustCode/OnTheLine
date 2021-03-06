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

import "constants"
import "scenes"
import "logic"
import "popups"

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
            name: "levels"
            PropertyChanges {
                target: levelsScene
                active: true
            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameScene
                active: true
            }
            PropertyChanges {
                target: backgroundMusic
                active: false
            }
        }
    ]

    state: "menu"

    function showMenu() {
        state = "menu"
    }
    function showAttribution() {
        attributionPopup.open()
    }
    function showAbout() {
        aboutPopup.open()
    }
    function showLevels() {
        state = "levels"
    }
    function startLevel(number) {
        levelsManager.loadLevel(number)

        state = "game"
    }
    function quit() {
        // TODO: add a confirmation?
        Qt.quit();
    }

    // scenes
    MainMenuScene {
        id: mainMenuScene

        onStartGameRequest: root.showLevels()
        onShowAttributionRequest: root.showAttribution()
        onShowAboutRequest: root.showAbout()
        onBackRequest: root.quit()
    }
    LevelsScene {
        id: levelsScene

        onLevelSelected: startLevel(number)
        onBackRequest: root.showMenu()
    }
    GameScene {
        id: gameScene

        onBackRequest: root.showLevels()
    }

    // popups
    // TODO: better solution for popups
    Scene {
        TutorialPopup {
            id: tutorialPopup
        }

        LevelSuccessPopup {
            id: successPopup

            onShowLevelsRequest: {
                gameScene.closeLevel()
                root.showLevels()
            }
        }

        AttributionPopup {
            id: attributionPopup
        }
        AboutPopup {
            id: aboutPopup
        }
    }

    // music
    BackgroundMusic {
        id: backgroundMusic
        property bool active: true

        onActiveChanged: {
            if (active) {
                play()
            } else {
                pause()
            }
        }

        source: qrc("assets/sounds/menu-background.mp3")
        volume: Style.behavior.backgroundMusicVolume
     }

    // logic
    LevelsManager {
        id: levelsManager
    }
    MapManager {
        id: mapManager
    }

    // global tools
    function qrc(relativePath) {
        return Style.qrc(relativePath)
    }
}
