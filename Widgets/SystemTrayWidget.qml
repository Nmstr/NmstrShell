import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Rectangle {
    implicitWidth: trayLayout.width
    implicitHeight: trayLayout.height
    color: "transparent"

    RowLayout {
        id: trayLayout
        spacing: 10

        Repeater {
            model: SystemTray.items

            Rectangle {
                id: item
                required property SystemTrayItem modelData;
                implicitWidth: childrenRect.width
                implicitHeight: childrenRect.height
                color: "transparent"

                IconImage {
                    source: item.modelData.icon
                    implicitSize: 20
				}

				MouseArea {
                    anchors.fill: parent
					acceptedButtons: Qt.AllButtons

					QsMenuOpener {
						id: menuOpener
						menu: item.modelData.menu
					}

                    onClicked: event => {
                        if (event.button === Qt.LeftButton) {
                            item.modelData.activate();
                        } else if (event.button === Qt.MiddleButton) {
                            item.modelData.secondaryActivate();
                        } else if (event.button === Qt.RightButton && item.modelData.hasMenu) {
						    item.modelData.display(panelWin, mouseX, mouseY);
                        }
                    }
                }

                PopupWindow {
                    id: itemMenu
                }
            }
        }
    }
}
