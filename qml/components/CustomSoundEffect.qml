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

import QtQuick 2.12
import QtMultimedia 5.0 // required for SoundEffect.Infinite enum value for infinite looping

import "../constants"

SoundEffect {
    property bool active: false

    onActiveChanged: {
        if (active) {
            play()
        } else {
            stop()
        }
    }

    volume: Style.behavior.soundEffectVolume
    loops: SoundEffect.Infinite
}
