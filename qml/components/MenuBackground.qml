import QtQuick 2.0

Item {
    // TODO: some real nice background
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "lightsteelblue" }
        }
    }

    anchors.fill: parent

}
