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

    property var edge
    property real margin: Style.sizes.hugeBorder

    readonly property bool isPressed: mouseArea.containsPress

    width: parent.width / 4
    height: parent.height / 4

    QtObject {
        id: priv
        readonly property string basePath: "assets/control/control-%1.png"

        function edgeName() {
            switch (edge) {
                case Qt.LeftEdge:
                    return "left"
                case Qt.RightEdge:
                    return "right"
                case Qt.TopEdge:
                    return "top"
                case Qt.BottomEdge:
                    return "down"
            }
        }

        function isHorizontal() {
            return edge === Qt.LeftEdge || edge === Qt.RightEdge
        }

        function edgeOrientation() {
            switch (edge) {
                case Qt.LeftEdge:
                case Qt.BottomEdge:
                    return -1
                case Qt.TopEdge:
                case Qt.RightEdge:
                    return 1
            }
        }

    }

    anchors {
        horizontalCenter: priv.isHorizontal() ? undefined : parent.horizontalCenter
        verticalCenter: priv.isHorizontal() ? parent.verticalCenter : undefined

        left: edge === Qt.LeftEdge ? parent.left : undefined
        leftMargin: edge === Qt.LeftEdge ? margin : 0

        right: edge === Qt.RightEdge ? parent.right : undefined
        rightMargin: edge === Qt.RightEdge ? margin : 0

        top: edge === Qt.TopEdge ? parent.top : undefined
        topMargin: edge === Qt.TopEdge ? margin : 0

        bottom: edge === Qt.BottomEdge ? parent.bottom : undefined
        bottomMargin: edge === Qt.BottomEdge ? margin : 0
    }

    fillMode: Image.PreserveAspectFit
    source: qrc(priv.basePath.arg(priv.edgeName()))

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onContainsPressChanged: {
            var movementValue = containsPress ? priv.edgeOrientation() : 0
            if (priv.isHorizontal()) {
                axisController.xAxis = movementValue
            } else {
                axisController.yAxis = movementValue
            }
        }
    }
}
