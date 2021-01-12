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
import "../components"
import "../entities/sprites"

BaseObject {
    id: root

    property int velocity: 100
    readonly property alias moveController: moveController

    property bool active
    onActiveChanged: {
        if (active == false) {
            priv.touching = false;    // we need to update pushign manually
                                     // for a restart because end of contact is not called
        } else {
            priv.cheering = false;  // we need stop cheering for next level
        }

        priv.updateState()
    }

    function cheer() {
        priv.cheering = true
        priv.updateState()
    }


    QtObject {
        id: priv

        property bool cheering: false
        property bool touching: false
        readonly property bool pushing: touching && walking
        readonly property bool walking: moveController.moving

        property int walkAction: {
            if (moveController.xAxis > 0) {
                return sprites.actions.walkRight
            }
            if (moveController.xAxis < 0) {
                return sprites.actions.walkLeft
            }
            if (moveController.yAxis > 0) {
                return sprites.actions.walkUp
            }
            if (moveController.yAxis < 0) {
                return sprites.actions.walkDown
            }

            return -1
        }
        property int pushAction: {
            if (moveController.xAxis > 0) {
                return sprites.actions.pushRight
            }
            if (moveController.xAxis < 0) {
                return sprites.actions.pushLeft
            }
            if (moveController.yAxis > 0) {
                return sprites.actions.pushUp
            }
            if (moveController.yAxis < 0) {
                return sprites.actions.pushDown
            }

            return -1
        }

        onPushingChanged: priv.updateState()
        onWalkingChanged: priv.updateState()


        // if pushing -> "pushing"
        // if moving -> "walking"
        // else -> "idle"
        function updateState() {
            if (priv.cheering) {
                state = "cheering"
                return
            }

            if (priv.pushing) {
                state = "pushing"
                return
            }

            if (priv.walking) {
                state = "walking"
                return
            }

            state = "idle"
        }
    }

    states: [
        State {
            name: "idle"

            PropertyChanges { target: sprites; currentAction: actions.stand }
        },
        State {
            name: "walking"
            PropertyChanges { target: sprites; currentAction: priv.walkAction }
            PropertyChanges { target: walkingSound; active: true  }
        },
        State {
            name: "pushing"
            PropertyChanges { target: sprites; currentAction: priv.pushAction }
            PropertyChanges { target: walkingSound; active: true  }
        },
        State {
            name: "cheering"
            PropertyChanges { target: sprites; currentAction: actions.cheer }
            PropertyChanges { target: cheerSound; active: true  }
        }
    ]
    state: "idle"

    entityType: Statics.entityTypes.player

    sizeModifier: Statics.sizes.playerSizeModifier

    collider {
        categories: Statics.entityCategories.player

        active: root.active

        linearVelocity: Qt.point(moveController.xAxis * velocity, moveController.yAxis * (-velocity))

        fixture.onBeginContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.crate) {
                priv.touching = true
            }
        }
        fixture.onEndContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.crate) {
                priv.touching = false
            }
        }
    }

    TwoAxisController {
        id: moveController
        readonly property bool moving: (xAxis!== 0) || (yAxis!== 0)
    }

    PlayerSpriteSequence {
        id: sprites

        anchors.fill: parent
    }

    // sounds
    CustomSoundEffect {
        id: walkingSound

        source: qrc("assets/sounds/walk.wav")
    }
    CustomSoundEffect {
        id: cheerSound

        loops: 0    // not to loop, just play once
        source: qrc("assets/sounds/cheer.wav")
    }
}
