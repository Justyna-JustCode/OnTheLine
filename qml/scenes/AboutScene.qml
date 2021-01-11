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

import "../constants"
import "../components"

SceneBase {
  id: root

  MenuBackground {}

  // TODO real nice look
  // TODO add about
  ColumnLayout {
      anchors {
          fill: parent
          margins: Style.sizes.margin
      }

      CustomLabel {
          text: "Resources used"
      }

      CustomLabel {
          text: "Images:"
      }
      Repeater {
          model: [
              "https://kenney.nl/assets/toon-characters-1",
              "https://kenney.nl/assets/shooting-gallery",
              "https://kenney.nl/assets/platformer-pack-industrial",
              "https://kenney.nl/assets/voxel-pack",
              "https://kenney.nl/assets/sokoban",
          ]

          CustomLabel {
              text: modelData
          }
      }

      CustomLabel {
          text: "Music & Sounds:"
      }
      Repeater {
          model: [
              "https://www.bensound.com/royalty-free-music",
              "https://opengameart.org/content/foot-walking-step-sounds-on-stone-water-snow-wood-and-dirt",
              "https://opengameart.org/content/scrapes",
              "https://opengameart.org/content/oh-yeah",
          ]

          CustomLabel {
              text: modelData
          }
      }
  }

}
