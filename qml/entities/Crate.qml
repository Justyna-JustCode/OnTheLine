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

BaseObject {
    entityType: Statics.entityTypes.crate
    sizeModifier: Statics.sizes.crateSizeModifier

    QtObject {
        id: priv

        property bool beingPushed: false
    }

    collider {
        categories: Statics.entityCategories.crate

        fixedRotation: true

        linearDamping: priv.beingPushed ? 0 : Statics.behavior.crateLinearDumpling

        // restitution is bounciness - a wooden box doesn't bounce
        restitution: Statics.behavior.restitutionNoBounding

        fixture.onBeginContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.player) {
                priv.beingPushed = true
            }
        }
        fixture.onEndContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.player) {
                priv.beingPushed = false
            }
        }
    }

    MultiResolutionImage {
        anchors.fill: parent

        source: qrc("assets/game/crate.png")
    }

    CustomSoundEffect {
        active: collider.moving // playing if moving
        source: qrc("assets/sounds/push.wav")
    }
}
