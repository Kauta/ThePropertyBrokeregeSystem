{OVERALL_HEADER}
<div id="titlebar" class="gradient">
    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <h2>{MESSAGE}</h2>

                <!-- Breadcrumbs -->
                <nav id="breadcrumbs" class="dark">
                    <ul>
                        <li><a href="{LINK_INDEX}">Home</a></li>
                        <li>{MESSAGE}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>

<section id="main" class="clearfix text-center margin-top-50 margin-bottom-50">
    <div class="container">
        <div class="row">
            <div class="col-sm-10 margin-0-auto">
                <div class="found-section section">
                    <h1 class="margin-bottom-20">{MESSAGE}</h1>
                    IF('{CONTENT}'==''){
                    <p>{LANG_NOT_FIND_PAGE}.</p>
                    {ELSE}
                    <p>{CONTENT}.</p>
                    {:IF}

                    <a href="{LINK_INDEX}" class="button ripple-effect">{LANG_GO_HOME}</a></div>
            </div>
        </div>
    </div>
    <!-- container -->
</section>
<!-- main -->
{OVERALL_FOOTER}
