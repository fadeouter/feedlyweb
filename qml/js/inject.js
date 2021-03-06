

function addStyle(styleString) {
        const style = document.createElement('style');
        style.textContent = styleString;
        document.head.append(style);
}

function loadStyle() {
addStyle(`
@media only screen and (orientation: portrait) {
    .sliderContainer {
        z-index: 10000
    }
    .LeftnavListRow {
        left: -22px
    }
    .LeftnavListRow__count {
        padding: 1em 0
    }
    .LeftnavListRow--child .LeftnavListRow__count {
        padding: 0
    }
    .LeftnavListRow__text {
        width: auto
    }
    header.header {
        display: none
    }
    #searchBarFX button.primary.small {
        display: none
    }
    .fx .header .right-col {
        width: 100%
    }
    #headerBarFX .row,
    #headerBarFX header,
    .fx .header .right-col {
        display: flex
    }
    .theme--dark .fx .AllPage__page-button:focus:not(.button--hide-focus),
    .theme--dark .fx .button-icon-only.tertiary:hover,
    .theme--dark .fx .button-icon-only:focus:not(.button--hide-focus),
    .theme--dark .fx .tertiary.AllPage__page-button:hover {
        background: 0 0!important
    }
    #headerBarFX {
        display: flex;
        flex-direction: row-reverse
    }
    .fx .header .right-col {
        width: auto!important
    }
    #integrationstab_header,
    .tab .header > * {
        padding: 5px 0
    }
    #feedlyTabsHolder #latesttab_icon,
    #feedlyTabsHolder #librarytab_icon,
    #feedlyTabsHolder #savedtab_icon,
    .dark .allIcon,
    .icon-navbar-collection-sharing-dark,
    .icon-navbar-latest-dark,
    .icon-navbar-saved-dark {
        background-position: 0
    }
    #headerBarFX h1,
    #searchBarFX > div > i,
    .bsa-native-ad,
    button.pro {
        display: none!important
    }
    .feedlyChrome--leftnav-peek #feedlyChrome__leftnav-wrapper {
        z-index: 7777
    }
    .feedlyChrome--leftnav-peek #feedlyChrome__leftnav-wrapper:after {
        content: "";
        position: absolute;
        top: 0;
        left: 100%;
        width: 100%;
        height: 100%;
        background: rgba(255, 0, 255, 0);
        transition: 0s all ease;
        z-index: 7777
    }
    .fx .header .actions-container {
        text-align: left;
        margin-left: 30px
    }
    .fx .popover .menu,
    .fx.popover .menu,
    .popover {
        min-width: 75vw;
        max-width: 75vw
    }
    .fx .menu-filter-list.form > .fx-input {
        min-width: calc(75vw - 1rem);
        max-width: calc(75vw - 1rem)
    }
    #floatingEntry * {
        max-width: 100%
    }
    .entryHeader a {
        word-break: break-word
    }
    #feedlyPageFX > div > div > header > h1 {
        margin: 20px 0 0 0!important;
        width: auto
    }
    .fx h4,
    .fx-h4,
    h4.fx {
        margin-top: 1.5rem
    }
    .fx .entry.u5 {
        width: 100%
    }
    .placeholder {
        visibility: visible!important
    }
    .fx .entry.u4 .title {
        width: 100%
    }
    .fx .entry.u4 .visual {
        width: 100%;
        height: 150px
    }
    .fx .entry.u4 {
        flex-direction: column
    }
    .fx .entry.u4 .visual {
        margin-bottom: 1em
    }
    .fx .entry.u4 .hide,
    .fx .entry.u4 .mark-as-read,
    .fx .entry.u4 .save-for-later,
    .fx .tag-button {
        visibility: visible;
        z-index: 600;
        display: none
    }
    #headerBarFX h2 {
        overflow: hidden;
        line-height: 1;
        font-size: 100%;
        display: none
    }
    .metadata {
        display: flex;
        width: 100%
    }
    .fx .col-xs-6 > button:nth-child(3),
    .fx .col-xs-6 > button:nth-child(4) {
        display: none
    }
    .sliderContainer,
    .sliderWidth {
        max-width: 100vw;
        width: 100vw
    }
    .slideEntryContent {
        padding: 0 2em
    }
    .sliderPad.left,
    .sliderPad.right {
        padding: 0!important;
        display: none
    }
    .floatingEntryContent-tab {
        z-index: 9999;
        background-image: none!important;
        margin-left: 0!important
    }
    .floatingEntryContent-tab div {
        opacity: .1!important
    }
    .headerInfo-links.left {
        margin-left: 40px
    }
    .headerInfo-links {
        float: none
    }
    .headerInfo > .sliderWidth {
        display: flex;
        justify-content: flex-end
    }
    .slideEntryContent img {
        max-width: 100%!important
    }
    .headerInfo .headerInfo-links .fx button.button-icon-only-micro,
    .headerInfo-expanded-img,
    .shareBarHolder .headerInfo-links .fx button.button-icon-only-micro {
        width: 14vw!important
    }
    .headerInfo-expanded {
        right: 20px;
        min-width: 200px
    }
    div#popupPart {
        left: 20px!important;
        min-width: calc(100vw - 40px)!important
    }
    .floatingEntryContent .headerInfo {
        z-index: 400
    }
    .floatingEntryContent-tab.tab_0 > div {
        z-index: 10000
    }
    .floatingEntryContent__tab {
        left: 38px!important;
        z-index: 10000000;
        background-size: 0
    }
    .headerInfo,
    .sliderContainer {
        padding: 0!important
    }
}
@media screen and (max-width: 320px) {
    .fx .form.hercule-search input[type=text] {
        width: auto
    }
}
`);
}


window.addEventListener('load', loadStyle, false);
