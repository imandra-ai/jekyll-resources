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
                    <img class="side__logo " src = "/{{ repo_dir }}/jekyll-resources/assets/img/imandra-gradient-logo-docs.svg" alt="Imandra Logo" title="Imandra Logo">
                    <img class="side__logo--min " src="/{{ repo_dir }}/jekyll-resources/assets/img/imandra-gradient-logo-min.svg" alt="Imandra Logo" title="Imandra Logo">

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

            <nav id="side-nav-menu" class="side__nav-container side__nav-container--hidden">
                <ul class="side__nav-list">
                    {% for site in data.jekyllResources.sites %}
                    <li class="side__nav-list-item">
                        <a class="side__nav-link{% if site.name == 'Imandra Core' %} side__nav-link--active{% endif %}" href="{{ site.baseurl }}">{{ site.name }}</a>
                        {% if site.name == 'Imandra Core' %}
                        <ul class="side__nav-list--sub-level-1">
                            {% for section in data.nav.sections %}
                            <li class="side__nav-list-item--sub-level-1 {% if section.children | length == 0 %}side__nav-list--sub-level-1--empty{% endif %}">
                                {% if section.notebookSlug %}
                                <a class="side__nav-link{% if section.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ section.notebookSlug }}">{{ section.name }}</a>
                                {% elif section.slug %}
                                <a class="side__nav-link{% if section.slug == slug %} side__nav-link--active{% endif %}" target="_blank" rel="noopener noreferrer" href="/{{ repo_dir }}/{{ section.slug }}">{{ section.name }}</a>
                                {% else %}
                                {{ section.name }}
                                {% endif %}
                                <ul class="side__nav-list--sub-level-2 {% if slug == section.notebookSlug or slug in section.get('children', [])|map(attribute='notebookSlug') %} side__nav-list--sub-level-2--active{% endif %}">
                                    {% for child in section.children %}
                                    <li class="side__nav-list-item--sub-level-2{% if child.children | length == 0 %} side__nav-list--sub-level-2--empty{% endif %}">
                                        {% if child.notebookSlug %}
                                        <a class="side__nav-link{% if child.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ child.notebookSlug }}">{{ child.name }}</a>
                                        {% else %}
                                        <a class="side__nav-link" href="/{{ repo_dir }}/{{ child.slug }}">{{ child.name }}</a>
                                        {% endif %}
                                        {% if child.children %}
                                        <ul class="side__nav-list--sub-level-3">
                                            {% for child in child.children %}
                                            <li class="side__nav-list-item--sub-level-3">
                                              {% if child.notebookSlug %}
                                              <a class="side__nav-link{% if child.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ child.notebookSlug }}">{{ child.name }}</a>
                                              {% else %}
                                              <a class="side__nav-link" href="/{{ repo_dir }}/{{ child.slug }}">{{ child.name }}</a>
                                              {% endif %}
                                              {% if child.notebookSlug == slug %}
                                              <div class="side__within-page-nav--sub-level-3">
                                              {% include "_includes/page_nav.tpl" %}
                                              </div>
                                              {% endif %}
                                            </li>
                                            {% endfor %}
                                        </ul>
                                        {% endif %}
                                        {% if child.notebookSlug == slug %}
                                        <div class="side__within-page-nav--sub-level-2">
                                        {% include "_includes/page_nav.tpl" %}
                                        </div>
                                        {% endif %}
                                    </li>
                                    {% endfor %}
                                </ul>
                                {% if section.notebookSlug == slug %}
                                <div class="side__within-page-nav--sub-level-1">
                                {% include "_includes/page_nav.tpl" %}
                                </div>
                                {% endif %}
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
            <div class="side__nav-search">
                <input id="search" type="search" placeholder="Search">
                <div class="side__nav-search-icon">
                    <i class="fa fa-search"></i>
                </div>
            </div>

            <nav class="top-bar__nav-container">
                <a href="#" class="top-bar__toggle">≡</a>
                <div class="top-nav-bar__group ">
                    <div class="top-nav-bar__nav nav-bar--blue top-nav-bar__nav--hidden">

                        <ul class="top-nav-bar__links top-nav-bar__links--hidden-smaller-than-tablet">



                            <li class="top-nav-bar__item">
                                <a href="https://www.imandra.ai/" class="top-nav-bar__link">Home</a>
                            </li>



                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--explore">
                                <a class="top-nav-bar__link top-nav-bar__link--group" href="">Explore</a>
                                <ul class="dropdown-content dropdown-content--explore">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--core.svg" alt="Try Imandra" title="Try Imandra Icon">
                                        <a class="dropdown__link" href="https://try.imandra.ai/">Try Online</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--demos.svg" alt="Imandra Demo Gallery" title="Imandra Demo Gallery Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/demos">Demo Gallery</a>
                                    </li>
                                </ul>
                            </li>




                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--docs">
                                <a class="top-nav-bar__link top-nav-bar__link--group" href="">Docs</a>
                                <ul class="dropdown-content dropdown-content--docs">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--docs.svg" alt="Docs" title="Docs Icon">
                                        <a class="dropdown__link" href="https://docs.imandra.ai/imandra-docs/">Imandra Core</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--docs.svg" alt="Docs" title="Docs Icon">
                                        <a class="dropdown__link" href="https://docs.imandra.ai/idf-py/">PYIDF</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--docs.svg" alt="Docs" title="Docs Icon">
                                        <a class="dropdown__link" href="https://docs.imandra.ai/ipl/">IPL</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--docs.svg" alt="Docs" title="Docs Icon">
                                        <a class="dropdown__link" href="https://docs.imandra.ai/imandra-rule-synth/">Rule Synthesis</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--docs.svg" alt="Docs" title="Docs Icon">
                                        <a class="dropdown__link" href="https://docs.imandra.ai/fix-engine/">Fix Engine</a>
                                    </li>
                                </ul>
                            </li>



                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--products">
                                <a class="top-nav-bar__link top-nav-bar__link--group" href="">Products</a>
                                <ul class="dropdown-content dropdown-content--products">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--core.svg" alt="Imandra Core" title="Imandra Core Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/core">Imandra Core</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--systems.svg" alt="Imandra Markets - Systems" title="Imandra Markets - Systems Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/systems">Imandra Markets - Systems</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--connectivity.svg" alt="Imandra Markets - Connectivity" title="Imandra Markets - Connectivity Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/core">Imandra Markets - Connectivity</a>
                                    </li>
                                </ul>
                            </li>



                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--industries">
                                <a class="top-nav-bar__link top-nav-bar__link--group" href="">Industries</a>
                                <ul class="dropdown-content dropdown-content--industries">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--financial.svg" alt="Financial Markets" title="Financial Markets Icon">
                                        <a class="dropdown__link " href="https://www.imandra.ai/imarkets">Financial Markets</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--autonomy.svg" alt="Autonomous Systems" title="Autonomous Systems Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/autonomy">Autonomous Systems</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--ml.svg" alt="Machine Learning" title="Machine Learning Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/ml">Machine Learning</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--government.svg" alt="Machine Learning" title="Machine Learning Icon">
                                        <a class="dropdown__link dropdown__link--last" href="https://www.imandra.ai/government">Government and defense</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--media">
                                <a class="top-nav-bar__link top-nav-bar__link--group" href="">Media</a>
                                <ul class="dropdown-content dropdown-content--media">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--media.svg" alt="Media" title="Media Icon">
                                        <a class="dropdown__link " href="https://www.imandra.ai/media">Media</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--blog.svg" alt="Blog" title="Blog Icon">
                                        <a class="dropdown__link dropdown__link--last " href="https://medium.com/imandra">Blog</a>
                                    </li>
                                </ul>
                            </li>

                            <li class="top-nav-bar__item top-nav-bar__item--group dropdown--company">
                                <a class="top-nav-bar__link top-nav-bar__link--group" href="">Company</a>
                                <ul class="dropdown-content dropdown-content--company">
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--about.svg" alt="About" title="About Icon">
                                        <a class="dropdown__link" href="https://www.imandra.ai/about">About</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--careers.svg" alt=" Careers" title="Careers Icon">
                                        <a class="dropdown__link dropdown__link--last dropdown__link--bottom" href="https://www.imandra.ai/careers">Careers</a>
                                    </li>
                                    <li class="dropdown__item dropdown__item--with-icon">
                                        <img class="dropdown__icon" src="{{ site.baseurl }}/jekyll-resources/assets/img/icon--menu--research.svg" alt="Research" title="Research Icon">
                                        <a class="dropdown__link dropdown__link--last" href="https://www.imandra.ai/research">Research</a>
                                    </li>
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