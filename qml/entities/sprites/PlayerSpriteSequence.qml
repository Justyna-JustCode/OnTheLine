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

import "../../constants"

SpriteSequence {
    id: root

    readonly property QtObject actions: QtObject {
        property int stand: 0
        property int walkRight: 1
        property int walkLeft: 2
        property int walkUp: 3
        property int walkDown: 4
    }

    property int currentAction: actions.stand

    onCurrentActionChanged: jumpTo(priv.nameForAction(currentAction))

    property var priv: QtObject {
        function nameForAction(action) {
            switch (action) {
            case actions.stand:
                return "stand"
            case actions.walkRight:
                return "walkRight"
            case actions.walkLeft:
                return "walkLeft"
            case actions.walkUp:
                return "walkUp"
            case actions.walkDown:
                return "walkDown"
            }
            return "unknown"
        }
    }

    // TODO: check again if repeater can be used here
    PlayerSprite {
        name: priv.nameForAction(actions.stand)
    }
    PlayerSprite {
        name: priv.nameForAction(actions.walkRight)
        frameCount: 8
    }
    PlayerSprite {
        name: priv.nameForAction(actions.walkLeft)
        frameCount: 8
    }
    PlayerSprite {
        name: priv.nameForAction(actions.walkUp)
        frameCount: 2
    }
    PlayerSprite {
        name: priv.nameForAction(actions.walkDown)
        frameCount: 2
    }
}
