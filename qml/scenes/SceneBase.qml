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

import QtQuick 2.0
import Felgo 3.0

import "../styles"

Scene {
    property bool active: false

    Behavior on opacity {
        NumberAnimation { duration: Style.behavior.menuFadeTime }
    }

    // the "logical size" - the scene content is auto-scaled to match
    // the gameWindow's size
    width: 480
    height: 320

    // by default, set the opacity to 0
    // We handle this property from PlatformerMain via PropertyChanges
    opacity: active ? 1 : 0

    // the scene is only visible if the opacity is > 0
    // this improves the performance
    visible: opacity > 0

    // only enable scene if it is visible
    enabled: visible
}
