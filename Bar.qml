import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/Widgets"

Scope {
    Variants {
        model: Quickshell.screens

		PanelWindow {
		    id: panelWin
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 30
            color: "transparent"

            Rectangle {
                id: leftSection
                anchors {
                    top: parent.top
                    left: parent.left
                    bottom: parent.bottom
                }
                width: leftSectionLayout.implicitWidth + leftSectionLayout.anchors.leftMargin + leftSectionLayout.anchors.leftMargin
                bottomRightRadius: 20
                color: "#101015"

                RowLayout {
                    id: leftSectionLayout
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    spacing: 10

                    SystemTrayWidget {
                    }
                }
            }

            Rectangle {
                id: rightSection
                anchors {
                    top: parent.top
                    right: parent.right
                    bottom: parent.bottom
                }
                width: rightSectionLayout.implicitWidth + rightSectionLayout.anchors.leftMargin + rightSectionLayout.anchors.rightMargin
                bottomLeftRadius: 20
                color: "#101015"

                RowLayout {
                    id: rightSectionLayout
                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    spacing: 10

                    AudioWidget {
                    }
                    ClockWidget {
                    }
                }
            }
        }
    }
}
