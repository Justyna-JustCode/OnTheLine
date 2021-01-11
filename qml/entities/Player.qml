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

import "../constants"
import "../entities/sprites"

BaseObject {
    property int velocity: 100
    readonly property alias moveController: moveController

    entityType: Statics.entityTypes.player

    sizeModifier: Statics.sizes.playerSizeModifier

    collider {
        categories: Statics.entityCategories.player

        linearVelocity: Qt.point(moveController.xAxis * velocity, moveController.yAxis * (-velocity))
    }

    TwoAxisController {
        id: moveController

        onXAxisChanged: sprites.updateMove()
        onYAxisChanged: sprites.updateMove()
    }

    PlayerSpriteSequence {
        id: sprites

        anchors.fill: parent

        function updateMove() {
            if (moveController.xAxis > 0) {
                currentAction = actions.walkRight
                return
            }
            if (moveController.xAxis < 0) {
                currentAction = actions.walkLeft
                return
            }
            if (moveController.yAxis > 0) {
                currentAction = actions.walkUp
                return
            }
            if (moveController.yAxis < 0) {
                currentAction = actions.walkDown
                return
            }

            currentAction = actions.stand
        }
    }
}
