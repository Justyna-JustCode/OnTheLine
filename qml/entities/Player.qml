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
    id: root

    property int velocity: 100
    readonly property alias moveController: moveController

    property bool active

    onActiveChanged: {
        priv.pushing = false;    // we need to update pushign manually
                                 // for a restart because end of contact is not called
        sprites.updateAction()
    }

    QtObject {
        id: priv

        property bool pushing: false

        onPushingChanged: sprites.updateAction()
    }

    entityType: Statics.entityTypes.player

    sizeModifier: Statics.sizes.playerSizeModifier

    collider {
        categories: Statics.entityCategories.player

        active: root.active

        linearVelocity: Qt.point(moveController.xAxis * velocity, moveController.yAxis * (-velocity))

        fixture.onBeginContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.crate) {
                priv.pushing = true
            }
        }
        fixture.onEndContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.crate) {
                priv.pushing = false
            }
        }
    }

    TwoAxisController {
        id: moveController

        onXAxisChanged: sprites.updateAction()
        onYAxisChanged: sprites.updateAction()
    }

    PlayerSpriteSequence {
        id: sprites

        anchors.fill: parent

        function updateAction() {
            if (!root.active) {
                currentAction = actions.cheer
                return
            }

            if (priv.pushing) {
                updatePush()
                return
            }

            updateMove()
        }

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

            return currentAction = actions.stand
        }

        function updatePush() {
            if (moveController.xAxis > 0) {
                currentAction = actions.pushRight
                return
            }
            if (moveController.xAxis < 0) {
                currentAction = actions.pushLeft
                return
            }
            if (moveController.yAxis > 0) {
                currentAction = actions.pushUp
                return
            }
            if (moveController.yAxis < 0) {
                currentAction = actions.pushDown
                return
            }

            return currentAction = actions.stand
        }
    }
}
