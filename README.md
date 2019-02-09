# Feedly Web

Feedly RSS reader web app for Ubuntu Touch operating system.

<img src="https://raw.githubusercontent.com/fadeouter/feedlyweb/master/screenshots/01.png" height="300"> <img src="https://raw.githubusercontent.com/fadeouter/feedlyweb/master/screenshots/02.png" height="300"> <img src="https://raw.githubusercontent.com/fadeouter/feedlyweb/master/screenshots/03.png" height="300"> <img src="https://raw.githubusercontent.com/fadeouter/feedlyweb/master/screenshots/04.png" height="300"> <img src="https://raw.githubusercontent.com/fadeouter/feedlyweb/master/screenshots/05.png" height="300">



## Features:
* interface tweaked to use on mobile phones
* external links open in a separate window with nav and close buttons
* basic tracking and ads scripts blocking engine (using <a href="https://github.com/snipsco/yett">yett</a>)

Currenly script blocklist are pretty small and basic. Feel free to add suggestions for scripts blocklist via Issues or pull request!


## Getting started
Pin side panel before use this app in a portrait mode.


## Changelog
v1.3 (09 Feb 2019):
* added script-blocking engine to block tracking and page-slowing scripts
* little UI improvements

v1.2 31 Dec 2018
* added open in external browser button for external views
* fixed problems with empty screen on start

v1.1 30 Dec 2018
* mobile interface only in portrait mode and regular desktop in landscape mode
* fixed sans-serif and serif font families 

v1.0 19 Dec 2018
* initial release

## To do
* <s>disable UI tweaks in desktop mode (add @ css rule)</s>
* <s>add ability to open links in external browser</s>
* improve scrolling experience
* <s>add internal adblocker</s>

## Test and build
Use `clickable` to test and build app.

```
clickable desktop \* test on PC *\
clickable build
clickable build-click
```
