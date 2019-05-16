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
                                <a class="side__nav-link{% if section.slug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/{{ section.slug }}">{{ section.name }}</a>
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
                <ul class="top-bar__nav-list top-bar__nav-list--hidden">
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://www.imandra.ai/">Home</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://try.imandra.ai/">Try</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://medium.com/imandra">Blog</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://www.imandra.ai/research">Research</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://docs.imandra.ai/">Docs</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://www.imandra.ai/media">Media</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://www.imandra.ai/about">About AI</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://www.imandra.ai/careers">CAREERS</a></li>
                    <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://www.imandra.ai/contact">CONTACT</a></li>
                </ul>
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
            document.querySelector('.side__right-menu-toggler .side__toggle').classList.remove('side__toggle--active');
            document.querySelector('.side__left-menu-toggler .side__toggle').classList.toggle('side__toggle--active');
            document.getElementsByClassName('side__nav-container')[0].classList.toggle('side__nav-container--hidden');
            document.getElementsByClassName('top-bar__nav-list')[0].classList.add('top-bar__nav-list--hidden');
        });

        document.getElementById('toggler--right').addEventListener('click', function () {
            document.querySelector('.side__left-menu-toggler .side__toggle').classList.remove('side__toggle--active');
            document.querySelector('.side__right-menu-toggler .side__toggle').classList.toggle('side__toggle--active');
            document.getElementsByClassName('side__nav-container')[0].classList.add('side__nav-container--hidden');
            document.getElementsByClassName('top-bar__nav-list')[0].classList.toggle('top-bar__nav-list--hidden');
        });

    </script>
</header>
