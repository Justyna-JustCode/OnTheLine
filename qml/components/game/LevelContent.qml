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
import QtQuick.Controls 2.12

import "../../logic"
import "../../entities"
import "../../constants"


Item {
    id: root

    property var scene
    property MapData mapData
    property WorldData worldData

    property alias moveController: player.moveController

    signal levelAccomplished()

    function handleLvelAccomplished() {
        player.cheer()
        levelAccomplished()
    }

    QtObject {
        id: priv

        property var mapBlockerComponent: Qt.createComponent(qrc("///qml/entities/MapBlocker.qml"))

        function removeMapBlockers() {
            entityManager.removeEntitiesByFilter([Statics.entityTypes.mapBlocker]);
        }

        function addMapBlockers() {
            // create map blockers in all blocker fields
            for (var index in mapData.blockerFields) {
                var fieldPos = mapData.blockerFields[index]
                entityManager.createEntityFromComponentWithProperties(mapBlockerComponent,
                                                                      { "parent": root,
                                                                        "fieldSize": worldData.fieldSize,
                                                                        "pos": fieldPos })
            }
        }

        function updateMapBlockers() {
            removeMapBlockers()
            addMapBlockers()
        }

        property var mapDataConnections: Connections {
            target: mapData

            onBlockerFieldsChanged: priv.updateMapBlockers()
        }
        property var worldDataConnections: Connections {
            target: worldData

            onFieldSizeChanged: priv.updateMapBlockers()
        }
    }

    PhysicsWorld {
        id: physicsWorld

//        debugDrawVisible: true // enable this for physics debugging
    }

    EntityManager {
        id: entityManager
        entityContainer: scene
    }

    WorldWalls {
        worldSize: Qt.size(root.width, root.height)
    }

    Target {
        fieldSize: worldData.fieldSize
        pos: mapData.targetPos

        onHit: root.handleLvelAccomplished()
    }

    Player {
        id: player

        active: scene.levelActive

        fieldSize: worldData.fieldSize
        pos: mapData.playerPos
    }

    Crate {
        fieldSize: worldData.fieldSize
        pos: mapData.cratePos
    }
}
