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
import QtQuick 2.0

import "../constants"

Column {
    anchors {
        right: parent.right
        rightMargin: Style.sizes.margin
        bottom: parent.bottom
    }

    spacing: -30

    AnimatedSprite {
        width: 100
        height: 100
        z: 1

        frameCount: 2
        frameWidth: 192
        frameHeight: 200
        frameRate: Statics.behavior.slowFrameRate

        loops: 1  // just one run

        source: qrc("assets/game/sprites/player/player-cheer.png")

        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: parent.restart()
        }
    }
    MultiResolutionImage {
        width: 100
        height: 100

        source: qrc("assets/game/crate.png")
    }
}
