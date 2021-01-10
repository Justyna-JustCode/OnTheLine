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
import Felgo 3.0

import "../constants"
import "../components"
import "../components/game"
import "../logic"

SceneBase {
  id: root

  property bool levelActive: true

  Keys.forwardTo: levelContent.moveController

  function handleLevelAccomplished() {
      levelActive = false
      successPopup.open()
  }

  function closeLevel() {
      levelActive = true
      root.backRequest()
  }

  MenuBackground {}

  LevelSuccessPopup {
      id: successPopup

      onShowLevelsRequest: root.closeLevel()
  }

  ColumnLayout {
      anchors.fill: parent
      spacing: 0

      RowLayout {
          ImageButton {
              Layout.alignment: Qt.AlignHCenter
              source: qrc("/assets/icons/back-icon.svg")

              onClicked: root.closeLevel()
          }
      }

      GameFieldBackground {    // game field
          Layout.fillWidth: true
          Layout.fillHeight: true

          padding: Style.sizes.padding

          WorldData {
              id: worldData
              anchors.fill: parent

              mapSize: mapManager.mapData.size
          }

          MapBounds {
              id: mapBounds
              anchors.centerIn: parent

              worldSize: worldData.worldSize

              MapBackground {
                  fieldSize: worldData.fieldSize
                  mapData: mapManager.mapData
              }

              LevelContent {
                  id: levelContent
                  anchors.fill: parent

                  scene: root
                  mapData: mapManager.mapData
                  worldData: worldData

                  onLevelAccomplished: root.handleLevelAccomplished()
              }
          }
      }
  }
}
