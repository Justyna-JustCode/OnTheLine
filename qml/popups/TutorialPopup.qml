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
        Layout.fillWidth: true
        Layout.fillHeight: true

        horizontalAlignment: Qt.AlignHCenter
        text: qsTr("Learn yourself ;)")
    }
    CustomButton {
        Layout.alignment: Qt.AlignHCenter

        text: qsTr("Ok")

        onClicked: {
            root.close()
        }
    }
}
