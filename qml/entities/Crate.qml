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

BaseObject {
    entityType: Statics.entityTypes.crate

    sizeModifier: Statics.sizes.crateSizeModifier

    // TODO: some real nice look
    Rectangle {
        anchors.fill: parent

        color: "chocolate"
        radius: 4
    }

    collider {
        property bool collidingWithPlayer: false

        fixedRotation: true

        linearDamping: collidingWithPlayer ? 0 : Statics.behavior.crateLinearDumpling
        friction: Statics.behavior.crateFriction

        // restitution is bounciness - a wooden box doesn't bounce
        restitution: Statics.behavior.restitutionNoBounding

        fixture.onBeginContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.player) {
                collidingWithPlayer = true
            }
        }
        fixture.onEndContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.player) {
                collidingWithPlayer = false
            }
        }
    }
}
