import QtQuick 2.4
import Morph.Web 0.1
import QtQuick.Controls 2.2
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0
import Ubuntu.Components.Popups 1.3
import Ubuntu.Content 1.1


Rectangle {
    id: bottomMenu
    z: 100000
    width: parent.width
    height: units.gu(6)
    color: "#FFFFFF"
    anchors {
        bottom: parent.bottom
    }

    Rectangle {
        width: parent.width
        height: units.gu(0.1)
        color: UbuntuColors.lightGrey
    }

    Row {
        width: parent.width
        height: parent.height-units.gu(0.2)
        anchors {
            centerIn: parent
        }

        Item {
            width: parent.width/4
            height: parent.height

            Icon {
                anchors.centerIn: parent
                width: units.gu(2.9)
                height: width
                name: "stock_website"
                color: "#000000"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.openUrlExternally(newWindowWebWiew.url);
                }
            }
        }

        Item {
            width: parent.width/4
            height: parent.height

            Icon {
                anchors.centerIn: parent
                width: units.gu(2.9)
                height: width
                name: "go-previous"
                color: "#000000"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    newWindowWebWiew.goBack()
                }
            }
        }

        Item {
            width: parent.width/4
            height: parent.height

            Icon {
                anchors.centerIn: parent
                width: units.gu(2.9)
                height: width
                name: "go-next"
                color: "#000000"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    newWindowWebWiew.goForward()
                }
            }
        }

        Item {
            width: parent.width/4
            height: parent.height

            Icon {
                anchors.centerIn: parent
                width: units.gu(2.9)
                height: width
                name: "close"
                color: "#000000"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: newWindowBrowser.close();
            }
        }
    }
}