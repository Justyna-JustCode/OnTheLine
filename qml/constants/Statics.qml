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

pragma Singleton

import Felgo 3.0
import QtQuick 2.12

QtObject {
    readonly property QtObject sizes: QtObject {
        readonly property real playerSizeModifier: 0.7  // defines player size in relation to a field size
        readonly property real crateSizeModifier: 0.8   // defines crate size in relation to a field size

        readonly property real targetActionSizeModifier: 0.2  // defines target collision reagion size
                                                              // in relation to a field size

        readonly property real outsideWallThick: 10  // defines a size of wall around the game play
    }

    readonly property QtObject behavior: QtObject {
        readonly property real restitutionNoBounding: 0  // a value of resitution that make object not bouncy

        readonly property real crateLinearDumpling: 30  // defines how fast crate will slow and stop after a contact
        readonly property real crateFriction: 0.01      // defines a friction between crate and other objects

        // values of frame count for sprite
        readonly property int slowFrameRate: 10;
        readonly property int defaultFrameRate: 16;
    }

    readonly property QtObject entityTypes: QtObject {
        readonly property string invisibleObject: "player"
        readonly property string wall: "wall"
        readonly property string mapBlocker: "mapBlocker"
        readonly property string player: "player"
        readonly property string crate: "create"
        readonly property string target: "target"
    }

    readonly property QtObject entityCategories: QtObject {
        readonly property int player: Box.Category1
        readonly property int crate: Box.Category2
    }
}
