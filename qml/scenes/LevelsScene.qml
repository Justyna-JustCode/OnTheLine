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
import Felgo 3.0

import "../constants"
import "../components"
import "../components/levels"

SceneBase {
  id: root

  signal levelSelected(int number)

  MenuBackground {}

  ColumnLayout {
      anchors {
          fill: parent
          margins: Style.sizes.margin
      }

      // TODO: add scroll area when needed
      GridLayout {
          columns: 4

          columnSpacing: Style.sizes.margin
          rowSpacing: Style.sizes.margin

          Repeater {
              model: levelsManager.count

              delegate: LevelButton {
                  readonly property int levelIndex: index
                  readonly property int levelNumber: index + 1

                  Layout.fillWidth: true
                  Layout.preferredHeight: width

                  text: levelNumber

                  onClicked: root.levelSelected(levelIndex)
              }
          }

      }

      ImageButton {
          Layout.alignment: Qt.AlignHCenter
          source: qrc("/assets/icons/back-icon.svg")

          onClicked: backRequest()
      }
  }

}
