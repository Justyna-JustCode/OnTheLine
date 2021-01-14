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

Item {
    id: root
    property alias headerText: headerLabel.text
    property alias buttonText: confirmationButton.text

    property alias popupWidth: popupWindow.width
    property alias popupHeight: popupWindow.height

    default property alias contentItems: contentLayout.data

    signal buttonClicked()

    function open() {
        visible = true
    }
    function close() {
        visible = false
    }

    anchors.fill: parent
    visible: false

    MouseArea {
        anchors.fill: parent
        onClicked: close()
    }

    Control {
        id: popupWindow
        anchors {
            centerIn: parent
            margins: Style.sizes.margin    // just in case if a popup goes big
        }

        implicitWidth: Style.popup.defaultSize.width
        implicitHeight: Style.popup.defaultSize.height

        padding: Style.sizes.hugePadding

        background: PopupBackground {}

        contentItem: ColumnLayout {
            spacing: Style.sizes.margin

            HeaderLabel {
                id: headerLabel
                Layout.fillWidth: true

                text: root.headerText
            }

            // we need to use internal layout here
            // to be able to place a spacer on the bottom
            ColumnLayout {
                id: contentLayout

                spacing: Style.sizes.margin
            }

            CustomButton {
                id: confirmationButton
                Layout.alignment: Qt.AlignHCenter

                text: qsTr("Close")

                onClicked: {
                    root.close()
                    root.buttonClicked()
                }
            }
        }
    }
}
