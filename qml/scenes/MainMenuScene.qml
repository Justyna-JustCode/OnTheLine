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

MenuSceneBase {
  id: root

  signal startGameRequest
  signal showAttributionRequest
  signal showAboutRequest

  headerText: qsTr("On the line")
  showBackButton: false

  ColumnLayout {
      anchors {
          fill: parent
          topMargin: Style.sizes.bigMargin
          leftMargin: Style.sizes.bigMargin
      }

      CustomButton {
          text: qsTr("Start game")
          font.pixelSize: Style.fonts.bigSize

          onClicked: root.startGameRequest()
      }
      CustomButton {
          text: qsTr("Attribution")
          font.pixelSize: Style.fonts.bigSize

          onClicked: root.showAttributionRequest()
      }
      CustomButton {
          text: qsTr("About")
          font.pixelSize: Style.fonts.bigSize

          onClicked: root.showAboutRequest()
      }
      CustomButton {
          text: qsTr("Quit")
          font.pixelSize: Style.fonts.bigSize

          onClicked: root.backRequest()
      }

      Spacer {
          Layout.fillHeight: true
      }
  }

  TeaserImage {
      anchors {
          right: parent.right
          rightMargin: Style.sizes.margin
          bottom: parent.bottom
      }
  }
}
