{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-sm-12">
                <h2>{ITEM_TITLE}
                    IF("{ITEM_FEATURED}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                    IF("{ITEM_URGENT}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                    IF("{ITEM_HIGHLIGHT}"=="1"){ <div class="badge red"> {LANG_HIGHLIGHT}</div> {:IF}
                </h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li><a href="{ITEM_CATLINK}">{ITEM_CATEGORY}</a></li>
                        <li><a href="{ITEM_SUBCATLINK}">{ITEM_SUB_CATEGORY}</a></li>
                    </ul>
                </nav>
            </div>

            IF({LOGGED_IN}){
            IF({LOGGED_IN} && ('{ZECHAT}'=='on' || '{QUICKCHAT}'=='on')){
            <div class="col-md-5 col-sm-12">
                <div class="right-side">

                    <button type="button" class="button ripple-effect popup-with-zoom-anim start_zechat hide-under-768px"
                            data-chatid="{ITEM_AUTHORID}_{ITEM_ID}"
                            data-postid="{ITEM_ID}"
                            data-userid="{ITEM_AUTHORID}"
                            data-fullname="{ITEM_AUTHORNAME}"
                            data-username="{ITEM_AUTHORUNAME}"
                            data-userimage="{ITEM_AUTHORIMG}"
                            data-userstatus="{ITEM_AUTHORONLINE}">{LANG_CHAT_NOW} <i class="icon-feather-message-circle"></i></button>

                    <a href="{QUICKCHAT_URL}" class="button ripple-effect show-under-768px">{LANG_CHAT_NOW} <i class="icon-feather-message-circle"></i></a>

                </div>
            </div>
            {:IF}
            {ELSE}
            <div class="col-md-5 col-sm-12">
                <div class="right-side">
                    <a href="#sign-in-dialog" class="button ripple-effect popup-with-zoom-anim">{LANG_LOGIN_CHAT} <i class="icon-feather-message-circle"></i></a>
                </div>
            </div>
            {:IF}
        </div>
    </div>
</div>
IF("{SHOW_IMAGE_SLIDER}"=="1"){
<!-- Slider -->
<div class="fullwidth-property-slider margin-bottom-0">
    {LOOP: ITEM_SCREENSHOT}
        <a href="{SITE_URL}/storage/products/{ITEM_SCREENSHOT.image}" data-background-image="{SITE_URL}/storage/products/{ITEM_SCREENSHOT.image}" class="item mfp-gallery"></a>
    {/LOOP: ITEM_SCREENSHOT}
</div>
{:IF}
<div class="container margin-top-50">
    <div class="row">

        <!-- Content -->
        <div class="col-xl-8 col-lg-8 content-right-offset">

            <div class="single-page-section">
                <h3>{LANG_ADS_DETAILS}</h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="la la-map-marker"></i>
                            <span>{LANG_LOCATION}</span>
                            <h5>{ITEM_CITY}, {ITEM_STATE}</h5>
                        </div>
                    </div>
                    IF('{ITEM_PRICE}' != '0'){
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="la la-credit-card"></i>
                            <span>{LANG_PRICE}</span>
                            <h5>{ITEM_PRICE} IF('{ITEM_NEGOTIATE}' != ''){ <span class="badge green d-inline-block">{ITEM_NEGOTIATE}</span> {:IF}</h5>
                        </div>
                    </div>
                    {:IF}
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="la la-clock-o"></i>
                            <span>{LANG_POSTED_ON}</span>
                            <h5>{ITEM_CREATED}</h5>
                        </div>
                    </div>
                    IF("{ITEM_HIDE_PHONE}"=="no" && '{ITEM_PHONE}'){
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="la la-phone"></i>
                            <span>{LANG_PHONE_NO}</span>
                            <h5>{ITEM_PHONE}</h5>
                        </div>
                    </div>
                    {:IF}
                </div>
            </div>
            <div class="single-page-section">
                <h3>{LANG_ADDITIONAL_DETAILS}</h3>
                <div class="row">

                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="icon-feather-hash"></i>
                            <span>{LANG_AD_ID}</span>
                            <h5>{ITEM_ID}</h5>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="icon-feather-eye"></i>
                            <span>{LANG_AD_VIEWS}</span>
                            <h5>{ITEM_VIEW}</h5>
                        </div>
                    </div>
                    IF("{ITEM_CUSTOMFIELD}"!="0"){

                    {LOOP: ITEM_CUSTOM}
                        <div class="col-md-6">
                            <div class="job-property">
                                IF("{ITEM_CUSTOM.icon}"!=""){
                                <img src="{ITEM_CUSTOM.icon}" width="24"/>
                                {ELSE}
                                <i class="icon-feather-chevron-right"></i>
                                {:IF}
                                <span>{ITEM_CUSTOM.title}</span>
                                <h5>{ITEM_CUSTOM.value}</h5>
                            </div>
                        </div>
                    {/LOOP: ITEM_CUSTOM}
                    {:IF}

                    {LOOP: ITEM_CUSTOM_CHECKBOX}
                        <div class="col-md-12">
                            <div class="job-property">
                                IF("{ITEM_CUSTOM_CHECKBOX.icon}"!=""){
                                <img src="{ITEM_CUSTOM_CHECKBOX.icon}" width="24"/>
                                {ELSE}
                                <i class="icon-feather-chevron-right"></i>
                                {:IF}
                                <span>{ITEM_CUSTOM_CHECKBOX.title}</span>
                                <h5 class="row">
                                    <ul class="listing-features checkboxes">
                                        {ITEM_CUSTOM_CHECKBOX.value}
                                    </ul>
                                </h5>
                            </div>
                        </div>
                    {/LOOP: ITEM_CUSTOM_CHECKBOX}
                </div>
                {LOOP: ITEM_CUSTOM_TEXTAREA}
                    <div class="job-property">
                        IF("{ITEM_CUSTOM_TEXTAREA.icon}"!=""){
                        <img src="{ITEM_CUSTOM_TEXTAREA.icon}" width="24"/>
                        {ELSE}
                        <i class="icon-feather-chevron-right"></i>
                        {:IF}
                        <span>{ITEM_CUSTOM_TEXTAREA.title}</span>
                        <h5>{ITEM_CUSTOM_TEXTAREA.value}</h5>
                    </div>
                {/LOOP: ITEM_CUSTOM_TEXTAREA}

            </div>

            <div class="single-page-section">
                <h3>{LANG_DESCRIPTION}</h3>
                <div class="user-html IF('{ITEM_SHOWMORE}'=='1'){ show-more {:IF}">
                    {ITEM_DESC}
                    IF('{ITEM_SHOWMORE}'=='1'){ <a href="#" class="show-more-button">{LANG_SHOW_MORE} <i class="fa fa-angle-down"></i></a> {:IF}
                </div>
            </div>

            IF({SHOW_VIDEOURL}){
            <div class="single-page-section">
                <h3>{LANG_VIDEO}</h3>
                <iframe width="560" height="315" src="{ITEM_VIDEOURL}" frameborder="0" allowfullscreen ></iframe>
            </div>
            {:IF}
            
            IF({SHOW_TAG}){
            <div class="single-page-section">
                <h3>{LANG_TAGS}</h3>
                <ul class="job-tags">
                    {ITEM_TAG}
                </ul>
            </div>
            {:IF}
            IF(('{POST_ADDRESS_MODE}'=='1') && ('{ITEM_LAT}'!='')){
            <div class="single-page-section">
                <h3>{LANG_LOCATION}</h3>
                <div id="single-job-map-container">
                    <div class="map-widget map" id="singleListingMap" data-latitude="{ITEM_LAT}" data-longitude="{ITEM_LONG}" data-map-icon="fa fa-marker"></div>
                    IF('{ITEM_LOCATION}' != ''){
                    <span><a href="https://maps.google.com/?q={ITEM_LOCATION}" target="_blank" rel="nofollow">{ITEM_LOCATION}</a></span>
                    {:IF}
                </div>
            </div>
            {:IF}
            <div class="single-page-section">
                <h3>{LANG_REVIEWS} ({ITEMREVIEW})</h3>

                <!-- **** Start reviews **** -->
                <div class="starReviews text-widget">
                    <!-- This is where your product ID goes -->
                    <div id="review-productId" class="review-productId" style="">{ITEM_ID}</div>
                    <!-- Show current reviews -->
                    <div class="show-reviews"><div class="loader" style="margin: 0 auto;"></div></div>
                    <hr>

                    IF("{LOGGED_IN}"=="0"){
                    <div style="padding-top: 10px"><a class="modal-trigger btn btn-primary" href="#loginPopUp">{LANG_LOGINTOREVIEW}</a></div>
                    {:IF}
                    IF("{LOGGED_IN}"=="1"){
                    <!-- Add new review -->
                    <div class="add-review"></div>
                    {:IF}

                    <script type="text/javascript">
                        var LANG_ADDREVIEWS     = "{LANG_ADDREVIEWS}";
                        var LANG_SUBMITREVIEWS  = "{LANG_SUBMITREVIEWS}";
                        var LANG_HOW_WOULD_RATE = "{LANG_HOW_WOULD_RATE}";
                        var LANG_REVIEWS        = "{LANG_REVIEWS}";
                        var LANG_YOURREVIEWS    = "{LANG_YOURREVIEWS}";
                        var LANG_ENTER_REVIEW   = "{LANG_ENTER_REVIEW}";
                        var LANG_STAR           = "{LANG_STAR}";
                    </script>
                </div>
                <!-- **** End reviews **** -->
            </div>
        </div>
        <!-- Sidebar -->
        <div class="col-xl-4 col-lg-4">
            <div class="sidebar-container">
                <!-- Sidebar Widget -->
                <div class="sidebar-widget">
                    <div class="job-detail-box">
                        <div class="job-detail-box-headline text-center">{LANG_CONTACT_ADVERTISER}</div>
                        <div class="job-detail-box-inner">
                            <div class="job-company-logo">
                                <a href="{ITEM_AUTHORLINK}">
                                    <img src="{SITE_URL}storage/profile/small_{ITEM_AUTHORIMG}" alt="{ITEM_AUTHORUNAME}">
                                </a>
                            </div>
                            <h2>
                                <a href="{ITEM_AUTHORLINK}">{ITEM_AUTHORNAME} IF("{ITEM_AUTHORNAME}"==""){ {ITEM_AUTHORUNAME} {:IF}</a>
                                IF("{SUB_IMAGE}"!=""){
                                <img src="{SUB_IMAGE}" alt="{SUB_TITLE}" title="{SUB_TITLE}" width="24px"/>
                                {:IF}
                            </h2>
                            <ul>
                                <li>
                                    <i class="la la-clock-o"></i>
                                    <span>{ITEM_AUTHORJOINED}</span>
                                </li>
                                IF('{ITEM_PHONE}' != ''){
                                <li class="tg-btnphone">
                                    <i class="icon-feather-phone-call"></i>
                                    <span data-last="{ITEM_PHONE}"><a href="tel:{ITEM_PHONE}" rel="nofollow"><em>{LANG_SHOW_PHONE_NO}</em></a></span>
                                </li>
                                {:IF}
                                <a class="tg-btnphone" href="javascript:void(0);">
                                    <i class="icon-phone-handset"></i>
                                </a>
                            </ul>
                            IF({LOGGED_IN}){

                            IF('{ZECHAT}'=='on' || '{QUICKCHAT}'=='on'){
                            <button type="button" class="button ripple-effect full-width margin-top-10 start_zechat zechat-hide-under-768px"
                                    data-chatid="{ITEM_AUTHORID}_{ITEM_ID}"
                                    data-postid="{ITEM_ID}"
                                    data-userid="{ITEM_AUTHORID}"
                                    data-fullname="{ITEM_AUTHORNAME}"
                                    data-username="{ITEM_AUTHORUNAME}"
                                    data-userimage="{ITEM_AUTHORIMG}"
                                    data-userstatus="{ITEM_AUTHORONLINE}"
                                    data-posttitle="{ITEM_TITLE}"
                                    data-postlink="{ITEM_LINK}">{LANG_CHAT_NOW} <i class="icon-feather-message-circle"></i></button>
                            <a href="{QUICKCHAT_URL}" class="button ripple-effect full-width margin-top-10 zechat-show-under-768px">{LANG_CHAT_NOW} <i class="icon-feather-message-circle"></i></a>
                            {:IF}

                            {ELSE}
                            <a href="#sign-in-dialog" class="button ripple-effect popup-with-zoom-anim full-width margin-top-10">{LANG_LOGIN_CHAT} <i class="icon-feather-message-circle"></i></a>
                            {:IF}

                            <a href="#emailToSeller" class="button ripple-effect popup-with-zoom-anim full-width margin-top-10">{LANG_REPLY_MAIL} <i class="icon-feather-mail"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-widget">
                    <div class="job-detail-box">
                        <div class="job-detail-box-inner">
                            <!-- **** Start reviews **** -->
                            <div class="starReviews">
                                <!-- Show average-rating -->
                                <div class="average-rating"><div class="small_loader" style="margin: 0 auto;"></div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sidebar Widget -->
                <div class="sidebar-widget">
                    <h3>{LANG_BOOKMARK_SHARE}</h3>
                    <button class="fav-button margin-bottom-20 set-item-fav IF('{ITEM_FAVORITE}' == '1'){ added {:IF}" data-item-id="{ITEM_ID}" data-userid="{USER_ID}" data-action="setFavAd">
                        <span class="fav-icon"></span>
                        <span class="fav-text">{LANG_SAVE_THIS_AD}</span>
                        <span class="added-text">{LANG_AD_SAVED}</span>
                    </button>

                    <!-- Share Buttons -->
                    <ul class="share-buttons-icons">
                        <li><a href="mailto:?subject={ITEM_TITLE}&body={ITEM_LINK}" data-button-color="#dd4b39" title="{LANG_SHARE_EMAIL}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-envelope"></i></a></li>
                        <li><a href="https://facebook.com/sharer/sharer.php?u={ITEM_LINK}" data-button-color="#3b5998" title="{LANG_SHARE_FACEBOOK}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://twitter.com/share?url={ITEM_LINK}&text={ITEM_TITLE}" data-button-color="#1da1f2" title="{LANG_SHARE_TWITTER}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.linkedin.com/shareArticle?mini=true&url={ITEM_LINK}" data-button-color="#0077b5" title="{LANG_SHARE_LINKEDIN}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="https://pinterest.com/pin/create/bookmarklet/?&url={ITEM_LINK}&description={ITEM_TITLE}" data-button-color="#bd081c" title="{LANG_SHARE_PINTEREST}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-pinterest-p"></i></a></li>
                        <li><a href="https://web.whatsapp.com/send?text={ITEM_LINK}" data-button-color="#25d366" title="{LANG_SHARE_WHATSAPP}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-whatsapp"></i></a></li>
                    </ul>
                </div>
                <div class="sidebar-widget">
                    <h3>{LANG_MORE_INFO}</h3>
                    <ul class="related-links">
                        <li>
                            <a href="{ITEM_AUTHORLINK}"><i class="la la-suitcase"></i> {LANG_MORE_ADS} {ITEM_AUTHORUNAME}</a>
                        </li>
                        <li>
                            <a href="{LINK_REPORT}"><i class="la la-exclamation-triangle"></i> {LANG_REPORT_THIS_AD}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        IF({TOTAL_ITEMS}!=0){
        <div class="col-md-12 margin-top-30">
            <div class="single-page-section">
                <h3 class="margin-bottom-25">{LANG_SIMILAR_ADS}</h3>
                <div class="listings-container grid-layout">
                    {LOOP: ITEM}
                        <div class='job-listing IF("{ITEM.highlight}"=="1"){ highlight {:IF}'>
                            <div class="job-listing-details">
                                <div class="job-listing-company-logo">
                                    <img src="{SITE_URL}storage/products/thumb/{ITEM.picture}" alt="{ITEM.product_name}">
                                </div>
                                <div class="job-listing-description">

                                    <h3 class="job-listing-title"><a href="{ITEM.link}">{ITEM.product_name}</a>
                                        IF("{ITEM.featured}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                                        IF("{ITEM.urgent}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                                        IF("{ITEM.highlight}"=="1"){ <div class="badge blue"> {LANG_HIGHLIGHT}</div>  {:IF}
                                    </h3>
                                    <ol class="breadcrumb">
                                        <li><a href="{ITEM.catlink}"><i class="la la-tags"></i> {ITEM.category}</a></li>
                                        <li><a href="{ITEM.subcatlink}">{ITEM.sub_category}</a></li>
                                    </ol>
                                    <h5 class="job-listing-company"><a href="{LINK_PROFILE}/{ITEM.username}"><i class="la la-user"></i> {ITEM.username}</a></h5>
                                </div>

                            </div>
                            <div class="job-listing-footer">
                                <ul>
                                    <li><i class="la la-map-marker"></i> {ITEM.location}</li>
                                    IF("{ITEM.price}"!="0"){
                                    <li><i class="la la-credit-card"></i> {ITEM.price}</li>
                                    {:IF}
                                    <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
                                </ul>
                            </div>
                        </div>
                    {/LOOP: ITEM}
                </div>
            </div>
        </div>
        {:IF}
    </div>
</div>

<div id="emailToSeller" class="zoom-anim-dialog mfp-hide dialog-with-tabs popup-dialog">
    <ul class="popup-tabs-nav">
        <li><a href="#tab">{LANG_SEND_MAIL} {LANG_TO} {ITEM_AUTHORUNAME}</a></li>
    </ul>
    <div class="popup-tabs-container">
        <div class="popup-tab-content" id="tab">
            <div class="notification error closeable" id="email_error" style="display: none">
                <p><span>Error!</span> {LANG_ERROR_TRY_AGAIN}</p><a class="close"></a>
            </div>
            <div class="notification success closeable" id="email_success" style="display: none">
                <p><span>Error!</span> {LANG_MAILSENTTOSELLER}</p><a class="close"></a>
            </div>

            <form id="email_contact_seller" method="post" action="email_contact_seller" accept-charset="UTF-8" enctype="multipart/form-data">
                <div class="submit-field">
                    <input type="text" class="form-control" name="name" placeholder="{LANG_FULL_NAME}" required="" style="width: 100%">
                    <input type="text" class="form-control" name="email" placeholder="{LANG_EMAILAD}" required="" style="width: 100%">
                    <input type="text" class="form-control" name="phone" placeholder="{LANG_PHONE_NO}" style="width: 100%">
                </div>
                <div class="submit-field">
                    <h5>{LANG_MESSAGE} *</h5>
                    <textarea cols="30" rows="2" class="form-control" name="message" required="" placeholder="{LANG_ENTER_YOUR_MESSAGE}..."></textarea>
                </div>
                <input type="hidden" class="form-control" name="id" value="{ITEM_ID}">
                <input type="hidden" class="form-control" name="sendemail" value="1">
                <button type="submit" class="button margin-top-35 full-width button-sliding-icon ripple-effect" class="btn btn-outline" id="email_submit_button">{LANG_SEND_MAIL}</button>
            </form>
        </div>
    </div>
</div>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/slick.min.js'></script>
<!-- Start jQuery starReviews -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.34/jquery.form-validator.min.js"></script>
<link href="{SITE_URL}plugins/starreviews/assets/css/starReviews.css" rel="stylesheet" type="text/css"/>
<script src="{SITE_URL}plugins/starreviews/assets/js/jquery.barrating.js"></script>
<script src="{SITE_URL}plugins/starreviews/assets/js/starReviews.js"></script>
<style>
    .starReviews hr { margin: 22px 0;}
    .starReviews h2, .starReviews h3 { margin-bottom: 10px;}
    .starReviews { text-align: left;}
    .starReviews label { font-size: 14px;}
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $().reviews('.starReviews');
    });
    IF("{ERROR}"!=""){
        $(window).on('load',function () {
            $('.apply-dialog-button').trigger('click');
        });
    {:IF}
</script>
<!-- END jQuery starReviews -->

IF("{MAP_TYPE}"=="google"){
<link href="{SITE_URL}includes/assets/plugins/map/google/map-marker.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src='{SITE_URL}includes/assets/plugins/map/google/jquery-migrate-1.2.1.min.js'></script>
<script type='text/javascript' src='//maps.google.com/maps/api/js?key={GMAP_API_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
<script type='text/javascript' src='{SITE_URL}includes/assets/plugins/map/google/richmarker-compiled.js'></script>
<script type='text/javascript' src='{SITE_URL}includes/assets/plugins/map/google/markerclusterer_packed.js'></script>
<script type='text/javascript' src='{SITE_URL}includes/assets/plugins/map/google/gmapAdBox.js'></script>
<script type='text/javascript' src='{SITE_URL}includes/assets/plugins/map/google/maps.js'></script>
<script>
    var _latitude = '{ITEM_LAT}';
    var _longitude = '{ITEM_LONG}';
    var element = "singleListingMap";
    var path = '{SITE_URL}templates/{TPL_NAME}/';
    var getCity = false;
    var color = '{MAP_COLOR}';
    var site_url = '{SITE_URL}';
    simpleMap(_latitude, _longitude, element);
</script>
{ELSE}
<script>var openstreet_access_token = '{OPENSTREET_ACCESS_TOKEN}'</script>
<link rel="stylesheet" href="{SITE_URL}includes/assets/plugins/map/openstreet/css/style.css">
<!-- Leaflet // Docs: https://leafletjs.com/ -->
<script src="{SITE_URL}includes/assets/plugins/map/openstreet/leaflet.min.js"></script>

<!-- Leaflet Maps Scripts (locations are stored in leaflet-quick.js) -->
<script src="{SITE_URL}includes/assets/plugins/map/openstreet/leaflet-markercluster.min.js"></script>
<script src="{SITE_URL}includes/assets/plugins/map/openstreet/leaflet-gesture-handling.min.js"></script>
<script src="{SITE_URL}includes/assets/plugins/map/openstreet/leaflet-quick.js"></script>

<!-- Leaflet Geocoder + Search Autocomplete // Docs: https://github.com/perliedman/leaflet-control-geocoder -->
<script src="{SITE_URL}includes/assets/plugins/map/openstreet/leaflet-autocomplete.js"></script>
<script src="{SITE_URL}includes/assets/plugins/map/openstreet/leaflet-control-geocoder.js"></script>
{:IF}
{OVERALL_FOOTER}

