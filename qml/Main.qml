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
        id: feedlyApp

        header: Rectangle {
            color: "#ffffff"
            width: parent.width
            height: units.dp(.1)
            z: 1
        }

        anchors {
            fill: parent
            bottom: parent.bottom
        }

        WebEngineView {
            id: feedlyAppWebView

            WebEngineProfile {
            id: feedlyAppWebContext
            property alias userAgent: feedlyAppWebContext.httpUserAgent
            userAgent: "Mozilla/5.0 (Linux; U; Android 4.1.1; en-us; AVA-V470 Build/GRK39F) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"

            property alias dataPath: feedlyAppWebContext.persistentStoragePath
            dataPath: dataLocation
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
                        injectionPoint: WebEngineScript.DocumentCreation
                        name: "oxide://inject/"
                        sourceUrl: Qt.resolvedUrl("js/yett.min.js")
                         },
                    WebEngineScript {
                        injectionPoint: WebEngineScript.DocumentReady
                        name: "oxide://inject/"
                        sourceUrl: Qt.resolvedUrl("js/inject.js")
                        runOnSubframes: false
                    }
                ]

        onLoadingChanged: function(loadRequest) {
                if (loadRequest.errorCode) {
                    feedlyAppWebView.reload();
                    console.log('Error ErrCode_' + loadRequest.errorCode + ' Status_' + loadRequest.status + ' ErrString_' + loadRequest.errorString + ' ErrDomain_' + loadRequest.errorDomain + ' Url_' + loadRequest.url);  

                } else {
                    console.log('OK ErrCode_' + loadRequest.errorCode + ' Status_' + loadRequest.status + ' ErrString_' + loadRequest.errorString + ' ErrDomain_' + loadRequest.errorDomain + ' Url_' + loadRequest.url); return; 
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
                    id: newWindowBrowser;
                    visible: true;
                    property alias newWindowWebWiew: newWindowWebWiew

                    WebEngineView {
                        id: newWindowWebWiew;
                        anchors.fill: parent;
                        zoomFactor: 2.8

                        WebEngineProfile {
                            httpUserAgent: "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"
                        }

                        userScripts: [
                            WebEngineScript {
                                injectionPoint: WebEngineScript.DocumentCreation
                                name: "oxide://inject/"
                                sourceUrl: Qt.resolvedUrl("js/yett.min.js")
                                }
                        ]


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
                    }', feedlyAppWebView);
        request.openIn(newWindow.newWindowWebWiew);
            }
       }
   }
 }
