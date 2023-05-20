{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{TITLE}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li><a href="{LINK_BLOG}">{LANG_BLOG}</a></li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container margin-bottom-50">
    <div class="row">
        <div class="col-md-8 col-12">
            IF({RESULT_FOUND}){
            <div class="listings-container grid-layout">
                {LOOP: BLOG}
                    <div class="job-listing blog-listing">
                        <div class="job-listing-details">
                            IF({BLOG_BANNER}){
                            <div class="job-listing-company-logo">
                                <a href="{BLOG.link}"><img src="{SITE_URL}storage/blog/{BLOG.image}" alt="{BLOG.title}"></a>
                            </div>
                            {:IF}
                            <div class="job-listing-description">
                                <div class="blog-cat">{BLOG.categories}</div>
                                <h3 class="job-listing-title"><a href="{BLOG.link}">{BLOG.title}</a></h3>

                                <p class="job-listing-text margin-top-10">{BLOG.description}</p>
                            </div>
                        </div>
                        <div class="job-listing-footer">
                            <ul>
                                <li><img src="{SITE_URL}storage/profile/{BLOG.author_pic}"
                                         class="author-avatar"> {LANG_BY} <a href="{BLOG.author_link}">{BLOG.author}</a></li>
                                <li><i class="la la-clock-o"></i> {BLOG.created_at}</li>
                            </ul>
                        </div>
                    </div>
                {/LOOP: BLOG}
            </div>

            IF({SHOW_PAGING}){
            <div class="pagination-container margin-top-20">
                <nav class="pagination">
                    <ul>
                        {LOOP: PAGES}
                            IF("{PAGES.current}"=="0"){
                            <li><a href="{PAGES.link}">{PAGES.title}</a></li>
                        {ELSE}
                            <li><a href="#" class="current-page">{PAGES.title}</a></li>
                        {:IF}
                        {/LOOP: PAGES}
                    </ul>
                </nav>
            </div>
            {:IF}
            {ELSE}
            <div class="blog-not-found">
                <h2><span>:</span>(</h2>
                <p>
                    {LANG_BLOG_NOT_FOUND}
                </p>
            </div>
            {:IF}
        </div>
        <div class="col-md-4 hide-under-768px">
            <div class="blog-widget">
                <form action="{LINK_BLOG}">
                    <div class="input-with-icon">
                        <input class="with-border" type="text" placeholder="{LANG_SEARCH}..." name="s"
                               id="search-widget" value="{SEARCH}">
                        <i class="icon-feather-search"></i>
                    </div>
                </form>
            </div>
            <div class="blog-widget">
                <h3 class="widget-title">{LANG_CATEGORIES}</h3>
                <div class="">
                    <ul>
                        {LOOP: BLOG_CAT}
                            <li class="clearfix">
                                <a href="{BLOG_CAT.link}">
                                    <span class="pull-left">{BLOG_CAT.title}</span>
                                    <span class="pull-right">({BLOG_CAT.blog})</span></a>
                            </li>
                        {/LOOP: BLOG_CAT}
                    </ul>
                </div>
            </div>
            IF({TESTIMONIALS_ENABLE} && {SHOW_TESTIMONIALS_BLOG}){
            <div class="blog-widget">
                <h3 class="widget-title">{LANG_TESTIMONIALS}</h3>
                <div class="single-carousel">
                    {LOOP: TESTIMONIALS}
                        <div class="single-testimonial">
                            <div class="single-inner">
                                <div class="testimonial-content">
                                    <p>{TESTIMONIALS.content}</p>
                                </div>
                                <div class="testi-author-info">
                                    <div class="image"><img src="{SITE_URL}storage/testimonials/{TESTIMONIALS.image}" alt="{TESTIMONIALS.name}"></div>
                                    <h5 class="name">{TESTIMONIALS.name}</h5>
                                    <span class="designation">{TESTIMONIALS.designation}</span>
                                </div>
                            </div>
                        </div>
                    {/LOOP: TESTIMONIALS}
                </div>
            </div>
            {:IF}
            <div class="blog-widget">
                <h3 class="widget-title">{LANG_TAGS}</h3>
                <div class="">
                    <div class="job-tags">
                        {ALL_TAGS}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{OVERALL_FOOTER}