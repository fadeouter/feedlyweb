/* force UA (anyway not working)  */
navigator.__defineGetter__('userAgent', function () {
    return 'Mozilla/5.0 (Linux; U; Android 4.1.1; en-us; AVA-V470 Build/GRK39F) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1'
});

/* some debugging code  */
function handler(event) {

    var style = document.createElement('style');
    style.type = 'text/css';
    style.appendChild(document.createTextNode(
        '* {background-color: red}'
    ));
    document.head.appendChild(style);

}

window.addEventListener('load', handler, false);