<!-- Footer -->
<div id="footer">
    <div class="footer-middle-section">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-12">
                    <div class="footer-logo">
                        <img src="{SITE_URL}storage/logo/{SITE_LOGO_FOOTER}" alt="Footer Logo">
                    </div>
                    <p>{FOOTER_TEXT}</p>
                </div>
                <div class="col-xl-1 col-lg-1">
                </div>
                <div class="col-xl-2 col-lg-2 col-md-4">
                    <div class="footer-links">
                        <h3>{LANG_MY_ACCOUNT}</h3>
                        <ul>
                            IF({LOGGED_IN}){
                            <li><a href="{LINK_MYADS}">{LANG_MY_ADS}</a></li>
                            <li><a href="{LINK_PENDINGADS}">{LANG_PENDING_ADS}</a></li>
                            <li><a href="{LINK_LOGOUT}">{LANG_LOGOUT}</a></li>
                            {ELSE}
                            <li><a href="{LINK_LOGIN}">{LANG_LOGIN}</a></li>
                            <li><a href="{LINK_SIGNUP}">{LANG_REGISTER}</a></li>
                            {:IF}
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-4">
                    <div class="footer-links">
                        <h3>{LANG_HELP_SUPPORT}</h3>
                        <ul>
                            IF({BLOG_ENABLE}){
                            <li><a href="{LINK_BLOG}">{LANG_BLOG}</a></li>
                            {:IF}
                            IF({TESTIMONIALS_ENABLE}){
                            <li><a href="{LINK_TESTIMONIALS}">{LANG_TESTIMONIALS}</a></li>
                            {:IF}
                            <li><a href="{LINK_FAQ}">{LANG_FAQ}</a></li>
                            <li><a href="{LINK_FEEDBACK}">{LANG_FEEDBACK}</a></li>
                            <li><a href="{LINK_CONTACT}">{LANG_CONTACT}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-2 col-lg-2 col-md-4">
                    <div class="footer-links">
                        <h3>{LANG_INFORMATION}</h3>
                        <ul>
                            {LOOP: HTMLPAGE}
                                <li><a href="{HTMLPAGE.link}">{HTMLPAGE.title}</a></li>
                            {/LOOP: HTMLPAGE}
                            IF('{COUNTRY_TYPE}'=="multi"){
                            <li><a href="{LINK_COUNTRIES}">{LANG_COUNTRIES}</a></li>
                            {:IF}
                            <li><a href="{LINK_SITEMAP}">{LANG_SITE_MAP}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-section">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="footer-rows-left">
                        <div class="footer-row">
                            <span class="footer-copyright-text">{COPYRIGHT_TEXT}</span>
                        </div>
                    </div>
                    <div class="footer-rows-right">
                        <div class="footer-row">
                            <ul class="footer-social-links">
                                IF('{FACEBOOK_LINK}'!=""){
                                <li><a href="{FACEBOOK_LINK}" target="_blank"><i class="la la-facebook"></i></a></li>
                                {:IF}
                                IF('{TWITTER_LINK}'!=""){
                                <li><a href="{TWITTER_LINK}" target="_blank"><i class="la la-twitter"></i></a></li>
                                {:IF}
                                IF('{GOOGLEPLUS_LINK}'!=""){
                                <li><a href="{GOOGLEPLUS_LINK}" target="_blank"><i class="la la-pinterest"></i></a></li>
                                {:IF}
                                IF('{YOUTUBE_LINK}'!=""){
                                <li><a href="{YOUTUBE_LINK}" target="_blank"><i class="la la-youtube-play"></i></a></li>
                                {:IF}
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
IF({COOKIE_CONSENT}){
<!-- Cookie constent -->
<div class="cookieConsentContainer">
    <div class="cookieTitle">
        <h3>{LANG_COOKIES}</h3>
    </div>
    <div class="cookieDesc">
        <p>{LANG_COOKIES_MESSAGE}
            IF('{COOKIE_LINK}' != ''){
            <a href="{COOKIE_LINK}">{LANG_COOKIE_POLICY}</a>
            {:IF}
        </p>
    </div>
    <div class="cookieButton">
        <a href="javascript:void(0)" class="button cookieAcceptButton">{LANG_COOKIES_ACCEPT}</a>
    </div>
</div>
{:IF}

IF(!{LOGGED_IN}){
<!-- Sign In Popup -->
<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs popup-dialog">
    <ul class="popup-tabs-nav">
        <li><a href="#login">{LANG_LOGIN}</a></li>
    </ul>
    <div class="popup-tabs-container">
        <div class="popup-tab-content" id="login">
            <div class="welcome-text">
                <h3>{LANG_WELCOME_BACK}</h3>
                <span>{LANG_DONT_HAVE_ACCOUNT} <a href="{LINK_SIGNUP}">{LANG_SIGNUP_NOW}</a></span>
            </div>
            IF('{FACEBOOK_APP_ID}'!='' || '{GOOGLE_APP_ID}'!=''){
            <div class="social-login-buttons">
                IF('{FACEBOOK_APP_ID}'!=''){
                <button class="facebook-login ripple-effect" onclick="fblogin()"><i class="fa fa-facebook"></i> {LANG_LOGIN_VIA_FACEBOOK}</button>
                {:IF}

                IF('{GOOGLE_APP_ID}'!=''){
                <button class="google-login ripple-effect" onclick="gmlogin()"><i class="fa fa-google"></i> {LANG_LOGIN_VIA_GOOGLE}</button>
                {:IF}
            </div>
            <div class="social-login-separator"><span>{LANG_OR}</span></div>
            {:IF}
            <form method="post" action="{SITE_URL}login?ref={REF_URL}">
                <div class="input-with-icon-left">
                    <i class="la la-user"></i>
                    <input type="text" class="input-text with-border" name="username" id="username"
                           placeholder="{LANG_USERNAME} / {LANG_EMAIL}" required/>
                </div>

                <div class="input-with-icon-left">
                    <i class="la la-unlock"></i>
                    <input type="password" class="input-text with-border" name="password" id="password"
                           placeholder="{LANG_PASSWORD}" required/>
                </div>
                <a href="{LINK_LOGIN}?fstart=1" class="forgot-password">{LANG_FORGOTPASS}</a>
                <input type="hidden" name="ref" value="{REF}"/>
                <button class="button full-width button-sliding-icon ripple-effect" type="submit" name="submit">{LANG_LOGIN} <i class="icon-feather-arrow-right"></i></button>
            </form>
        </div>

    </div>
</div>
{:IF}

IF("{SWITCHER}"=="1"){
<!--/styleswitch-->
<div class="styleswitch">

</div>
{:IF}
<!--/End:styleswitch-->
<script>
    var session_uname = "{USERNAME}";
    var session_uid = "{USER_ID}";
    var session_img = "{USERPIC}";
    // Language Var
    var LANG_ENABLE_CHAT_YOURSELF = "{LANG_ENABLE_CHAT_YOURSELF}";
    var LANG_JUST_NOW = "{LANG_JUST_NOW}";
    var LANG_PREVIEW = "{LANG_PREVIEW}";
    var LANG_SEND = "{LANG_SEND}";
    var LANG_FILENAME = "{LANG_FILENAME}";
    var LANG_STATUS = "{LANG_STATUS}";
    var LANG_SIZE = "{LANG_SIZE}";
    var LANG_DRAG_FILES_HERE = "{LANG_DRAG_FILES_HERE}";
    var LANG_STOP_UPLOAD = "{LANG_STOP_UPLOAD}";
    var LANG_ADD_FILES = "{LANG_ADD_FILES}";
    var LANG_TYPE_A_MESSAGE = "{LANG_TYPE_A_MESSAGE}";
    var LANG_ADD_FILES_TEXT = "{LANG_ADD_FILES_TEXT}";
    var LANG_LOGGED_IN_SUCCESS = "{LANG_LOGGED_IN_SUCCESS}";
    var LANG_ERROR_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
    var LANG_ERROR = "{LANG_ERROR}";
    var LANG_CANCEL = "{LANG_CANCEL}";
    var LANG_DELETED = "{LANG_DELETED}";
    var LANG_ARE_YOU_SURE = "{LANG_ARE_YOU_SURE}";
    var LANG_YOU_WANT_DELETE = "{LANG_YOU_WANT_DELETE}";
    var LANG_YES_DELETE = "{LANG_YES_DELETE}";
    var LANG_AD_DELETED = "{LANG_AD_DELETED}";
    var LANG_SHOW = "{LANG_SHOW}";
    var LANG_HIDE = "{LANG_HIDE}";
    var LANG_HIDDEN = "{LANG_HIDDEN}";
    var LANG_ADD_FAV = "{LANG_ADD_FAVOURITE}";
    var LANG_REMOVE_FAV = "{LANG_REMOVE_FAVOURITE}";
    var LANG_SELECT_CITY = "{LANG_SELECT_CITY}";
    //Chat
    var LANG_CHATS = "{LANG_CHATS}";
    var LANG_NO_MSG_FOUND = "{LANG_NO_MSG_FOUND}";
    var LANG_ONLINE = "{LANG_ONLINE}";
    var LANG_OFFLINE = "{LANG_OFFLINE}";
    var LANG_TYPING = "{LANG_TYPING}";
    var LANG_GOT_MESSAGE = "{LANG_GOT_MESSAGE}";
</script>

<!-- Scripts -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/mmenu.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/tippy.all.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-select.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/snackbar.js?ver=3"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/magnific-popup.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.cookie.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.nicescroll.min.js"></script>
<script src='{SITE_URL}includes/assets/plugins/styleswitcher/jquery.style-switcher.js'></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/slick.min.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/custom.js"></script>
<script src='{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js'></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>

    /* THIS PORTION OF CODE IS ONLY EXECUTED WHEN THE USER THE LANGUAGE & THEME(CLIENT-SIDE) */
    $(function () {
        $('#lang-dropdown').on('click', '.dropdown-menu li', function (e) {
            var lang = $(this).data('lang');
            if (lang != null) {
                var res = lang.substr(0, 2);
                $('#selected_lang').html(res);
                $.cookie('Quick_lang', lang,{ path: '/' });
                location.reload();
            }
        });

        $('#theme-dropdown').on('click', '.dropdown-menu li', function (e) {
            var theme = $(this).data('theme');
            var thm = theme.substr(0, theme.indexOf('-'));
            $('#selected_theme').html(thm);
            $.cookie('Quick_theme', theme,{ path: '/' });
            location.reload();
        });
    });
    $(document).ready(function () {
        var lang = $.cookie('Quick_lang');
        if (lang != null) {
            var res = lang.substr(0, 2);
            $('#selected_lang').html(res);
        }
        var theme = $.cookie('Quick_theme');
        if (theme != null) {
            var thm = theme.substr(0, theme.indexOf('-'));
            $('#selected_theme').html(thm);
        }

    });
</script>

IF({LOGGED_IN} && '{QUICKCHAT_SOCKET_ON_OFF}'=='on'){
<script>
    var ws_protocol = window.location.href.indexOf("https://")==0?"wss":"ws";
    var ws_host = '{SOCKET_HOST}';
    var ws_port = '{SOCKET_PORT}';
    var WEBSOCKET_URL = ws_protocol+'://'+ws_host+':'+ws_port+'/quickchat';
    var filename = "{QUICKCHAT_AJAX_SECRET_FILE}.php";
    var plugin_directory = "plugins/quickchat-socket/"+filename;
</script>
<link type="text/css" rel="stylesheet" media="all" href="{SITE_URL}plugins/quickchat-socket/assets/chatcss/chatbox.css"/>
<div id="quickchat-rtl"></div>
<script>
    if ($("body").hasClass("rtl")) {
        $('#quickchat-rtl').append('<link rel="stylesheet" type="text/css" href="{SITE_URL}plugins/quickchat-socket/assets/chatcss/chatbox-rtl.css">');
        var rtl = true;
    }else{
        var rtl = false;
    }
</script>
<!--Websocket Version Js-->
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/quickchat-websocket.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/smiley/js/emojione.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/smiley/smiley.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/lightbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/chatbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/chatbox_custom.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/uploader/plupload.full.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/uploader/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<table id="lightbox" style="display: none;height: 100%">
    <tr><td height="10px"><p><img src="{SITE_URL}plugins/quickchat-socket/plugins/images/close-icon-white.png" width="30px" style="cursor: pointer"/></p></td></tr>
    <tr><td valign="middle"><div id="content"><img src="#"/></div></td></tr>
</table>
ELSEIF({LOGGED_IN} && '{QUICKCHAT_AJAX_ON_OFF}'=='on'){
<script>
    var filename = "{QUICKCHAT_AJAX_SECRET_FILE}.php";
    var plugin_directory = "plugins/quickchat-ajax/"+filename;
</script>
<link type="text/css" rel="stylesheet" media="all" href="{SITE_URL}plugins/quickchat-ajax/assets/chatcss/chatbox.css"/>
<div id="quickchat-rtl"></div>
<script>
    if ($("body").hasClass("rtl")) {
        $('#quickchat-rtl').append('<link rel="stylesheet" type="text/css" href="{SITE_URL}plugins/quickchat-ajax/assets/chatcss/chatbox-rtl.css">');
        var rtl = true;
    }else{
        var rtl = false;
    }
</script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/smiley/js/emojione.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/smiley/smiley.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/assets/chatjs/lightbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/assets/chatjs/chatbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/assets/chatjs/chatbox_custom.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/uploader/plupload.full.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/uploader/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<table id="lightbox" style="display: none;height: 100%">
    <tr><td height="10px"><p><img src="{SITE_URL}plugins/quickchat-ajax/plugins/images/close-icon-white.png" width="30px" style="cursor: pointer"/></p></td></tr>
    <tr><td valign="middle"><div id="content"><img src="#"/></div></td></tr>
</table>

ELSEIF({LOGGED_IN} && '{ZECHAT_ON_OFF}'=='on'){
<script>
    var filename = "{ZECHAT_SECRET_FILE}.php";
    var plugin_directory = "plugins/zechat/"+filename;
</script>
<link type="text/css" rel="stylesheet" media="all" href="{SITE_URL}plugins/zechat/app/includes/chatcss/chat.css"/>
<div id="zechat-rtl"></div>
<script>
    if ($("body").hasClass("rtl")) {
        $('#zechat-rtl').append('<link rel="stylesheet" type="text/css" href="{SITE_URL}plugins/zechat/app/includes/chatcss/chat-rtl.css">');
        var rtl = true;
    }else{
        var rtl = false;
    }
</script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/plugins/smiley/js/emojione.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/plugins/smiley/smiley.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/includes/chatjs/lightbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/includes/chatjs/chat.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/includes/chatjs/custom.js"></script>
<script type="text/javascript"
        src="{SITE_URL}plugins/zechat/app/plugins/uploader/plupload.full.min.js"></script>
<script type="text/javascript"
        src="{SITE_URL}plugins/zechat/app/plugins/uploader/jquery.ui.plupload/jquery.ui.plupload.js"></script>

<table id="lightbox" style="display: none;height: 100%">
    <tr><td height="10px"><p><img src="{SITE_URL}plugins/zechat/app/plugins/images/close-icon-white.png" width="30px" style="cursor: pointer"/></p></td></tr>
    <tr><td valign="middle"><div id="content"><img src="#"/></div></td></tr>
</table>
{:IF}

<!-- footer -->

</body>
</html>
