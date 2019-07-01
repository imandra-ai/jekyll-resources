<!-- Jupyter (Imandra core docs) version -->
<header class="header">
    <div class="top-row-container">
        <div class="top-row">

            <div id="toggler--left" class="side__left-menu-toggler">
                <div class="side__toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <p class="side__toggle-text">Docs</p>
            </div>

            <div class="side__logo-container">
                <a class="side__logo-link" href="/">
                    <img class="side__logo " src = "/{{ repo_dir }}/jekyll-resources/assets/img/imandra-gradient-logo-docs.svg">
                </a>
            </div>

            <div id="toggler--right" class="side__right-menu-toggler">
                <p class="side__toggle-text">Pages</p>
                <div class="side__toggle">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>

            <nav class="side__nav-container side__nav-container--hidden">

                <ul class="side__nav-list">
                    {% for site in data.jekyllResources.sites %}
                    <li class="side__nav-list-item TopNavListItem">
                        <a class="side__nav-link{% if site.name == 'Imandra' %} side__nav-link--active{% endif %}" href="{{ site.baseurl }}">{{ site.name }}</a>
                        {% if site.name == 'Imandra' %}
                        <ul class="side__nav-list--sub-level-1">
                            {% for section in data.nav.sections %}
                            <li class="side__nav-list-item--sub-level-1">
                                {% if section.notebookSlug %}
                                <a class="side__nav-link{% if section.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ section.notebookSlug }}">{{ section.name }}</a>
                                {% elif section.slug %}
                                <a class="side__nav-link{% if section.slug == slug %} side__nav-link--active{% endif %}" target="_blank" rel="noopener noreferrer" href="/{{ repo_dir }}/{{ section.slug }}">{{ section.name }}</a>
                                {% else %}
                                {{ section.name }}
                                {% endif %}
                                <ul class="side__nav-list--sub-level-2">
                                    {% for child in section.children %}
                                    <li class="side__nav-list-item--sub-level-2">
                                        <a class="side__nav-link{% if child.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ child.notebookSlug }}">{{ child.name }}</a>
                                        {% if child.children %}
                                        <ul class="side__nav-list--sub-level-3">
                                            {% for child in child.children %}
                                            <li class="side__nav-list-item--sub-level-3">
                                              <a class="side__nav-link{% if child.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ child.notebookSlug }}">{{ child.name }}</a>
                                            </li>
                                            {% endfor %}
                                        </ul>
                                        {% endif %}
                                    </li>
                                    {% endfor %}
                                </ul>
                            </li>
                            {% endfor %}
                        </ul>
                        {% endif %}
                    </li>
                    {% endfor %}
                </ul>
            </nav>
        </div>
    </div>

    <div class="background">
    </div>


    <div class="template-header">
        <div class="top-bar">
            <nav class="top-bar__nav-container">
                <a href="#" class="top-bar__toggle">≡</a>
                <div class="top-nav-bar__group ">
                    <div class="top-nav-bar__nav nav-bar--blue top-nav-bar__nav--hidden">
                        <ul class="top-nav-bar__links top-nav-bar__links--hidden-smaller-than-tablet">
                            <li class="top-nav-bar__item">
                                <a href="https://www.imandra.ai/" class="top-nav-bar__link">Home</a>
                            </li>
                            <li class="top-nav-bar__item">
                                <a href="https://try.imandra.ai/" class="top-nav-bar__link">Try</a>
                            </li>
                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--engine">
                                <a class="top-nav-bar__link top-nav-bar__link--group">Engine</a>
                                <ul class="dropdown-content dropdown-content--engine">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--docs--menu.svg %}" alt="Docs" title="Docs Icon">
                                        <a class="dropdown__link" href="https://docs.imandra.ai/">Docs</a></li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--research--menu.svg %}" alt="Research" title="Research Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/research">Research</a></li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--core--menu.svg %}" alt="Imandra Core" title="Imandra Core Icon">
                                        <a class="dropdown__link dropdown__coming-soon dropdown__link--last">Imandra Core</a></li>
                                </ul>
                            </li>
                            <!-- <li class="top-nav-bar__item top-nav-bar__item--group dropdown--industries">
                                <a class="top-nav-bar__link top-nav-bar__link--group">Industries</a>
                                <ul class="dropdown-content dropdown-content--industries">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--financial--menu.svg %}" alt="Financial Markets" title="Financial Markets Icon">
                                        <a class="dropdown__link " href="https://www.imandra.ai/imarkets">Financial Markets</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--autonomy--menu.svg %}" alt="Autonomous Systems" title="Autonomous Systems Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/autonomy">Autonomous Systems</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--ml--menu.svg %}" alt="Reinforcement Learning" title="Reinforcement Learningn Icon">
                                        <a class="dropdown__link dropdown__coming-soon dropdown__link--last ">Reinforcement Learning</a>
                                    </li>
                                </ul>
                            </li> -->
                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--media">
                                <a class="top-nav-bar__link top-nav-bar__link--group">Media</a>
                                <ul class="dropdown-content dropdown-content--media">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--media--menu.svg %}" alt="Media" title="Media Icon">
                                        <a class="dropdown__link " href="https://www.imandra.ai/media">Media</a></li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--blog--menu.svg %}" alt="Blog" title="Blog Icon">
                                        <a class="dropdown__link dropdown__link--last " href="https://medium.com/imandra">Blog</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--company">
                                <a class="top-nav-bar__link top-nav-bar__link--group">Company</a>
                                <ul class="dropdown-content dropdown-content--company">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--about--menu.svg %}" alt="About" title="About Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/about">About</a></li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}{% link jekyll-resources/assets/img/icon--careers--menu.svg %}" alt=" Careers" title="Careers Icon">
                                        <a class="dropdown__link dropdown__link--last dropdown__link--bottom" href="https://www.imandra.ai/careers">Careers</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <div class="template-header__image-container template-header__image-container--jupyter">
            <div class="template-header__image" href ="/{{ repo_dir }}">
                <img class="site-specific-image" src="/{{ repo_dir }}/static/img/site_specific_image_v_2.svg">
            </div>
        </div>
        
    </div>



    <script>
        document.getElementById('toggler--left').addEventListener('click', function () {
            document.querySelector('.side__right-menu-toggler .side__toggle').classList.remove(
                'side__toggle--active');
            document.querySelector('.side__left-menu-toggler .side__toggle').classList.toggle(
                'side__toggle--active');
            document.getElementsByClassName('side__nav-container')[0].classList.toggle(
                'side__nav-container--hidden');
            document.getElementsByClassName('top-nav-bar__nav')[0].classList.add('top-nav-bar__nav--hidden');
        });

        document.getElementById('toggler--right').addEventListener('click', function () {
            document.querySelector('.side__left-menu-toggler .side__toggle').classList.remove(
                'side__toggle--active');
            document.querySelector('.side__right-menu-toggler .side__toggle').classList.toggle(
                'side__toggle--active');

            document.getElementsByClassName('side__nav-container')[0].classList.add(
                'side__nav-container--hidden');
            document.getElementsByClassName('top-nav-bar__nav')[0].classList.toggle(
                'top-nav-bar__nav--hidden');
        });
    </script>
</header>
