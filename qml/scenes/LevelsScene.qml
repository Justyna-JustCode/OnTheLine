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

MenuSceneBase {
  id: root

  signal levelSelected(int number)

  headerText: qsTr("Levels")

  ColumnLayout {
      anchors {
          fill: parent
          margins: Style.sizes.margin
      }

      // TODO: add scroll area when needed
      GridLayout {
          id: availableRepeater
          columns: 6

          columnSpacing: Style.sizes.margin
          rowSpacing: Style.sizes.margin

          Repeater {
              model: levelsManager.count

              delegate: LevelButton {
                  levelIndex: index

                  Layout.fillWidth: true
                  Layout.preferredHeight: width

                  onClicked: {
                      root.levelSelected(levelIndex)
                      if (levelIndex == 0) {
                          tutorialPopup.open()
                      }
                  }
              }
          }

          // TODO: add more levels - temporary UI improvement
          Repeater {
              id: unavailableRepeater
              model: 9

              delegate: LevelButton {
                  levelIndex: 3// + unavailableRepeater.index

                  Layout.fillWidth: true
                  Layout.preferredHeight: width

                  opacity: 0.3
              }
          }
      }
  }

}
