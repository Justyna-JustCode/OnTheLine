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
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "../constants"
import "../components"

PopupBase {
    id: root

    headerText: qsTr("How to play")

    // A content here is placed inside of a layout
    // see PopupBase
    CustomLabel {
        readonly property int imgSize: Style.fonts.defaultSize
        readonly property string imgTemplate: "<img src=\"%1\" width=\"" + imgSize + "\" height=\"" + imgSize + "\" \>"
        readonly property url crateSource: qrc("assets/tutorial/crate.png")
        readonly property url targetSource: qrc("assets/tutorial/target.png")
        readonly property url playerSource: qrc("assets/tutorial/player.png")
        readonly property url blockerSource: qrc("assets/tutorial/blocker.png")

        Layout.fillWidth: true
        Layout.fillHeight: true

        horizontalAlignment: Qt.AlignHCenter
        textFormat: Label.RichText

        text: qsTr("Your task is to move a crate (" + imgTemplate.arg(crateSource) + ")<br>" +
                   "to a destination point (" + imgTemplate.arg(targetSource) + ").<br>" +
                   "To do this you should use a worker (" + imgTemplate.arg(playerSource) + ")<br>" +
                   "to push a crate in a desired location.<br>" +
                   "On the map there are also obstacles (" + imgTemplate.arg(blockerSource) + ")<br>" +
                   "which cannot be moved.<br><br>" +
                   "Pulling is not possible, so you have to be careful!" +
                   " If you find yourself in a helpless position, you can always restart a level" +
                   " with a button in the top right corener of the screen.<br><br>" +
                   "Have fun!");
    }

    CustomButton {
        Layout.alignment: Qt.AlignHCenter

        text: qsTr("Ok")

        onClicked: {
            root.close()
        }
    }
}
