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

import "../constants"

// a background item is composed from: background, 4 edges and 4 corners
Item {
    // the rectangle here is used to decrease (and control)
    // opacity of a background image
    Rectangle {
        anchors {
            fill: parent
            margins: (Style.popup.cornerSize / 2) * 0.9 // enlarge a background a little bit
                                                        // to avoid empty pixels on connections
        }

        color: "white"
        opacity: Style.popup.cornerSize

        MultiResolutionImage {
            anchors.fill: parent

            source: qrc("assets/popups/background.png")
        }
    }

    Repeater {
        model: [ Qt.TopLeftCorner, Qt.TopRightCorner, Qt.BottomLeftCorner, Qt.BottomRightCorner ]

        MultiResolutionImage {
            property int corner: modelData

            readonly property string basePath: "assets/popups/%1-corner.png"

            function isTopCorner() {
                return (corner === Qt.TopLeftCorner) ||
                        (corner === Qt.TopRightCorner)
            }
            function isLeftCorner() {
                return (corner === Qt.TopLeftCorner) ||
                        (corner === Qt.BottomLeftCorner)
            }
            function cornerName() {
                switch (corner) {
                case Qt.TopLeftCorner:
                    return "top-left"
                case Qt.TopRightCorner:
                    return "top-right"
                case Qt.BottomLeftCorner:
                    return "bottom-left"
                case Qt.BottomRightCorner:
                    return "bottom-right"
                }
            }

            anchors {
                top: isTopCorner() ? parent.top : undefined
                bottom: isTopCorner() ? undefined : parent.bottom

                left: isLeftCorner() ? parent.left : undefined
                right: isLeftCorner() ? undefined : parent.right
            }

            width: Style.popup.cornerSize
            height: Style.popup.cornerSize

            source: qrc(basePath.arg(cornerName()))
        }
    }

    Repeater {
        model: [ Qt.TopEdge, Qt.BottomEdge, Qt.LeftEdge, Qt.RightEdge ]

        MultiResolutionImage {
            property int edge: modelData

            readonly property string basePath: "assets/popups/%1-edge.png"

            function isHorizontal() {
                return (edge === Qt.TopEdge) ||
                        (edge === Qt.BottomEdge)
            }
            function edgeSize() {
                if (edge === Qt.TopEdge) {
                    return Style.popup.topEdgeSize
                }
                return Style.popup.baseEdgeSize
            }
            function edgeName() {
                if (edge === Qt.TopEdge) {
                    return "top"
                }
                return "base"
            }

            anchors {
                leftMargin: isHorizontal() ? Style.popup.cornerSize : undefined
                rightMargin: isHorizontal() ? Style.popup.cornerSize : undefined

                topMargin: isHorizontal() ? undefined : Style.popup.cornerSize
                bottomMargin: isHorizontal() ? undefined : Style.popup.cornerSize

                top: (edge === Qt.BottomEdge) ? undefined : parent.top
                bottom: (edge === Qt.TopEdge) ? undefined : parent.bottom

                left: (edge === Qt.RightEdge) ? undefined : parent.left
                right: (edge === Qt.LeftEdge) ? undefined : parent.right
            }

            width: isHorizontal() ? undefined : edgeSize()
            height: isHorizontal() ? edgeSize() : undefined

            source: qrc(basePath.arg(edgeName()))
        }
    }
}
