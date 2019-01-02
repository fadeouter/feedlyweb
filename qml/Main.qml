import QtQuick 2.9
import Morph.Web 0.1
import QtWebEngine 1.7
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.UnityWebApps 0.1 as UnityWebApps
import Ubuntu.Content 1.1
import QtMultimedia 5.8
import QtSystemInfo 5.0
import "."

MainView {
    id: root
    objectName: "mainView"
    ScreenSaver { screenSaverEnabled: false }

    focus: true

    anchors {
        fill: parent
    }

    applicationName: "feedlyweb.gleblee"
    anchorToKeyboard: false
    automaticOrientation: true
    property bool blockOpenExternalUrls: false
    property bool runningLocalApplication: true
    property bool openExternalUrlInOverlay: true
    property bool popupBlockerEnabled: false

    Page {
        id: page

        header: Rectangle {
            color: "#000000"
            width: parent.width
            height: units.dp(.5)
            z: 1
        }

        anchors {
            fill: parent
            bottom: parent.bottom
        }

        WebEngineView {
            id: webview

            WebEngineProfile {
            id: webContext

            property alias userAgent: webContext.httpUserAgent
            property alias dataPath: webContext.persistentStoragePath

            dataPath: dataLocation

            userAgent: "Mozilla/5.0 (Linux; U; Android 4.1.1; es-; AVA-V470 Build/GRK39F) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"

            persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
            }

            anchors {
                fill: parent
                right: parent.right
                bottom: parent.bottom
                margins: units.gu(0)
                bottomMargin: units.gu(0)
            }
                zoomFactor: 2.8
                url: "https://feedly.com/i/my"

                userScripts: [
                    WebEngineScript {
                    injectionPoint: WebEngineScript.DocumentReady
                       name: "oxide://inject/"
                       sourceUrl: Qt.resolvedUrl("js/inject.js")
                       runOnSubframes: true
           }
        ]

        onLoadingChanged: function(loadRequest) {
                if (loadRequest.errorCode) {
                    webview.reload();
                    console.log('Error ' + loadRequest.errorCode + ' | ' + loadRequest.status + ' | ' + loadRequest.errorString + ' | ' + loadRequest.errorDomain + ' | ' + loadRequest.url);  

                } else {
                    console.log('OK ' + loadRequest.errorCode + ' | ' + loadRequest.status + ' | ' + loadRequest.errorString + ' | ' + loadRequest.errorDomain + ' | ' + loadRequest.url); return; 
                }
            }

        onNewViewRequested: function(request) {
            var newWindow = Qt.createQmlObject('
                import QtQuick 2.9;
                import Morph.Web 0.1;
                import QtQuick.Window 2.2;
                import QtWebEngine 1.7;
                import Ubuntu.Components 1.3;
                import Ubuntu.Content 1.1;
                import Ubuntu.Components.Popups 1.3
                import Ubuntu.UnityWebApps 0.1 as UnityWebApps
                import QtMultimedia 5.8
                import QtSystemInfo 5.0
                import "components"
                import "."
                    Window {
                    id: browser;
                    visible: true;
                    property alias wv: wv

                    ScreenSaver { screenSaverEnabled: false } 

                    WebEngineView {
                        id: wv;
                        anchors.fill: parent;
                        zoomFactor: 2.8

                        anchors {
                            fill: parent
                            right: parent.right
                            bottom: parent.bottom
                            margins: units.gu(0)
                            bottomMargin: units.gu(6)
                        }

                        }
                        BottomMenu {
                            id: bottomMenu
                            width: parent.width
                        }
                    }', webview);
        request.openIn(newWindow.wv);
            }
       }
   }
 }
