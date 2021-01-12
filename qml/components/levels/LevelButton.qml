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
import QtQuick.Controls 2.12

import "../../constants"
import "../../components"

CustomButton {
    property int levelIndex
    readonly property int levelNumber: index + 1

    padding: 0.35 * width
    leftPadding: 0.35 * width
    rightPadding: 0.35 * width

    implicitWidth: Style.sizes.defaultButtonSize / 2
    implicitHeight: Style.sizes.defaultButtonSize / 2

    font.family: Style.fonts.numbersFont.name
    font.pixelSize: 26

    text: levelNumber

    background: Item {
        MultiResolutionImage {
            anchors {
                fill: parent
            }

            fillMode: Image.PreserveAspectFit
            source: qrc("assets/components/level-button-background.png")
        }
    }
}
