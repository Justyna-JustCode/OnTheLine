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

MultiResolutionImage {
    property TwoAxisController axisController

    property int arrowType: Qt.NoArrow
    property real margin: Style.sizes.hugeBorder

    readonly property bool isPressed: mouseArea.containsPress

    width: parent.width / 4
    height: parent.height / 4

    QtObject {
        id: priv
        readonly property string basePath: "assets/control/control-%1.png"

        function arrowName() {
            switch (arrowType) {
                case Qt.LeftArrow:
                    return "left"
                case Qt.RightArrow:
                    return "right"
                case Qt.UpArrow:
                    return "up"
                case Qt.DownArrow:
                    return "down"
            }
        }

        function isHorizontal() {
            return arrowType === Qt.LeftArrow || arrowType === Qt.RightArrow
        }

        function arrowOrientation() {
            switch (arrowType) {
                case Qt.LeftArrow:
                case Qt.DownArrow:
                    return -1
                case Qt.UpArrow:
                case Qt.RightArrow:
                    return 1
            }
        }

    }

    anchors {
        horizontalCenter: priv.isHorizontal() ? undefined : parent.horizontalCenter
        verticalCenter: priv.isHorizontal() ? parent.verticalCenter : undefined

        left: arrowType === Qt.LeftArrow ? parent.left : undefined
        leftMargin: arrowType === Qt.LeftArrow ? margin : 0

        right: arrowType === Qt.RightArrow ? parent.right : undefined
        rightMargin: arrowType === Qt.RightArrow ? margin : 0

        top: arrowType === Qt.UpArrow ? parent.top : undefined
        topMargin: arrowType === Qt.UpArrow ? margin : 0

        bottom: arrowType === Qt.DownArrow ? parent.bottom : undefined
        bottomMargin: arrowType === Qt.DownArrow ? margin : 0
    }

    fillMode: Image.PreserveAspectFit
    source: qrc(priv.basePath.arg(priv.arrowName()))

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onContainsPressChanged: {
            var movementValue = containsPress ? priv.arrowOrientation() : 0
            if (priv.isHorizontal()) {
                axisController.xAxis = movementValue
            } else {
                axisController.yAxis = movementValue
            }
        }
    }
}
