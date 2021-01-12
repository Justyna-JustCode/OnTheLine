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
import "../components/controls"
import "../popups"
import "../logic"

SceneBase {
  id: root

  property bool levelFinished: false
  readonly property bool levelActive: active && !levelFinished

  function handleLevelAccomplished() {
      levelFinished = true
      successPopup.open()
  }

  function restartLevel() {
      levelsManager.reload()
      levelFinished = false
  }

  function closeLevel() {
      root.backRequest()
      levelFinished = false
  }

  MenuBackground {}

  LevelSuccessPopup {
      id: successPopup

      onShowLevelsRequest: root.closeLevel()
  }

  ColumnLayout {
      anchors.fill: parent
      spacing: 0

      // TODO: real nice look
      RowLayout {
          Layout.margins: Style.sizes.tinyPadding

          ImageButton {
              Layout.alignment: Qt.AlignHCenter

              implicitWidth: Style.sizes.mediumButtonSize
              implicitHeight: Style.sizes.mediumButtonSize

              source: qrc("assets/icons/back-icon.png")

              onClicked: root.closeLevel()
          }

          Spacer {
              Layout.fillWidth: true
          }

          CustomLabel {
              text: qsTr("Level %1").arg(levelsManager.currentLevel + 1)

              font.pixelSize: Style.fonts.bigSize
          }

          Spacer {
              Layout.fillWidth: true
          }

          ImageButton {
              Layout.alignment: Qt.AlignHCenter

              implicitWidth: Style.sizes.mediumButtonSize
              implicitHeight: Style.sizes.mediumButtonSize

              source: qrc("assets/icons/restart-icon.png")

              onClicked: root.restartLevel()
          }
      }

      GameFieldBackground {    // game field
          Layout.fillWidth: true
          Layout.fillHeight: true

          padding: Style.sizes.padding + Statics.sizes.outsideWallThick

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

  MoveControl {
      anchors {
          right: parent.right
          bottom: parent.bottom
      }

      width: Style.compontents.controlSize.width
      height: Style.compontents.controlSize.height

      axisController: levelContent.moveController
  }
}
