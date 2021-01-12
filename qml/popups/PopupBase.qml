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
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "../constants"
import "../components"

Popup {
    id: root
    property string headerText
    default property alias contentItems: contentLayout.data

    anchors.centerIn: parent
    margins: Style.sizes.bigMargin    // just in case if a popup goes big

    implicitWidth: 600
    implicitHeight: 400

    padding: Style.sizes.bigMargin

    background: PopupBackground {}

    contentItem: ColumnLayout {
        spacing: Style.sizes.margin

        HeaderLabel {
            Layout.fillWidth: true

            text: root.headerText
        }

        // we need to use internal layout here
        // to be able to place a spacer on the bottom
        ColumnLayout {
            id: contentLayout

            spacing: Style.sizes.margin
        }

        Spacer {
            Layout.fillHeight: true
        }
    }

    closePolicy: Popup.CloseOnPressOutside
}
