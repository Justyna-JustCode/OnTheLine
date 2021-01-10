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
import QtQuick 2.12

QtObject {
    readonly property var sizes: QtObject {
        readonly property real playerSizeModifier: 0.7  // defines player size in relation to a field size
        readonly property real crateSizeModifier: 0.8   // defines crate size in relation to a field size
    }

    readonly property var behavior: QtObject {
        readonly property real restitutionNoBounding: 0  // a value of resitution that make object not bouncy

        readonly property real crateLinearDumpling: 30  // defines how fast crate will slow and stop after a contact
        readonly property real crateFriction: 0.01      // defines a friction between crate and other objects
    }

    readonly property var entityTypes: QtObject {
        readonly property string invisibleObject: "player"
        readonly property string wall: "wall"
        readonly property string mapBlocker: "mapBlocker"
        readonly property string player: "player"
        readonly property string crate: "create"
    }
}
