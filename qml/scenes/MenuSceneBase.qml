import QtQuick 2.12
import QtQuick.Layouts 1.12
import Felgo 3.0

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

import "../constants"
import "../components"

SceneBase {
  id: root
  default property alias contentItems: contentItem.data

  property string headerText
  property bool showBackButton: true

  MenuBackground {}

  ColumnLayout {
      anchors {
          fill: parent

          margins: Style.sizes.margin
      }

      HeaderLabel {
          Layout.fillWidth: true

          font.pixelSize: Style.fonts.menuHeaderSize
          text: root.headerText
      }

      Item {
          id: contentItem

          Layout.fillWidth: true
          Layout.fillHeight: true
      }


      ImageButton {
          Layout.alignment: Qt.AlignHCenter

          visible: root.showBackButton

          source: qrc("assets/icons/back-icon.png")

          onClicked: backRequest()
      }
  }
}
