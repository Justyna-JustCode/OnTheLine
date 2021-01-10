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
    id: root
    entityType: Statics.entityTypes.target

    signal hit()

    // TODO: some real nice look
    Rectangle {
        anchors.fill: parent

        color: "white"
        radius: 4
    }

    collider {
        anchors.margins: (1 - Statics.sizes.targetActionSizeModifier)  / 2 * parent.width

        bodyType: Body.Static

        fixedRotation: true
        linearVelocity: Qt.point(0, 0)

        collidesWith: Statics.entityCategories.crate

        fixture.onBeginContact: {
            var otherBody = other.getBody()
            if (otherBody.target.entityType === Statics.entityTypes.crate) {
                root.hit()
            }
        }
    }
}
