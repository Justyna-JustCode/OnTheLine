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

import "../constants"

Button {
    id: root

    padding: Style.sizes.bigPadding
    leftPadding: Style.sizes.bigPadding * 2
    rightPadding: Style.sizes.bigPadding * 2

    font {
        family: Style.fonts.headerFont.name
        pixelSize: Style.fonts.defaultSize
    }

    contentItem: CustomLabel {
        text: root.text
        font: root.font

        horizontalAlignment: Qt.AlignHCenter

        color: Style.colors.alternativeFontColor
    }

    background: Item {
        // center
        MultiResolutionImage {
            anchors {
                fill: parent
                leftMargin: Style.compontents.buttonEdgeSize
                rightMargin: Style.compontents.buttonEdgeSize
            }

            source: qrc("assets/components/button-background.png")
        }

        // left edge
        MultiResolutionImage {
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
            }
            width: Style.compontents.buttonEdgeSize

            source: qrc("assets/components/button-background-left.png")
        }

        // right edge
        MultiResolutionImage {
            anchors {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            width: Style.compontents.buttonEdgeSize

            source: qrc("assets/components/button-background-right.png")
        }
    }
}
