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

    signal showLevelsRequest()

    popupWidth: Style.popup.defaultSize.width * 0.7
    popupHeight: Style.popup.defaultSize.height * 0.7

    headerText: qsTr("Success")
    buttonText: qsTr("Show levels")

    onButtonClicked: showLevelsRequest()

    // A content here is placed inside of a layout
    // see PopupBase
    CustomLabel {
        Layout.fillWidth: true
        Layout.fillHeight: true

        horizontalAlignment: Qt.AlignHCenter
        text: qsTr("Congratulations!\nYou've managed to finish the level.")
    }
}
