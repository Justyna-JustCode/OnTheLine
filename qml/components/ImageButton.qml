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
    property alias source: image.source
    property url source

    padding: Style.sizes.bigPadding

    implicitWidth: Style.sizes.defaultButtonSize
    implicitHeight: Style.sizes.defaultButtonSize

    background: MultiResolutionImage {
        anchors.fill: parent

        source: qrc("assets/components/image-button-background.png")
    }

    contentItem: Item {
        MultiResolutionImage {
            id: image
            anchors.fill: parent

            width: contentItem.width
            height: contentItem.height

            fillMode: Image.PreserveAspectFit
        }
    }
}
