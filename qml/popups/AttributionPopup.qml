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

    headerText: qsTr("Attribution")

    // A content here is placed inside of a layout
    // see PopupBase
    Flickable {
        Layout.fillWidth: true
        Layout.fillHeight: true

        contentHeight: contentLabel.height

        clip: true

        CustomLabel {
            id: contentLabel
            readonly property string linkTemplate: "<a href=\"%1\">%1</a><br>"

            width: parent.width

            horizontalAlignment: Qt.AlignHCenter
            textFormat: Label.RichText

            text: qsTr("A sincere thank you to all authors of the resources I used to create this game.<br>" +
                       "<br><b>Images</b><br>" +
                       linkTemplate.arg("https://kenney.nl/assets/toon-characters-1") +
                       linkTemplate.arg("https://kenney.nl/assets/shooting-gallery") +
                       linkTemplate.arg("https://kenney.nl/assets/platformer-pack-industrial") +
                       linkTemplate.arg("https://kenney.nl/assets/voxel-pack") +
                       linkTemplate.arg("https://kenney.nl/assets/sokoban") +
                       "<br><b>Musics &#38; Sounds</b><br>" +
                       linkTemplate.arg("https://www.bensound.com/royalty-free-music") +
                       linkTemplate.arg("https://opengameart.org/content/foot-walking-step-sounds-on-stone-water-snow-wood-and-dirt") +
                       linkTemplate.arg("https://opengameart.org/content/scrapes") +
                       linkTemplate.arg("https://opengameart.org/content/oh-yeah") +
                       "<br><b>Fonts</b><br>" +
                       linkTemplate.arg("https://www.1001freefonts.com/basica-industrial.font") +
                       linkTemplate.arg("https://www.1001freefonts.com/rough-typewriter.font") +
                       linkTemplate.arg("https://www.1001freefonts.com/28-days-later.font"))
        }
    }
}
