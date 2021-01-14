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

    headerText: qsTr("About")

    // A content here is placed inside of a layout
    // see PopupBase
    Flickable {
        Layout.fillWidth: true
        Layout.fillHeight: true

        contentHeight: contentLabel.height

        clip: true

        CustomLabel {
            id: contentLabel
            readonly property string linkTemplate: "<a href=\"%1\">%1</a>"

            width: parent.width

            horizontalAlignment: Qt.AlignHCenter
            textFormat: Label.RichText

            text: qsTr("Version: <i>" + APP_VERSION + "</i><br>" +
                       "<br><b>Author:</b><br>" +
                       "JustCode ("
                       + linkTemplate.arg("http://just-code.org/") + ")<br>" +
                       "<br>Available on GitHub:<br>"+
                       linkTemplate.arg("https://github.com/Justyna-JustCode/OnTheLine") + "<br>" +
                       "<br><b>Built with Felgo:</b> " +
                       linkTemplate.arg("https://felgo.com/"))
        }
    }
}
