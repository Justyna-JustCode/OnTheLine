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
import QtQuick 2.0

Rectangle {
    anchors.fill: parent

    color: "dimgray"    // this is to control an image opacity
                        // and thus the output color

    MultiResolutionImage {
        anchors {
            fill: parent
            leftMargin: Style.compontents.buttonEdgeSize
            rightMargin: Style.compontents.buttonEdgeSize
        }

        source: qrc("assets/components/menu-background.png")
    }
}
