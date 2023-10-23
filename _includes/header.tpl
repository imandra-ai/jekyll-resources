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
                                <ul class="side__nav-list--sub-level-2 {% if slug == section.notebookSlug or slug in section.get('children', [])|map(attribute='notebookSlug')
                                 %} side__nav-list--sub-level-2--active{% endif %}">
                                    {% if section.miniSections %}
                                    {% set outerMiniSections = section.miniSections %}
                                    {% else %}
                                    {% set outerMiniSections = [section.children]%}
                                    {% endif %}
                                    {% for miniSec in outerMiniSections %}
                                        {% if section.miniSections %}
                                        <li class="side__nav-list-item--sub-level-2 side__nav-list--sub-level-2--empty">
                                        <span class="side__nav-link side__nav-link--minisec">{{miniSec}}</span>
                                        </li>
                                        {% set innerSec = section.children|selectattr("miniSection","equalto",miniSec) %}
                                        {% else %}
                                        {% set innerSec = miniSec %}
                                        {% endif %}
                                        {% for child in innerSec %}
                                        <li class="side__nav-list-item--sub-level-2{% if child.children | length == 0 %} side__nav-list--sub-level-2--empty{% endif %}">
                                            {% if child.notebookSlug %}
                                            <a class="side__nav-link{% if child.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ child.notebookSlug }}">{{ child.name }}</a>
                                            {% else %}
                                            <a class="side__nav-link" href="/{{ repo_dir }}/{{ child.slug }}">{{ child.name }}</a>
                                            {% endif %}
                                            {% if child.children | length > 1 %}
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
                                    {% endfor %}
                                </ul>
                                {% if section.notebookSlug == slug and (not section.ignoreSubheadings)%}
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



     <div class="template-header">
        <div class="top-bar">

            <nav class="top-bar__nav-container" id="top-menu">

                <div class="page-header-nav-container">
                    <div class="side__nav-search">
                        <div class="side__nav-search-icon">
                            <i class="fa fa-search"></i>
                        </div>
                        <input id="search" type="search" placeholder="Search">
                    </div>

                    <nav class="page-header-nav">
                        <ul class="page-header-nav__list">
                            <li class="page-header-nav__list-item">
                                <button class="page-header-nav__list-item-link" aria-haspopup="true" aria-expanded="false" data-index="0">Products</button>
                            </li>
                            <li class="page-header-nav__list-item">
                                <button class="page-header-nav__list-item-link" aria-haspopup="true" aria-expanded="false" data-index="1">Use cases</button>
                            </li>
                            <li class="page-header-nav__list-item">
                                <button class="page-header-nav__list-item-link" aria-haspopup="true" aria-expanded="false" data-index="2">Docs</button>
                            </li>
                            <li class="page-header-nav__list-item">
                                <button class="page-header-nav__list-item-link" aria-haspopup="true" aria-expanded="false" data-index="3">Company</button>
                            </li>
                        </ul>


                    </nav>

                     <div class="page-nav-menu-container" hidden>
                            <div class="page-nav-menu__arrow" hidden></div>
                            <nav class="page-nav-menu">

                                <ul class="page-nav-menu__list">

                                    <li class="page-nav-menu__card type--products" hidden>
                                        <div class="page-nav-menu__card-column">
                                            <section class="page-nav-menu__card-section">
                                                <h6 class="page-nav-menu__card-section-title">Financial Services</h6>
                                                <ul class="page-nav-menu__card-list">

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/financial-services">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">


                                                                <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="page-nav-menu__card-list-icon">
                                                                    <linearGradient id="a222" gradientUnits="userSpaceOnUse" x1="23.82" x2="3.1" y1="15.95" y2="15.95">
                                                                        <stop offset="0" stop-color="#008060" />
                                                                        <stop offset="1" stop-color="#00f0b4" />
                                                                    </linearGradient>
                                                                    <linearGradient id="b222" gradientUnits="userSpaceOnUse" x1="29.88" x2="17.26" y1="15.94" y2="15.94">
                                                                        <stop offset="0" stop-color="#7656f0" />
                                                                        <stop offset="1" stop-color="#08f" />
                                                                    </linearGradient>
                                                                    <rect fill="url(#a222)" height="20.72" opacity=".8" rx="5.26" transform="matrix(.70710678 .70710678 -.70710678 .70710678 15.22 -4.85)" width="20.72" x="3.11" y="5.58" />
                                                                    <rect fill="url(#b222)" height="12.62" opacity=".8" rx="3.2" transform="matrix(.70710678 .70710678 -.70710678 .70710678 18.18 -12)" width="12.62" x="17.26" y="9.63" />
                                                                </svg>
                                                            </span>

                                                            <span class="page-nav-menu__card-list-title" data-element="title">Overview
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-subtitle"></span></a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/markets">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">
                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="linear-gradient444" x1="-6232.42" y1="1369.76" x2="-6212.69" y2="1369.76" gradientTransform="translate(-4649.36 4349.96) rotate(149.58)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="linear-gradient-442" x1="147.94" y1="1467.46" x2="167.68" y2="1467.46" gradientTransform="translate(-869.79 -1171.4) rotate(-30.42)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M11.68,14.19,25.16,6.41a2.09,2.09,0,0,1,3.13,1.81V23.78a2.09,2.09,0,0,1-3.13,1.81L11.68,17.81A2.09,2.09,0,0,1,11.68,14.19Z" opacity="0.8" fill="url(#linear-gradient444)" />
                                                                        <path d="M20.54,17.81,7.06,25.59a2.09,2.09,0,0,1-3.13-1.81V8.22A2.09,2.09,0,0,1,7.06,6.41l13.48,7.78A2.09,2.09,0,0,1,20.54,17.81Z" opacity="0.8" fill="url(#linear-gradient-442)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Markets
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-subtitle"></span></a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/connectivity">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve" class="page-nav-menu__card-list-icon">
                                                                    <linearGradient id="SVGID_1_1234" gradientUnits="userSpaceOnUse" x1="19.52" y1="1181.2125" x2="27.11" y2="1181.2125" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                                        <stop offset="0" style="stop-color:#7656F0" />
                                                                        <stop offset="1" style="stop-color:#0088FF" />
                                                                    </linearGradient>
                                                                    <path style="opacity:0.8;fill:url(#SVGID_1_1234);enable-background:new    ;" d="M25.5,26.9l-5-1.3c-0.7-0.2-1.1-0.9-0.9-1.6c0.1-0.2,0.2-0.4,0.3-0.6l3.6-3.6c0.5-0.5,1.4-0.5,1.9,0c0.2,0.2,0.3,0.4,0.3,0.6l1.3,5c0.2,0.7-0.3,1.4-1,1.6C25.8,26.9,25.6,26.9,25.5,26.9z" />
                                                                    <linearGradient id="SVGID_2_1234" gradientUnits="userSpaceOnUse" x1="11.6378" y1="1165.4003" x2="6.7478" y2="1166.9103" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                                        <stop offset="0" style="stop-color:#F0567E" />
                                                                        <stop offset="1" style="stop-color:#9C56AA" />
                                                                    </linearGradient>
                                                                    <path style="opacity:0.8;fill:url(#SVGID_2_1234);enable-background:new    ;" d="M7.1,5.3l4.5,1.2c0.6,0.2,1,0.9,0.8,1.5c-0.1,0.2-0.2,0.4-0.3,0.5l-3.3,3.3c-0.5,0.5-1.2,0.5-1.7,0c-0.1-0.1-0.2-0.3-0.3-0.5L5.7,6.8C5.5,6.2,5.9,5.5,6.5,5.3C6.7,5.3,6.9,5.3,7.1,5.3z" />
                                                                    <linearGradient id="SVGID_3_1234" gradientUnits="userSpaceOnUse" x1="10.4641" y1="1177.4569" x2="8.1041" y2="1185.547" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                                        <stop offset="0" style="stop-color:#F0AA3D" />
                                                                        <stop offset="1" style="stop-color:#F0567E" />
                                                                    </linearGradient>
                                                                    <path style="opacity:0.8;fill:url(#SVGID_3_1234);enable-background:new    ;" d="M5.3,25.1l1.3-4.8c0.2-0.7,0.9-1.1,1.6-0.9c0.2,0.1,0.4,0.2,0.6,0.3l3.5,3.5c0.5,0.5,0.5,1.3,0,1.8c-0.2,0.2-0.4,0.3-0.6,0.3l-4.8,1.3c-0.7,0.2-1.4-0.2-1.6-0.9C5.3,25.6,5.3,25.3,5.3,25.1z" />
                                                                    <linearGradient id="SVGID_4_1234" gradientUnits="userSpaceOnUse" x1="21.8863" y1="1169.4392" x2="24.4063" y2="1162.1991" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                                        <stop offset="0" style="stop-color:#0088FF" />
                                                                        <stop offset="1" style="stop-color:#00F0B4" />
                                                                    </linearGradient>
                                                                    <path style="opacity:0.8;fill:url(#SVGID_4_1234);enable-background:new    ;" d="M26.7,6.8l-1.2,4.7c-0.2,0.7-0.9,1.1-1.5,0.9c-0.2-0.1-0.4-0.2-0.6-0.3L20,8.6c-0.5-0.5-0.5-1.3,0-1.8c0.2-0.2,0.3-0.3,0.6-0.3l4.7-1.2c0.7-0.2,1.3,0.3,1.5,0.9C26.8,6.4,26.8,6.6,26.7,6.8z" />
                                                                    <linearGradient id="SVGID_5_1234" gradientUnits="userSpaceOnUse" x1="13.56" y1="1174" x2="18.44" y2="1174" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                                        <stop offset="0" style="stop-color:#FFEF54" />
                                                                        <stop offset="1" style="stop-color:#F0AA3D" />
                                                                    </linearGradient>
                                                                    <path style="fill-rule:evenodd;clip-rule:evenodd;fill:url(#SVGID_5_1234);" d="M16,13.5c-1.4,0-2.5,1.1-2.5,2.5s1.1,2.5,2.5,2.5l0,0c1.4,0,2.5-1.1,2.5-2.5S17.4,13.5,16,13.5z" />
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Connectivity
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-subtitle"></span></a>
                                                    </li>
                                                </ul>
                                            </section>

                                            <section class="page-nav-menu__card-section">
                                                <h6 class="page-nav-menu__card-section-title">Key Technology</h6>
                                                <ul class="page-nav-menu__card-list">

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/core">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">
                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="linear-gradient" x1="-5972.02" y1="964.31" x2="-5950.71" y2="964.31" gradientTransform="translate(3868.04 4665.89) rotate(59.58)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="linear-gradient-2" x1="15.97" y1="4.28" x2="15.97" y2="25.85" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="linear-gradient-3" x1="7.39" y1="16" x2="0.33" y2="16" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#ffef54" />
                                                                            <stop offset="1" stop-color="#f0aa3d" />
                                                                        </linearGradient>
                                                                        <linearGradient id="linear-gradient-4" x1="24.81" y1="16" x2="31.82" y2="16" xlink:href="#linear-gradient-3" />
                                                                        <linearGradient id="linear-gradient-5" x1="16.01" y1="13.37" x2="16.01" y2="22.16" xlink:href="#linear-gradient-3"/>
                                                                    </defs>
                                                                    <g data-name="Layer 1">
                                                                        <path d="M13.36,25,5.77,11.86A3.05,3.05,0,0,1,8.42,7.28H23.6a3.06,3.06,0,0,1,2.65,4.58L18.66,25A3.06,3.06,0,0,1,13.36,25Z" opacity="0.8" fill="url(#linear-gradient)" />
                                                                        <path d="M18.55,6.78l7.59,13.15a3,3,0,0,1-2.58,4.47H8.37a3,3,0,0,1-2.58-4.47l7.6-13.15A3,3,0,0,1,18.55,6.78Z" opacity="0.8" fill="url(#linear-gradient-2)" />
                                                                        <path d="M3.75,12.31a3.69,3.69,0,0,1,0,7.38A3.73,3.73,0,0,1,.06,16a3.6,3.6,0,0,1,3.69-3.69" opacity="0.8" fill="url(#linear-gradient-3)" />
                                                                        <path d="M28.21,12.31A3.69,3.69,0,1,1,24.52,16a3.63,3.63,0,0,1,3.69-3.69" opacity="0.8" fill="url(#linear-gradient-4)" />
                                                                        <path d="M16,19.82h0a1.77,1.77,0,0,1-1.76-1.76V13.94A1.77,1.77,0,0,1,16,12.18h0a1.77,1.77,0,0,1,1.76,1.76v4.12A1.8,1.8,0,0,1,16,19.82Z" opacity="0.8" fill="url(#linear-gradient-5)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Imandra Core
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-subtitle"></span></a>
                                                    </li>

                                                    
                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/mbsd">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">
                                                                
                                                                <svg  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" class="page-nav-menu__card-list-icon">
                                                                    <path opacity="0.8" d="M26.71 20.42V11.58C26.71 11.044 26.5697 10.5174 26.303 10.0525C26.0364 9.5876 25.6526 9.2006 25.19 8.93L17.53 4.51C17.0657 4.24425 16.54 4.10445 16.005 4.10445C15.47 4.10445 14.9443 4.24425 14.48 4.51L6.81001 8.93C6.34738 9.2006 5.96365 9.5876 5.69698 10.0525C5.43031 10.5174 5.29001 11.044 5.29001 11.58V20.42C5.29001 20.956 5.43031 21.4826 5.69698 21.9475C5.96365 22.4124 6.34738 22.7994 6.81001 23.07L14.48 27.49C14.9443 27.7558 15.47 27.8956 16.005 27.8956C16.54 27.8956 17.0657 27.7558 17.53 27.49L25.19 23.07C25.6526 22.7994 26.0364 22.4124 26.303 21.9475C26.5697 21.4826 26.71 20.956 26.71 20.42Z" fill="url(#linear_41_841)"/>
                                                                    <path d="M19.47 18.09V14.04L15.96 12.02L12.45 14.04V18.09L15.96 20.12L19.47 18.09Z" fill="url(#linear1_41_841)"/>
                                                                    <defs>
                                                                        <linearGradient id="linear_41_841" x1="8.50001" y1="8.5" x2="24.04" y2="24.03" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#0088FF"/>
                                                                        <stop offset="1" stop-color="#00F0B4"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="linear1_41_841" x1="13.43" y1="13.54" x2="18.67" y2="18.78" gradientUnits="userSpaceOnUse">
                                                                        <stop offset="0.01" stop-color="#78FF80"/>
                                                                        <stop offset="1" stop-color="#F0E566"/>
                                                                        </linearGradient>
                                                                    </defs>
                                                            </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">MBSD
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-subtitle"></span></a>
                                                    </li>
                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/imandra-protocol-language">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="a2d3592c-19b2-40ba-b0d9-34ed8bb43352" x1="3.42" y1="13.89" x2="17.17" y2="2.51" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#22b573" />
                                                                            <stop offset="1" stop-color="#34ebb9" />
                                                                        </linearGradient>
                                                                        <linearGradient id="e3fbbadc-8618-4a08-bbd2-1ca7cb060821" x1="3.11" y1="24.95" x2="19.28" y2="11.56" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a202105d-7a01-4785-8ee8-837079e81374" x1="13.91" y1="19.85" x2="27.67" y2="8.47" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                        <linearGradient id="ff2142a4-3d09-4642-97bd-a2dbbbb92e8e" x1="9.62" y1="18.67" x2="18.92" y2="10.97" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M18.78,11,6.9,17.82a1.12,1.12,0,0,1-1.69-1V3.13a1.13,1.13,0,0,1,1.69-1L18.78,9A1.13,1.13,0,0,1,18.78,11Z" style="opacity: 0.8;fill: url(#a2d3592c-19b2-40ba-b0d9-34ed8bb43352)" />
                                                                        <path d="M21.17,21.51l-14,8.06a1.32,1.32,0,0,1-2-1.14V12.29a1.33,1.33,0,0,1,2-1.15l14,8.07A1.32,1.32,0,0,1,21.17,21.51Z" style="opacity: 0.8;fill: url(#e3fbbadc-8618-4a08-bbd2-1ca7cb060821)" />
                                                                        <path d="M29.27,16.93,17.39,23.78a1.12,1.12,0,0,1-1.69-1V9.09a1.12,1.12,0,0,1,1.69-1L29.27,15A1.13,1.13,0,0,1,29.27,16.93Z" style="opacity: 0.8;fill: url(#a202105d-7a01-4785-8ee8-837079e81374)" />
                                                                        <path d="M19.69,17l-7.4,4.27a1.13,1.13,0,0,1-1.69-1V11.73a1.13,1.13,0,0,1,1.69-1L19.69,15A1.13,1.13,0,0,1,19.69,17Z" style="opacity: 0.8;fill: url(#ff2142a4-3d09-4642-97bd-a2dbbbb92e8e)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">IPL
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-subtitle"></span></a>
                                                    </li>
                                                </ul>
                                            </section>

                                        </div>

                                        <div class="page-nav-menu__card-column">
                                            <section class="page-nav-menu__card-section type--extended">
                                                <h6 class="page-nav-menu__card-section-title">Explore</h6>
                                                <ul class="page-nav-menu__card-list">

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://try.imandra.ai">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon big-icon">
                                                                    <defs>
                                                                        <linearGradient id="a4c289ff-0fcf-4609-9b23-7d9b1494b4fa" x1="7.39" y1="24.61" x2="25.22" y2="6.78" gradientTransform="translate(32 32) rotate(-180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0aa3d" />
                                                                            <stop offset="1" stop-color="#f0567e" />
                                                                        </linearGradient>
                                                                        <linearGradient id="ec664c46-8b05-4d65-9ff3-3073f47ee906" x1="-782.2" y1="-256.03" x2="-764.38" y2="-273.85" gradientTransform="translate(-757.59 -248.64) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a12544d8-6484-4dd4-ad6e-5781a5ae2002" x1="6.73" y1="16" x2="18.98" y2="16" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <rect x="3.85" y="8.23" width="24.29" height="15.53" rx="1.87" transform="translate(32 32) rotate(180)" style="opacity: 0.8;fill: url(#a4c289ff-0fcf-4609-9b23-7d9b1494b4fa)" />
                                                                        <rect x="3.79" y="8.01" width="24.42" height="15.99" rx="2.39" transform="translate(0 32) rotate(-90)" style="opacity: 0.8;fill: url(#ec664c46-8b05-4d65-9ff3-3073f47ee906)" />
                                                                        <path d="M19.23,17l-4.55,2.57a1.13,1.13,0,0,1-1.68-1V13.44a1.13,1.13,0,0,1,1.68-1L19.23,15A1.13,1.13,0,0,1,19.23,17Z" style="opacity: 0.8;fill: url(#a12544d8-6484-4dd4-ad6e-5781a5ae2002)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-description">
                                                                <span class="page-nav-menu__card-list-title" data-element="title">Try Imandra Online
                                                                    <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                            <g>
                                                                                <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                            </g>
                                                                        </svg>
                                                                    </span>
                                                                </span>
                                                            <span class="page-nav-menu__card-list-subtitle" data-element="subtitle">Imandra Core in your browser via Jupyter</span>
                                                        </span></a>

                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/demos">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon big-icon">
                                                                    <defs>
                                                                        <linearGradient id="f4fc95a8-cc01-4990-8fba-1e101f4d2694" x1="-792.61" y1="-675.43" x2="-810.71" y2="-675.43" gradientTransform="translate(810.84 692.43)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0aa3d" />
                                                                            <stop offset="1" stop-color="#f0567e" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b427c6e4-08c2-4776-897e-2b8bd9bbb222" x1="-798.43" y1="-679.43" x2="-816.52" y2="-679.43" gradientTransform="translate(820.65 690.61)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#9d56a8" />
                                                                            <stop offset="1" stop-color="#7656f0" />
                                                                        </linearGradient>
                                                                        <linearGradient id="feab6c9f-96f6-45b0-a61b-132a6100febe" x1="-792.67" y1="-689.29" x2="-810.77" y2="-689.29" gradientTransform="translate(824.76 706.24)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b829fbee-9f30-4238-8b71-fd946660d1ba" x1="-788.9" y1="-682.25" x2="-806.99" y2="-682.25" gradientTransform="translate(813.95 702.97)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="e212c59f-23dc-488b-b5f3-8ae434490a41" x1="12.82" y1="20.29" x2="18.77" y2="15.37" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <rect x="0.13" y="10.09" width="18.1" height="13.83" rx="2.35" transform="translate(26.18 7.82) rotate(90)" style="fill: url(#f4fc95a8-cc01-4990-8fba-1e101f4d2694)" />
                                                                        <rect x="4.12" y="4.27" width="18.1" height="13.83" rx="2.35" transform="translate(24.36 -1.98) rotate(90)" style="opacity: 0.8;fill: url(#b427c6e4-08c2-4776-897e-2b8bd9bbb222)" />
                                                                        <rect x="13.99" y="10.03" width="18.1" height="13.83" rx="2.35" transform="translate(39.99 -6.1) rotate(90)" style="opacity: 0.8;fill: url(#feab6c9f-96f6-45b0-a61b-132a6100febe)" />
                                                                        <rect x="6.95" y="13.8" width="18.1" height="13.83" rx="2.35" transform="translate(36.72 4.72) rotate(90)" style="opacity: 0.8;fill: url(#b829fbee-9f30-4238-8b71-fd946660d1ba)" />
                                                                        <path d="M18.91,19.52l-4,2.32a1.13,1.13,0,0,1-1.69-1V16.22a1.12,1.12,0,0,1,1.69-1l4,2.32A1.13,1.13,0,0,1,18.91,19.52Z" style="opacity: 0.8;fill: url(#e212c59f-23dc-488b-b5f3-8ae434490a41)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-description">
                                                                <span class="page-nav-menu__card-list-title" data-element="title">Core Gallery
                                                                    <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                            <g>
                                                                                <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                            </g>
                                                                        </svg>
                                                                    </span>
                                                                </span>
                                                            <span class="page-nav-menu__card-list-subtitle" data-element="subtitle">Select categorized Imandra Core examples</span>
                                                        </span></a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/ipl-gallery">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon big-icon">
                                                                    <defs>
                                                                        <linearGradient id="f1ff39d3-65a8-48e0-96a9-7f884b71c0bd" x1="8.41" y1="17.62" x2="20.99" y2="7.21" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a0ac3c9e-da37-4212-92b1-0883dc35da1b" x1="5.13" y1="23.33" x2="18.13" y2="12.57" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a290bf01-df5c-4429-9e1b-5e1b4f541c74" x1="13.3" y1="24.19" x2="22.47" y2="16.6" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b3613447-7b86-40d3-9fd1-c0166b75b3e8" x1="15.84" y1="18.51" x2="27.48" y2="8.87" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0567e" />
                                                                            <stop offset="1" stop-color="#9c56aa" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g id="ac4d253e-55ef-4cb2-b19a-e786d49ffbea" data-name="Layer 1">
                                                                        <path d="M11,10.93,21,16.7a1.52,1.52,0,0,1,0,2.64L11,25.11A1.52,1.52,0,0,1,8.7,23.8V12.25A1.52,1.52,0,0,1,11,10.93Z" style="opacity: 0.8;fill: url(#f1ff39d3-65a8-48e0-96a9-7f884b71c0bd)" />
                                                                        <path d="M17.27,10.56l10.34,6a1.57,1.57,0,0,1,0,2.72l-10.34,6a1.57,1.57,0,0,1-2.36-1.36V11.92A1.57,1.57,0,0,1,17.27,10.56Z" style="opacity: 0.8;fill: url(#a0ac3c9e-da37-4212-92b1-0883dc35da1b)" />
                                                                        <path d="M16.61,6.29l7.3,4.21a1.11,1.11,0,0,1,0,1.92l-7.3,4.22a1.11,1.11,0,0,1-1.66-1V7.25A1.11,1.11,0,0,1,16.61,6.29Z" style="opacity: 0.8;fill: url(#a290bf01-df5c-4429-9e1b-5e1b4f541c74)" />
                                                                        <path d="M8.69,4.84,18,10.19a1.41,1.41,0,0,1,0,2.44L8.69,18a1.41,1.41,0,0,1-2.11-1.22V6.06A1.41,1.41,0,0,1,8.69,4.84Z" style="opacity: 0.8;fill: url(#b3613447-7b86-40d3-9fd1-c0166b75b3e8)" />
                                                                    </g>
                                                                </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-description">
                                                                <span class="page-nav-menu__card-list-title" data-element="title">IPL Gallery
                                                                    <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                            <g>
                                                                                <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                            </g>
                                                                        </svg>
                                                                    </span>
                                                                </span>
                                                                <span class="page-nav-menu__card-list-subtitle" data-element="subtitle">IPL state exploration demos</span>
                                                        </span></a>
                                                    </li>
                                                </ul>
                                            </section>
                                        </div>

                                    </li>



                                    <li class="page-nav-menu__card type--use-cases" hidden>
                                        <div class="page-nav-menu__card-column">
                                            <section class="page-nav-menu__card-section">
                                                <h6 class="page-nav-menu__card-section-title">Industries</h6>
                                                <ul class="page-nav-menu__card-list">

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/financial-services">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="ac79aab1-f01f-4aab-95c6-9240d1769302" x1="-472.51" y1="-973.62" x2="-485.84" y2="-973.62" gradientTransform="translate(487.17 989.39)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="bff2810f-faad-4f93-b4c1-44baefa38cc0" x1="-466.85" y1="-979.27" x2="-480.18" y2="-979.27" gradientTransform="translate(616.25 1263.79) scale(1.27 1.27)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#009973" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b90f00b0-887a-4c68-88dc-037e37d6503c" x1="-461.19" y1="-984.93" x2="-474.52" y2="-984.93" gradientTransform="translate(491.86 1000.7)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <rect x="1.33" y="9.1" width="13.33" height="13.33" rx="3.55" transform="translate(13.49 -1.04) rotate(45)" style="opacity: 0.8;fill: url(#ac79aab1-f01f-4aab-95c6-9240d1769302)" />
                                                                        <rect x="7.55" y="7.28" width="16.9" height="16.99" rx="3.55" transform="translate(15.84 -6.7) rotate(45)" style="opacity: 0.8;fill: url(#bff2810f-faad-4f93-b4c1-44baefa38cc0)" />
                                                                        <rect x="17.34" y="9.1" width="13.33" height="13.33" rx="3.55" transform="translate(18.18 -12.35) rotate(45)" style="opacity: 0.8;fill: url(#b90f00b0-887a-4c68-88dc-037e37d6503c)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Financial Services
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/autonomous-systems">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="f3cc560b-102e-4655-a1b1-253c5cba9660" x1="-1293.96" y1="-192.45" x2="-1276.66" y2="-192.45" gradientTransform="matrix(1, -0.01, 0.01, 1, 1302.66, 194.66)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b02a9ebe-dfbe-49c5-bc4e-3ae4088bdd87" x1="-1296.71" y1="180.47" x2="-1279.41" y2="180.47" gradientTransform="matrix(1, 0.01, 0.01, -1, 1302.66, 210.28)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b79c21d3-ee2c-4f04-9cbb-3daa25cdc452" x1="-1321.64" y1="-233.77" x2="-1304.66" y2="-233.77" gradientTransform="translate(-203.88 1330.8) rotate(89.58)" xlink:href="#f3cc560b-102e-4655-a1b1-253c5cba9660" />
                                                                        <linearGradient id="bf2d5ed8-1594-4d49-bfd3-7edf55d6511e" x1="18.31" y1="15.97" x2="4.84" y2="16.14" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" xlink:href="#b02a9ebe-dfbe-49c5-bc4e-3ae4088bdd87" />
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M21.37,19.58H10.63a3.28,3.28,0,0,1-2.84-4.91l5.37-9.3a3.28,3.28,0,0,1,5.68,0l5.37,9.3A3.28,3.28,0,0,1,21.37,19.58Z" style="opacity: 0.66;fill: url(#f3cc560b-102e-4655-a1b1-253c5cba9660)" />
                                                                        <path d="M21.37,12.42H10.63a3.28,3.28,0,0,0-2.84,4.91l5.37,9.3a3.28,3.28,0,0,0,5.68,0l5.37-9.3A3.28,3.28,0,0,0,21.37,12.42Z" style="opacity: 0.66;fill: url(#b02a9ebe-dfbe-49c5-bc4e-3ae4088bdd87)" />
                                                                        <path d="M12.42,21V11a3.48,3.48,0,0,1,5.23-3l8.66,5a3.48,3.48,0,0,1,0,6l-8.66,5A3.48,3.48,0,0,1,12.42,21Z" style="opacity: 0.66;fill: url(#b79c21d3-ee2c-4f04-9cbb-3daa25cdc452)" />
                                                                        <path d="M19.58,21V11a3.48,3.48,0,0,0-5.23-3L5.69,13a3.48,3.48,0,0,0,0,6l8.66,5A3.48,3.48,0,0,0,19.58,21Z" style="opacity: 0.66;fill: url(#bf2d5ed8-1594-4d49-bfd3-7edf55d6511e)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Autonomous Systems
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/government">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="e91eec89-0bc9-4d97-85d6-4dcaee6fad8c" x1="3.88" y1="28.53" x2="21.06" y2="18.13" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a35f1a17-4bbf-4ea7-9630-e732a4403e5a" x1="14.51" y1="1801.35" x2="27.59" y2="1801.35" gradientTransform="translate(-1527.76 941.73) rotate(-120.42)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a6daf51c-f8f6-474c-a458-31d5f8507054" x1="-2355.41" y1="410.63" x2="-2346.48" y2="410.63" gradientTransform="translate(-786.66 2269.45) rotate(119.58)" xlink:href="#a35f1a17-4bbf-4ea7-9630-e732a4403e5a" />
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M17.81,9.73l8.91,15.44a2.08,2.08,0,0,1-1.81,3.12H7.09a2.08,2.08,0,0,1-1.81-3.12L14.19,9.73A2.09,2.09,0,0,1,17.81,9.73Z" style="opacity: 0.8;fill: url(#e91eec89-0bc9-4d97-85d6-4dcaee6fad8c)" />
                                                                        <path d="M17.81,4.58l4.45,7.72a2.08,2.08,0,0,1-1.81,3.12h-8.9A2.08,2.08,0,0,1,9.74,12.3l4.45-7.72A2.09,2.09,0,0,1,17.81,4.58Z" style="opacity: 0.8;fill: url(#a35f1a17-4bbf-4ea7-9630-e732a4403e5a)" />
                                                                        <path d="M11.78,22.46l2.67-4.63a1.79,1.79,0,0,1,3.1,0l2.67,4.63a1.79,1.79,0,0,1-1.55,2.68H13.33A1.79,1.79,0,0,1,11.78,22.46Z" style="opacity: 0.8;fill: url(#a6daf51c-f8f6-474c-a458-31d5f8507054)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Government & Defense
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </section>
                                        </div>
                                        <div class="page-nav-menu__card-column">
                                            <section class="page-nav-menu__card-section">
                                                <h6 class="page-nav-menu__card-section-title">Applications</h6>
                                                <ul class="page-nav-menu__card-list">



                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/mbsd">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                              <svg  viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg" class="page-nav-menu__card-list-icon">
                                                                <path opacity="0.8" d="M26.71 20.42V11.58C26.71 11.044 26.5697 10.5174 26.303 10.0525C26.0364 9.5876 25.6526 9.2006 25.19 8.93L17.53 4.51C17.0657 4.24425 16.54 4.10445 16.005 4.10445C15.47 4.10445 14.9443 4.24425 14.48 4.51L6.81001 8.93C6.34738 9.2006 5.96365 9.5876 5.69698 10.0525C5.43031 10.5174 5.29001 11.044 5.29001 11.58V20.42C5.29001 20.956 5.43031 21.4826 5.69698 21.9475C5.96365 22.4124 6.34738 22.7994 6.81001 23.07L14.48 27.49C14.9443 27.7558 15.47 27.8956 16.005 27.8956C16.54 27.8956 17.0657 27.7558 17.53 27.49L25.19 23.07C25.6526 22.7994 26.0364 22.4124 26.303 21.9475C26.5697 21.4826 26.71 20.956 26.71 20.42Z" fill="url(#linear_41_84)"/>
                                                                <path d="M19.47 18.09V14.04L15.96 12.02L12.45 14.04V18.09L15.96 20.12L19.47 18.09Z" fill="url(#linear1_41_84)"/>
                                                                <defs>
                                                                    <linearGradient id="linear_41_84" x1="8.50001" y1="8.5" x2="24.04" y2="24.03" gradientUnits="userSpaceOnUse">
                                                                    <stop stop-color="#0088FF"/>
                                                                    <stop offset="1" stop-color="#00F0B4"/>
                                                                    </linearGradient>
                                                                    <linearGradient id="linear1_41_84" x1="13.43" y1="13.54" x2="18.67" y2="18.78" gradientUnits="userSpaceOnUse">
                                                                    <stop offset="0.01" stop-color="#78FF80"/>
                                                                    <stop offset="1" stop-color="#F0E566"/>
                                                                    </linearGradient>
                                                                </defs>
                                                        </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title type--multiline" data-element="title">MBSD
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/formal-verification">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="e11043fc-9585-43e0-b376-e20b744f77dc" x1="-6486.77" y1="1751.17" x2="-6462.87" y2="1751.17" gradientTransform="translate(4710.7 -4774.97) rotate(-30.42)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="f478ffd2-0a36-46a3-836a-a27eb8a1409f" x1="-670.11" y1="1152.89" x2="-646.21" y2="1152.89" gradientTransform="translate(34.16 1345.97) rotate(149.58)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="adcd2281-390c-409d-8681-ff96cea5c2fe" x1="-139.6" y1="-54.39" x2="-134.11" y2="-59.88" gradientTransform="translate(-41.04 152.86) rotate(90)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M28,17.94,10.89,27.8A2.08,2.08,0,0,1,7.76,26V6.28a2.09,2.09,0,0,1,3.13-1.81L28,14.33A2.08,2.08,0,0,1,28,17.94Z" style="opacity: 0.8;fill: url(#e11043fc-9585-43e0-b376-e20b744f77dc)" />
                                                                        <path d="M4,14.33,21.11,4.47a2.09,2.09,0,0,1,3.13,1.81V26a2.08,2.08,0,0,1-3.13,1.8L4,17.94A2.08,2.08,0,0,1,4,14.33Z" style="opacity: 0.8;fill: url(#f478ffd2-0a36-46a3-836a-a27eb8a1409f)" />
                                                                        <polygon points="19.67 18.03 19.67 13.79 16 11.66 12.33 13.79 12.33 18.03 16 20.15 19.67 18.03" style="fill: url(#adcd2281-390c-409d-8681-ff96cea5c2fe)" />
                                                                    </g>
                                                                </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Formal Methods
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/trustworthy-ai">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                    <svg viewBox="0 0 33 33" fill="none" xmlns="http://www.w3.org/2000/svg" class="page-nav-menu__card-list-icon">
                                                                        <circle opacity="0.8" cx="12.4903" cy="20.4158" r="7.5799" fill="url(#paint0_linear_221_351)"/>
                                                                        <circle opacity="0.8" cx="21.3696" cy="20.4158" r="7.5799" fill="url(#paint1_linear_221_351)"/>
                                                                        <circle opacity="0.8" cx="16.5215" cy="13.0148" r="7.5799" fill="url(#paint2_linear_221_351)"/>
                                                                        <circle opacity="0.96" cx="16.9231" cy="18.0637" r="2.53096" transform="rotate(90 16.9231 18.0637)" fill="url(#paint3_linear_221_351)"/>
                                                                        <defs>
                                                                        <linearGradient id="paint0_linear_221_351" x1="20.8781" y1="20.4076" x2="5.79153" y2="20.4076" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#9D56A8"/>
                                                                        <stop offset="1" stop-color="#7656F0"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint1_linear_221_351" x1="14.002" y1="20.4951" x2="29.0259" y2="20.4951" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#7656F0"/>
                                                                        <stop offset="1" stop-color="#0088FF"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint2_linear_221_351" x1="8.87658" y1="12.974" x2="24.044" y2="12.8732" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#008060"/>
                                                                        <stop offset="1" stop-color="#00F0B4"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint3_linear_221_351" x1="14.3534" y1="18.0488" x2="19.4178" y2="18.0151" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#F0AA3D"/>
                                                                        <stop offset="1" stop-color="#F0567E"/>
                                                                        </linearGradient>
                                                                        </defs>
                                                                        </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Trustworthy AI
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/system-integration">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="fb1d24f0-9b89-4767-87cb-7507850304fa" x1="-376.77" y1="-904.04" x2="-390.25" y2="-904.04" gradientTransform="translate(399.51 916.37)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0aa3d" />
                                                                            <stop offset="1" stop-color="#f0567e" />
                                                                        </linearGradient>
                                                                        <linearGradient id="bbe115bd-49de-46c0-aa1b-bf278cfa82bc" x1="-371.58" y1="-898.85" x2="-385.06" y2="-898.85" gradientTransform="translate(394.32 918.52)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#9d56a8" />
                                                                            <stop offset="1" stop-color="#7656f0" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a7c75838-1ed1-4bd1-9598-212d831a238d" x1="-376.77" y1="-898.85" x2="-390.25" y2="-898.85" gradientTransform="translate(395.84 914.85)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b678988d-2758-4be4-b2db-88d0d0107aba" x1="-371.59" y1="-904.04" x2="-385.07" y2="-904.04" gradientTransform="translate(397.99 920.04)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <rect x="9.26" y="5.59" width="13.48" height="13.48" rx="3.55" transform="translate(13.41 -7.7) rotate(45)" style="opacity: 0.8;fill: url(#fb1d24f0-9b89-4767-87cb-7507850304fa)" />
                                                                        <rect x="9.26" y="12.93" width="13.48" height="13.48" rx="3.55" transform="translate(18.59 -5.55) rotate(45)" style="opacity: 0.8;fill: url(#bbe115bd-49de-46c0-aa1b-bf278cfa82bc)" />
                                                                        <rect x="5.59" y="9.26" width="13.48" height="13.48" rx="3.55" transform="translate(14.93 -4.04) rotate(45)" style="opacity: 0.8;fill: url(#a7c75838-1ed1-4bd1-9598-212d831a238d)" />
                                                                        <rect x="12.92" y="9.26" width="13.48" height="13.48" rx="3.55" transform="translate(17.07 -9.22) rotate(45)" style="opacity: 0.8;fill: url(#b678988d-2758-4be4-b2db-88d0d0107aba)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">System Integration
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </section>
                                        </div>

                                    

                                    </li>



                                    <li class="page-nav-menu__card type--docs" hidden>
                                        <div class="page-nav-menu__card-column">

                                            <section class="page-nav-menu__card-section type--extended">
                                                <h6 class="page-nav-menu__card-section-title">Documentation</h6>
                                                <ul class="page-nav-menu__card-list">
                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/imandra-docs/">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon big-icon">
                                                                    <defs>
                                                                        <linearGradient id="e51ff9ea-42ef-4973-aa09-9e903c56cc10" x1="-627.64" y1="-420.99" x2="-609.89" y2="-438.74" gradientTransform="translate(-603.82 -412.71) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="ade641ef-0c77-41e1-8e53-724b1e780f70" x1="-628.41" y1="-421.82" x2="-610.65" y2="-439.58" gradientTransform="translate(-603.75 -414.32) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="eae017dd-fa64-4a91-9803-0a78556c3668" x1="2.96" y1="14.63" x2="12.26" y2="6.93" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" xlink:href="#e51ff9ea-42ef-4973-aa09-9e903c56cc10" />
                                                                        <linearGradient id="e31b5bb4-ae71-4f81-a450-4d0b93977b50" x1="10.28" y1="11.96" x2="6.6" y2="11.96" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                        <linearGradient id="acd6ac43-9990-4931-974c-1a987b989947" x1="-1042.27" y1="3517.02" x2="-1031.31" y2="3517.02" gradientTransform="translate(-2813.18 -2310.72) rotate(-67.12)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0567e" />
                                                                            <stop offset="1" stop-color="#9c56aa" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a7641cb9-49e9-4f94-87d6-126c8c7a85f0" x1="10.84" y1="19.48" x2="21.87" y2="19.48" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50" />
                                                                        <linearGradient id="b863d450-a4f1-4891-9b2f-bf3feeb635f0" x1="10.84" y1="20.86" x2="21.87" y2="20.86" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50" />
                                                                        <linearGradient id="b808cdaa-31c3-47ff-8440-dd0a88d79535" x1="10.84" y1="22.25" x2="21.87" y2="22.25" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50" />
                                                                        <linearGradient id="f55bfafc-3a29-4c8d-80b8-e3f9c0fb86bb" x1="10.84" y1="23.63" x2="21.87" y2="23.63" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50" />
                                                                        <linearGradient id="ab08b4fe-8772-4c41-b1c8-77b381a729ff" x1="10.84" y1="25.02" x2="16.39" y2="25.02" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50" />
                                                                        <linearGradient id="b2984b7c-b001-4be3-8d40-437d38d2a1f6" x1="16" y1="9.47" x2="16" y2="14.86" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0aa3d" />
                                                                            <stop offset="1" stop-color="#f0567e" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <rect x="3.1" y="8.86" width="24.29" height="15.99" rx="2.39" transform="translate(-1.61 32.1) rotate(-90)" style="opacity: 0.8;fill: url(#e51ff9ea-42ef-4973-aa09-9e903c56cc10)" />
                                                                        <rect x="3.94" y="8.09" width="24.29" height="15.99" rx="2.39" transform="translate(0 32.17) rotate(-90)" style="opacity: 0.8;fill: url(#ade641ef-0c77-41e1-8e53-724b1e780f70)" />
                                                                        <path d="M13,12.93,5.63,17.2a1.12,1.12,0,0,1-1.69-1V7.69a1.13,1.13,0,0,1,1.69-1L13,11A1.13,1.13,0,0,1,13,12.93Z" style="opacity: 0.8;fill: url(#eae017dd-fa64-4a91-9803-0a78556c3668)" />
                                                                        <path d="M8.36,10a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;fill: url(#e31b5bb4-ae71-4f81-a450-4d0b93977b50)" />
                                                                        <path d="M18.37,12.75a.19.19,0,0,0,.17.16l1.35.18a4.27,4.27,0,0,0,.41,1l-.83,1.08a.17.17,0,0,0,0,.23,5.46,5.46,0,0,0,1.1,1.1.18.18,0,0,0,.24,0l1.08-.83a3.9,3.9,0,0,0,1,.4L23,17.38a.21.21,0,0,0,.17.17,5.44,5.44,0,0,0,1.56,0,.19.19,0,0,0,.17-.16L25.12,16a4.31,4.31,0,0,0,1-.4l1.08.82a.18.18,0,0,0,.24,0,5.73,5.73,0,0,0,1.1-1.1.18.18,0,0,0,0-.24L27.68,14a4.31,4.31,0,0,0,.4-1l1.35-.18a.19.19,0,0,0,.17-.16,5.82,5.82,0,0,0,0-1.56.19.19,0,0,0-.17-.17l-1.35-.17a4.35,4.35,0,0,0-.41-1l.83-1.08a.2.2,0,0,0,0-.23,5.51,5.51,0,0,0-1.11-1.1.2.2,0,0,0-.23,0l-1.08.83a4.39,4.39,0,0,0-1-.4l-.18-1.34a.19.19,0,0,0-.16-.17,4.25,4.25,0,0,0-.79,0,5.27,5.27,0,0,0-.78,0,.19.19,0,0,0-.17.17l-.17,1.34a4.16,4.16,0,0,0-1,.41L20.8,7.46a.21.21,0,0,0-.24,0,5.83,5.83,0,0,0-1.11,1.11.18.18,0,0,0,0,.23l.83,1.08a3.83,3.83,0,0,0-.4,1L18.54,11a.19.19,0,0,0-.17.17A5.82,5.82,0,0,0,18.37,12.75ZM24,10.13A1.83,1.83,0,1,1,22.15,12,1.84,1.84,0,0,1,24,10.13Z"
                                                                            style="opacity: 0.8;fill: url(#acd6ac43-9990-4931-974c-1a987b989947)" />
                                                                        <rect x="10.84" y="19.04" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#a7641cb9-49e9-4f94-87d6-126c8c7a85f0)" />
                                                                        <rect x="10.84" y="20.43" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#b863d450-a4f1-4891-9b2f-bf3feeb635f0)" />
                                                                        <rect x="10.84" y="21.81" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#b808cdaa-31c3-47ff-8440-dd0a88d79535)" />
                                                                        <rect x="10.84" y="23.2" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#f55bfafc-3a29-4c8d-80b8-e3f9c0fb86bb)" />
                                                                        <rect x="10.84" y="24.58" width="5.55" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#ab08b4fe-8772-4c41-b1c8-77b381a729ff)" />
                                                                        <path id="a2fe1c7b-e909-4f06-a3de-ce530d29f64c" data-name="Fill-5" d="M16,9.29a1.1,1.1,0,0,1,1.13,1.12v3.38a1.13,1.13,0,0,1-2.26,0V10.41A1.1,1.1,0,0,1,16,9.29" style="fill-rule: evenodd;opacity: 0.8;fill: url(#b2984b7c-b001-4be3-8d40-437d38d2a1f6)" />
                                                                    </g>
                                                                </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Imandra Core
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                    
                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/imandra-docs/notebooks/python-api/">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 28 26" class="page-nav-menu__card-list-icon big-icon">
                                                                    <g clip-path="url(#clip0_218_23)">
                                                                        <path opacity="0.8" d="M6.45001 3.31999L6.45001 22.83C6.45001 24.1499 7.52005 25.22 8.84001 25.22H20.05C21.37 25.22 22.44 24.1499 22.44 22.83V3.31999C22.44 2.00003 21.37 0.929987 20.05 0.929987H8.84001C7.52005 0.929987 6.45001 2.00003 6.45001 3.31999Z" fill="url(#paint0_linear_218_23)"/>
                                                                        <path opacity="0.8" d="M7.28 2.56999L7.28 22.08C7.28 23.3999 8.35004 24.47 9.67 24.47H20.88C22.2 24.47 23.27 23.3999 23.27 22.08V2.56999C23.27 1.25003 22.2 0.179987 20.88 0.179987H9.67C8.35004 0.179987 7.28 1.25003 7.28 2.56999Z" fill="url(#paint1_linear_218_23)"/>
                                                                        <path opacity="0.8" d="M26.18 3.34998H20.19C19.1848 3.34998 18.37 4.16482 18.37 5.16998V11.16C18.37 12.1651 19.1848 12.98 20.19 12.98H26.18C27.1852 12.98 28 12.1651 28 11.16V5.16998C28 4.16482 27.1852 3.34998 26.18 3.34998Z" fill="url(#paint2_linear_218_23)"/>
                                                                        <path opacity="0.8" d="M12.22 7.37999C12.21 7.28999 12.14 7.22999 12.05 7.20999L10.7 7.03999C10.61 6.69999 10.47 6.37999 10.3 6.07999L11.13 4.99999C11.18 4.92999 11.18 4.82999 11.13 4.75999C10.81 4.33999 10.44 3.96999 10.02 3.65999C9.94999 3.60999 9.84999 3.60999 9.77999 3.65999L8.69999 4.48999C8.38999 4.31999 8.06999 4.17999 7.72999 4.08999L7.54999 2.73999C7.53999 2.64999 7.46999 2.57999 7.37999 2.56999C6.83999 2.49999 6.34999 2.49999 5.80999 2.56999C5.71999 2.57999 5.64999 2.64999 5.63999 2.73999L5.46999 4.07999C5.12999 4.16999 4.79999 4.30999 4.49999 4.47999L3.41999 3.64999C3.34999 3.59999 3.24999 3.59999 3.17999 3.64999C2.76999 3.95999 2.38999 4.33999 2.06999 4.74999C2.01999 4.81999 2.01999 4.91999 2.06999 4.98999L2.89999 6.05999C2.72999 6.36999 2.58999 6.68999 2.49999 7.02999L1.14999 7.20999C1.05999 7.21999 0.98999 7.28999 0.97999 7.37999C0.90999 7.89999 0.90999 8.41999 0.97999 8.93999C0.98999 9.02999 1.05999 9.08999 1.14999 9.10999L2.49999 9.27999C2.58999 9.61999 2.72999 9.93999 2.90999 10.25L2.07999 11.33C2.02999 11.4 2.02999 11.5 2.07999 11.57C2.38999 11.98 2.77999 12.36 3.18999 12.67C3.25999 12.72 3.35999 12.72 3.42999 12.67L4.50999 11.84C4.81999 12.01 5.13999 12.15 5.47999 12.24L5.65999 13.58C5.66999 13.67 5.73999 13.74 5.82999 13.75C6.09999 13.79 6.34999 13.8 6.60999 13.8C6.86999 13.8 7.12999 13.78 7.38999 13.74C7.47999 13.73 7.54999 13.66 7.55999 13.57L7.72999 12.22C8.06999 12.13 8.38999 11.99 8.69999 11.82L9.77999 12.65C9.84999 12.7 9.94999 12.7 10.02 12.65C10.44 12.33 10.81 11.96 11.13 11.55C11.18 11.48 11.18 11.38 11.13 11.31L10.3 10.24C10.47 9.93999 10.61 9.60999 10.7 9.26999L12.05 9.08999C12.14 9.07999 12.21 9.00999 12.22 8.91999C12.29 8.38999 12.29 7.88999 12.22 7.35999V7.37999ZM6.60999 9.98999C5.59999 9.98999 4.77999 9.17999 4.77999 8.16999C4.77999 7.15999 5.59999 6.34999 6.60999 6.33999C7.61999 6.32999 8.43999 7.14999 8.44999 8.15999C8.45999 9.16999 7.62999 9.97999 6.61999 9.98999H6.60999Z" fill="url(#paint3_linear_218_23)"/>
                                                                        <path opacity="0.8" fill-rule="evenodd" clip-rule="evenodd" d="M23.05 6.08999C21.97 6.09999 21.1 6.97999 21.1 8.06999C21.1 9.16999 21.98 10.05 23.07 10.05C24.16 10.05 25.03 9.15999 25.03 8.05999C25.03 6.96999 24.16 6.08999 23.08 6.07999H23.04L23.05 6.08999Z" fill="url(#paint4_linear_218_23)"/>
                                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M14.79 10.98C14.15 10.98 13.66 10.5 13.66 9.84998V6.46998C13.66 5.82998 14.14 5.33998 14.79 5.33998C15.44 5.33998 15.92 5.81998 15.92 6.46998V9.84998C15.92 10.49 15.44 10.98 14.79 10.98Z" fill="url(#paint5_linear_218_23)"/>
                                                                        <path opacity="0.8" d="M15.02 14.13C14.68 14.13 14.35 14.16 14.07 14.21C13.23 14.36 13.07 14.67 13.07 15.24V16H15.07V16.25H12.32C11.74 16.25 11.23 16.6 11.07 17.26C10.88 18.02 10.88 18.5 11.07 19.28C11.21 19.87 11.55 20.29 12.13 20.29H12.81V19.39C12.81 18.73 13.38 18.15 14.06 18.15H16.06C16.62 18.15 17.06 17.7 17.06 17.14V15.24C17.06 14.7 16.61 14.29 16.06 14.21C15.72 14.15 15.37 14.12 15.03 14.12L15.02 14.13ZM13.94 14.75C14.15 14.75 14.31 14.92 14.31 15.13C14.31 15.34 14.14 15.51 13.94 15.51C13.74 15.51 13.57 15.34 13.57 15.13C13.57 14.92 13.73 14.75 13.94 14.75Z" fill="url(#paint6_linear_218_23)"/>
                                                                        <path d="M17.3 16.26V17.15C17.3 17.83 16.72 18.42 16.05 18.42H14.06C13.52 18.42 13.06 18.89 13.06 19.43V21.33C13.06 21.87 13.53 22.19 14.06 22.34C14.69 22.53 15.3 22.56 16.06 22.34C16.57 22.19 17.06 21.9 17.06 21.33V20.57H15.06V20.32H18.05C18.63 20.32 18.85 19.92 19.05 19.31C19.26 18.68 19.25 18.08 19.05 17.29C18.91 16.71 18.63 16.28 18.05 16.28H17.3V16.26ZM16.18 21.07C16.39 21.07 16.55 21.24 16.55 21.45C16.55 21.66 16.38 21.83 16.18 21.83C15.98 21.83 15.81 21.66 15.81 21.45C15.81 21.24 15.97 21.07 16.18 21.07Z" fill="url(#paint7_linear_218_23)"/>
                                                                        </g>
                                                                        <defs>
                                                                        <linearGradient id="paint0_linear_218_23" x1="5.87001" y1="4.49999" x2="23.62" y2="22.26" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#0088FF"/>
                                                                        <stop offset="1" stop-color="#00F0B4"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint1_linear_218_23" x1="6.7" y1="3.73999" x2="24.45" y2="21.5" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#7656F0"/>
                                                                        <stop offset="1" stop-color="#0088FF"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint2_linear_218_23" x1="18.98" y1="11.64" x2="29.5" y2="2.93998" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#F0AA3D"/>
                                                                        <stop offset="1" stop-color="#F0567E"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint3_linear_218_23" x1="8.70611" y1="3.14963" x2="4.44095" y2="13.2565" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#F0567E"/>
                                                                        <stop offset="1" stop-color="#9C56AA"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint4_linear_218_23" x1="24.97" y1="8.07999" x2="21.29" y2="8.07999" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#7656F0"/>
                                                                        <stop offset="1" stop-color="#0088FF"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint5_linear_218_23" x1="14.79" y1="10.8" x2="14.79" y2="5.40998" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#78FF80"/>
                                                                        <stop offset="1" stop-color="#F0E566"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint6_linear_218_23" x1="-0.172811" y1="-4.45722" x2="4.36879" y2="-0.542822" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#0088FF"/>
                                                                        <stop offset="1" stop-color="#00F0B4"/>
                                                                        </linearGradient>
                                                                        <linearGradient id="paint7_linear_218_23" x1="6.1272" y1="1.82038" x2="4.5088" y2="-0.475622" gradientUnits="userSpaceOnUse">
                                                                        <stop stop-color="#78FF80"/>
                                                                        <stop offset="1" stop-color="#F0E566"/>
                                                                        </linearGradient>
                                                                        <clipPath id="clip0_218_23">
                                                                        <rect width="27.06" height="25.06" fill="white" transform="translate(0.940002 0.169983)"/>
                                                                        </clipPath>
                                                                        </defs>
                                                                        </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Python API
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </section>
                                        </div>

                                        <div class="page-nav-menu__card-column">
                                            <section class="page-nav-menu__card-section type--extended">
                                                <h6 class="page-nav-menu__card-section-title">Languages & Interfaces</h6>
                                                <ul class="page-nav-menu__card-list">

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/ipl/">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon big-icon">
                                                                    <defs>
                                                                        <linearGradient id="fa3608ca-bbcf-47eb-a1c8-4be48cf33099" x1="-789.06" y1="-582.4" x2="-771.3" y2="-600.16" gradientTransform="translate(-765.23 -574.12) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a506a6a8-fab7-4b84-b104-331cd76c7b62" x1="-789.82" y1="-583.24" x2="-772.07" y2="-601" gradientTransform="translate(-765.16 -575.73) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0aa3d" />
                                                                            <stop offset="1" stop-color="#f0567e" />
                                                                        </linearGradient>
                                                                        <linearGradient id="bb829f8c-eec2-40b1-b76d-8e75eef76233" x1="20.5" y1="21.17" x2="18.28" y2="21.17" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b690d159-c987-4fec-88a7-0dbcfb9fc4c8" x1="16.67" y1="21.17" x2="14.45" y2="21.17" xlink:href="#bb829f8c-eec2-40b1-b76d-8e75eef76233" />
                                                                        <linearGradient id="ab941f6a-c203-4fa0-967e-5cfd592073b5" x1="12.87" y1="21.17" x2="10.64" y2="21.17" xlink:href="#bb829f8c-eec2-40b1-b76d-8e75eef76233" />
                                                                        <linearGradient id="a140b5be-6ac7-4b54-abbd-4d2c1cf063b8" x1="16.67" y1="11.85" x2="7.14" y2="11.85" gradientTransform="translate(12.06)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0567e" />
                                                                            <stop offset="1" stop-color="#9c56aa" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b9762c5a-8dbc-4c4e-9104-d5aca4e6220d" x1="-226.23" y1="9.35" x2="-226.23" y2="14.74" gradientTransform="translate(-210.63 23.91) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="e5d3d7a6-7b07-4106-849a-212d4eadf366" x1="13.72" y1="11.85" x2="10.04" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#b9762c5a-8dbc-4c4e-9104-d5aca4e6220d" />
                                                                        <linearGradient id="ecd75f6c-0eae-4750-a094-36d4df3ec84e" x1="0.27" y1="11.85" x2="-9.26" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#fa3608ca-bbcf-47eb-a1c8-4be48cf33099" />
                                                                        <linearGradient id="bb357e35-efdc-4bb8-82ff-e24b6fec3af5" x1="-2.68" y1="11.85" x2="-6.36" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#b9762c5a-8dbc-4c4e-9104-d5aca4e6220d" />
                                                                    </defs>
                                                                    <g>
                                                                        <rect x="3.1" y="8.86" width="24.29" height="15.99" rx="2.39" transform="translate(-1.61 32.1) rotate(-90)" style="opacity: 0.8;fill: url(#fa3608ca-bbcf-47eb-a1c8-4be48cf33099)" />
                                                                        <rect x="3.94" y="8.09" width="24.29" height="15.99" rx="2.39" transform="translate(0 32.17) rotate(-90)" style="opacity: 0.8;fill: url(#a506a6a8-fab7-4b84-b104-331cd76c7b62)" />
                                                                        <path d="M19.34,20a1.2,1.2,0,1,0,1.2,1.19A1.18,1.18,0,0,0,19.36,20Z" style="fill-rule: evenodd;fill: url(#bb829f8c-eec2-40b1-b76d-8e75eef76233)" />
                                                                        <path d="M15.51,20a1.2,1.2,0,1,0,1.2,1.19A1.19,1.19,0,0,0,15.51,20Z" style="fill-rule: evenodd;fill: url(#b690d159-c987-4fec-88a7-0dbcfb9fc4c8)" />
                                                                        <path d="M11.71,20a1.2,1.2,0,1,0,1.2,1.19A1.19,1.19,0,0,0,11.71,20Z" style="fill-rule: evenodd;fill: url(#ab941f6a-c203-4fa0-967e-5cfd592073b5)" />
                                                                        <path d="M23.75,6.71a5.1,5.1,0,1,0,.1,0Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#a140b5be-6ac7-4b54-abbd-4d2c1cf063b8)" />
                                                                        <path id="b756f009-a7cf-4c2e-8bb8-595d1fb5a1f4" data-name="Fill-5" d="M15.59,14.75a1.09,1.09,0,0,1-1.12-1.12V10.25a1.13,1.13,0,1,1,2.25,0v3.38a1.1,1.1,0,0,1-1.13,1.12" style="fill-rule: evenodd;opacity: 0.8;fill: url(#b9762c5a-8dbc-4c4e-9104-d5aca4e6220d)" />
                                                                        <path d="M23.86,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#e5d3d7a6-7b07-4106-849a-212d4eadf366)" />
                                                                        <path d="M7.35,6.71a5.1,5.1,0,1,0,.1,0Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#ecd75f6c-0eae-4750-a094-36d4df3ec84e)" />
                                                                        <path d="M7.46,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#bb357e35-efdc-4bb8-82ff-e24b6fec3af5)" />
                                                                    </g>
                                                                </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">IPL
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/imandra-rule-synth/">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon big-icon">
                                                                    <defs>
                                                                        <linearGradient id="a5f02a43-b9fa-4a38-bd72-cd8603430b3d" x1="-748.63" y1="-541.98" x2="-730.88" y2="-559.73" gradientTransform="translate(-724.81 -533.7) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                        <linearGradient id="abb86233-8a5b-4343-9b82-0f6028f275e5" x1="-749.4" y1="-542.82" x2="-731.64" y2="-560.57" gradientTransform="translate(-724.74 -535.31) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="ba4b5197-789b-4838-b535-649e38db1eb9" x1="-187.12" y1="-34.35" x2="-180.43" y2="-39.88" gradientTransform="translate(199.45 57.38)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b6dd8977-d6b3-47c1-b875-15d0c67a2053" x1="19.95" y1="21.17" x2="17.72" y2="21.17" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" xlink:href="#a5f02a43-b9fa-4a38-bd72-cd8603430b3d" />
                                                                        <linearGradient id="abfa2cf9-8a53-426e-b609-df67b7bbb0d8" x1="8.14" y1="27.06" x2="18.66" y2="18.35" gradientTransform="translate(-4.82 -11.65)" xlink:href="#a5f02a43-b9fa-4a38-bd72-cd8603430b3d" />
                                                                        <linearGradient id="e9006b2b-9f2e-4518-8dda-bb1798e36162" x1="-2.95" y1="11.85" x2="-6.62" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#ba4b5197-789b-4838-b535-649e38db1eb9" />
                                                                        <linearGradient id="a251c688-c5a2-47dc-bdb4-7e5de35805e4" x1="-145.38" y1="9.35" x2="-145.38" y2="14.74" gradientTransform="translate(-129.79 23.91) rotate(180)" xlink:href="#a5f02a43-b9fa-4a38-bd72-cd8603430b3d" />
                                                                        <linearGradient id="a052ee5c-8256-4dc5-a398-6665d14cb822" x1="6.96" y1="14.63" x2="16.26" y2="6.93" gradientTransform="translate(12.06)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0567e" />
                                                                            <stop offset="1" stop-color="#9c56aa" />
                                                                        </linearGradient>
                                                                        <linearGradient id="fd058114-3c11-47e8-aae9-997efef6a838" x1="13.72" y1="11.85" x2="10.04" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#abb86233-8a5b-4343-9b82-0f6028f275e5" />
                                                                    </defs>
                                                                    <g>
                                                                        <rect x="3.1" y="8.86" width="24.29" height="15.99" rx="2.39" transform="translate(-1.61 32.1) rotate(-90)" style="fill: url(#a5f02a43-b9fa-4a38-bd72-cd8603430b3d)" />
                                                                        <rect x="3.94" y="8.09" width="24.29" height="15.99" rx="2.39" transform="translate(0 32.17) rotate(-90)" style="opacity: 0.8;fill: url(#abb86233-8a5b-4343-9b82-0f6028f275e5)" />
                                                                        <path d="M19.57,21.81l-5.32,3.07a.81.81,0,0,1-1.21-.7V18a.81.81,0,0,1,1.21-.7l5.32,3.07A.81.81,0,0,1,19.57,21.81Z" style="opacity: 0.8;fill: url(#ba4b5197-789b-4838-b535-649e38db1eb9)" />
                                                                        <path d="M18.79,20A1.2,1.2,0,1,0,20,21.16,1.19,1.19,0,0,0,18.79,20Z" style="fill-rule: evenodd;fill: url(#b6dd8977-d6b3-47c1-b875-15d0c67a2053)" />
                                                                        <rect x="2.7" y="7.12" width="9.63" height="9.63" rx="1.82" transform="translate(10.64 -1.82) rotate(45)" style="fill: url(#abfa2cf9-8a53-426e-b609-df67b7bbb0d8)" />
                                                                        <path d="M7.19,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#e9006b2b-9f2e-4518-8dda-bb1798e36162)" />
                                                                        <path id="b175bd3d-dae4-4e97-8a76-415985dfc3f8" data-name="Fill-5" d="M15.59,14.75a1.09,1.09,0,0,1-1.12-1.12V10.25a1.13,1.13,0,1,1,2.25,0v3.38a1.1,1.1,0,0,1-1.13,1.12" style="fill-rule: evenodd;fill: url(#a251c688-c5a2-47dc-bdb4-7e5de35805e4)" />
                                                                        <path d="M29.09,12.93l-7.4,4.27a1.12,1.12,0,0,1-1.69-1V7.69a1.13,1.13,0,0,1,1.69-1L29.09,11A1.13,1.13,0,0,1,29.09,12.93Z" style="opacity: 0.8;fill: url(#a052ee5c-8256-4dc5-a398-6665d14cb822)" />
                                                                        <path d="M23.86,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#fd058114-3c11-47e8-aae9-997efef6a838)" />
                                                                    </g>
                                                                </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Rule Synthesis
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </section>
                                        </div>

                                    </li>



                                    <li class="page-nav-menu__card type--company" hidden>
                                        <div class="page-nav-menu__card-column">
                                            <section class="page-nav-menu__card-section">
                                                <h6 class="page-nav-menu__card-section-title">Company</h6>
                                                <ul class="page-nav-menu__card-list">

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/about">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="aed4d08e-8fae-4a0f-b23e-8eed570230be" x1="7.4" y1="23.53" x2="23.58" y2="9.37" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="bd5d9270-c979-4d59-82f2-57c19d5faac4" x1="10.99" y1="19.38" x2="21.01" y2="19.38" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0.01" stop-color="#78ff80" />
                                                                            <stop offset="1" stop-color="#f0e566" />
                                                                        </linearGradient>
                                                                        <linearGradient id="ace2fa23-b9a8-41f9-bfb7-4c8a480be6ee" x1="13.71" y1="11.43" x2="18.29" y2="11.43" xlink:href="#bd5d9270-c979-4d59-82f2-57c19d5faac4" />
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M16.2,27.14h-.44A11.2,11.2,0,0,1,4.65,16h0A11.2,11.2,0,0,1,15.8,4.86h.4A11.2,11.2,0,0,1,27.35,16h0A11.18,11.18,0,0,1,16.2,27.14Z" style="opacity: 0.8;fill: url(#aed4d08e-8fae-4a0f-b23e-8eed570230be)" />
                                                                        <path d="M12.78,14.8h6.44a1.79,1.79,0,0,1,1.55,2.68l-3.22,5.58a1.79,1.79,0,0,1-3.1,0l-3.22-5.58A1.79,1.79,0,0,1,12.78,14.8Z" style="opacity: 0.9;fill: url(#bd5d9270-c979-4d59-82f2-57c19d5faac4)" />
                                                                        <circle cx="16" cy="11.43" r="2.29" style="opacity: 0.9;fill: url(#ace2fa23-b9a8-41f9-bfb7-4c8a480be6ee)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">About
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://apply.workable.com/imandra/">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="e059fd96-2f3f-444e-aec4-99db27a746bd" x1="-2398.64" y1="608.27" x2="-2386.9" y2="608.27" gradientTransform="translate(2404.24 -616.69) rotate(-0.42)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0aa3d" />
                                                                            <stop offset="1" stop-color="#f0567e" />
                                                                        </linearGradient>
                                                                        <linearGradient id="e28dfe9e-3769-45c6-ace3-d691d32fec87" x1="-2404.9" y1="619.09" x2="-2393.16" y2="619.09" gradientTransform="translate(2404.24 -616.69) rotate(-0.42)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="ea764b29-7bae-495f-8535-1a702e4adc0b" x1="-2392.21" y1="619.14" x2="-2380.47" y2="619.14" gradientTransform="translate(2404.24 -616.69) rotate(-0.42)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#008060" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M20.12,14.5H12a1.79,1.79,0,0,1-1.55-2.68l4.08-7.07a1.79,1.79,0,0,1,3.1,0l4.08,7.07A1.79,1.79,0,0,1,20.12,14.5Z" style="opacity: 0.8;fill: url(#e059fd96-2f3f-444e-aec4-99db27a746bd)" />
                                                                        <path d="M13.94,25.36H5.78a1.79,1.79,0,0,1-1.55-2.68l4.08-7.07a1.79,1.79,0,0,1,3.1,0l4.08,7.07A1.79,1.79,0,0,1,13.94,25.36Z" style="opacity: 0.8;fill: url(#e28dfe9e-3769-45c6-ace3-d691d32fec87)" />
                                                                        <path d="M26.63,25.32H18.47a1.79,1.79,0,0,1-1.55-2.68L21,15.57a1.79,1.79,0,0,1,3.1,0l4.08,7.07A1.79,1.79,0,0,1,26.63,25.32Z" style="opacity: 0.8;fill: url(#ea764b29-7bae-495f-8535-1a702e4adc0b)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Careers
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://discord.com/invite/byQApJ3">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="e9967427-a0d4-43e6-8ef0-54ccb71dc207" x1="-2722.1" y1="480.46" x2="-2713" y2="480.46" gradientTransform="translate(-2075.73 1807.15) rotate(149.58)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#ffef54" />
                                                                            <stop offset="1" stop-color="#f0aa3d" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b9fa3870-6b45-4730-9fb3-e9669211feed" x1="13.53" y1="16.09" x2="5.14" y2="16.09" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#9d56a8" />
                                                                            <stop offset="1" stop-color="#7656f0" />
                                                                        </linearGradient>
                                                                        <linearGradient id="e47969e3-2f25-4183-b704-63fa513c325c" x1="-1412.72" y1="-344.15" x2="-1403.54" y2="-344.15" gradientTransform="matrix(0.01, 1, -1, 0.01, -312.94, 1419.56)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                        <linearGradient id="e9ca7409-6e03-44e3-8a9d-5ac38b6b197b" x1="-1398.62" y1="-343.98" x2="-1389.45" y2="-343.98" gradientTransform="matrix(0.01, 1, -1, 0.01, -312.94, 1419.56)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0aa3d" />
                                                                            <stop offset="1" stop-color="#f0567e" />
                                                                        </linearGradient>
                                                                        <linearGradient id="b0da5193-fb1b-48ab-8bca-ab28912b50e8" x1="-1417.53" y1="309.67" x2="-1408.36" y2="309.67" gradientTransform="matrix(-0.01, 1, 1, 0.01, -308.91, 1419.56)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#7656f0" />
                                                                            <stop offset="1" stop-color="#08f" />
                                                                        </linearGradient>
                                                                        <linearGradient id="abf7975a-64e5-49de-a6b5-660b6ad1398f" x1="-1403.44" y1="309.84" x2="-1394.27" y2="309.84" gradientTransform="matrix(-0.01, 1, 1, 0.01, -308.91, 1419.56)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#f0567e" />
                                                                            <stop offset="1" stop-color="#9c56aa" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M19.89,14.55l4.78-2.76a1.79,1.79,0,0,1,2.68,1.55v5.51a1.79,1.79,0,0,1-2.68,1.55l-4.78-2.76A1.78,1.78,0,0,1,19.89,14.55Z" style="opacity: 0.8;fill: url(#e9967427-a0d4-43e6-8ef0-54ccb71dc207)" />
                                                                        <path d="M12.17,17.66,7.36,20.44a1.81,1.81,0,0,1-2.71-1.57V13.32a1.81,1.81,0,0,1,2.71-1.57l4.81,2.78A1.8,1.8,0,0,1,12.17,17.66Z" style="opacity: 0.8;fill: url(#b9fa3870-6b45-4730-9fb3-e9669211feed)" />
                                                                        <path d="M16.62,11.73V6.18a1.81,1.81,0,0,1,2.71-1.57l4.81,2.78a1.81,1.81,0,0,1,0,3.13L19.33,13.3A1.81,1.81,0,0,1,16.62,11.73Z" style="opacity: 0.8;fill: url(#e47969e3-2f25-4183-b704-63fa513c325c)" />
                                                                        <path d="M16.55,25.82V20.27a1.81,1.81,0,0,1,2.71-1.57l4.81,2.78a1.8,1.8,0,0,1,0,3.13l-4.81,2.78A1.81,1.81,0,0,1,16.55,25.82Z" style="opacity: 0.8;fill: url(#e9ca7409-6e03-44e3-8a9d-5ac38b6b197b)" />
                                                                        <path d="M15.36,11.73V6.18a1.81,1.81,0,0,0-2.71-1.57L7.84,7.39a1.8,1.8,0,0,0,0,3.13l4.81,2.78A1.81,1.81,0,0,0,15.36,11.73Z" style="opacity: 0.8;fill: url(#b0da5193-fb1b-48ab-8bca-ab28912b50e8)" />
                                                                        <path d="M15.42,25.82V20.27a1.81,1.81,0,0,0-2.71-1.57L7.9,21.48a1.81,1.81,0,0,0,0,3.13l4.81,2.78A1.81,1.81,0,0,0,15.42,25.82Z" style="opacity: 0.8;fill: url(#abf7975a-64e5-49de-a6b5-660b6ad1398f)" />
                                                                    </g>
                                                                </svg>

                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Community
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </section>
                                        </div>

                                        <div class="page-nav-menu__card-column">
                                            <section class="page-nav-menu__card-section">
                                                <h6 class="page-nav-menu__card-section-title">Media</h6>
                                                <ul class="page-nav-menu__card-list">

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://medium.com/imandra">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                    <defs>
                                                                        <linearGradient id="b559e18b-97dd-45f8-82f3-509dc91fd611" x1="6.12" y1="11.91" x2="18.23" y2="24.02" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#9d56a8" />
                                                                            <stop offset="1" stop-color="#7656f0" />
                                                                        </linearGradient>
                                                                        <linearGradient id="a0e84c7e-ecb0-41a8-b691-23385417b5e6" x1="-516.01" y1="-1193.69" x2="-530.89" y2="-1193.69" gradientTransform="matrix(0, 1, 1, 0, 1213.89, 536.59)" gradientUnits="userSpaceOnUse">
                                                                            <stop offset="0" stop-color="#08f" />
                                                                            <stop offset="1" stop-color="#00f0b4" />
                                                                        </linearGradient>
                                                                    </defs>
                                                                    <g>
                                                                        <path d="M5.64,20.48V14.71a3.28,3.28,0,0,1,3.28-3.28h5.77A3.28,3.28,0,0,1,18,14.71v11.6l-2.18-2.55H8.92A3.29,3.29,0,0,1,5.64,20.48Z" style="opacity: 0.8;fill: url(#b559e18b-97dd-45f8-82f3-509dc91fd611)" />
                                                                        <path d="M26.36,14.75V9a3.29,3.29,0,0,0-3.28-3.29H17.31A3.29,3.29,0,0,0,14,9V20.57L16.21,18h6.87A3.29,3.29,0,0,0,26.36,14.75Z" style="opacity: 0.8;fill: url(#a0e84c7e-ecb0-41a8-b691-23385417b5e6)" />
                                                                    </g>
                                                                </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">Blog
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                    <li class="page-nav-menu__card-list-menuitem-container">
                                                        <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/media">
                                                            <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                                <defs>
                                                                    <linearGradient id="b9817758-4c15-4e38-8424-6791773e540711" x1="11.87" y1="23.37" x2="27.83" y2="7.4" gradientTransform="translate(32.32 31.7) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                    <stop offset="0" stop-color="#08f"/>
                                                                    <stop offset="1" stop-color="#00f0b4"/>
                                                                    </linearGradient>
                                                                    <linearGradient id="e9a5c37b-be3b-474a-8133-4198af1cd6a711" x1="8.66" y1="23.37" x2="24.63" y2="7.4" gradientTransform="translate(32.32 31.7) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                    <stop offset="0" stop-color="#7656f0"/>
                                                                    <stop offset="1" stop-color="#08f"/>
                                                                    </linearGradient>
                                                                    <linearGradient id="a4c7fb12-819d-4a10-ac64-2276c792b16911" x1="5.37" y1="23.37" x2="21.34" y2="7.4" gradientTransform="translate(32.32 31.7) rotate(180)" gradientUnits="userSpaceOnUse">
                                                                    <stop offset="0" stop-color="#9d56a8"/>
                                                                    <stop offset="1" stop-color="#7656f0"/>
                                                                    </linearGradient>
                                                                    <linearGradient id="bd1b4bfe-728a-41c7-bdc0-04b135533b9b11" x1="12.06" y1="18.15" x2="19.46" y2="12.03" gradientUnits="userSpaceOnUse">
                                                                    <stop offset="0.01" stop-color="#78ff80"/>
                                                                    <stop offset="1" stop-color="#f0e566"/>
                                                                    </linearGradient>
                                                                </defs>
                                                                <g>
                                                                    <rect x="2.22" y="8.61" width="21.05" height="14.86" rx="1.89" style="opacity: 0.8;fill: url(#b9817758-4c15-4e38-8424-6791773e540711)"/>
                                                                    <rect x="5.42" y="8.61" width="21.05" height="14.86" rx="1.89" style="opacity: 0.8;fill: url(#e9a5c37b-be3b-474a-8133-4198af1cd6a711)"/>
                                                                    <rect x="8.71" y="8.61" width="21.05" height="14.86" rx="1.89" style="opacity: 0.8;fill: url(#a4c7fb12-819d-4a10-ac64-2276c792b16911)"/>
                                                                    <path d="M19.86,17l-5.47,3.15a1.12,1.12,0,0,1-1.69-1V12.84a1.12,1.12,0,0,1,1.69-1L19.86,15A1.13,1.13,0,0,1,19.86,17Z" style="fill: url(#bd1b4bfe-728a-41c7-bdc0-04b135533b9b11)"/>
                                                                </g>
                                                                </svg>
                                                            </span>
                                                            <span class="page-nav-menu__card-list-title" data-element="title">News
                                                                <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                                        <g>
                                                                            <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                                        </g>
                                                                    </svg>
                                                                </span>
                                                            </span>
                                                        </a>
                                                    </li>

                                                </ul>
                                            </section>
                                        </div>

                                    </li>



                                </ul>
                            </nav>
                    </div>



                </div>



            </nav>
        </div>
    </div>


    <div class="page-nav-mobile-menu-container" hidden>

        <nav class="page-nav-menu">

            <button aria-haspopup="true" aria-expanded="false" class="page-header-menu-nav__button type--nav-close">
                <svg version="1.1" class="page-header-menu-nav__icon" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve">
                    <rect class="page-header-menu-nav__icon-path--close" x="14" y="0.5" transform="matrix(0.7071 -0.7071 0.7071 0.7071 -6.981 16.1464)" width="4" height="32" />
                    <rect class="page-header-menu-nav__icon-path--close" x=" 0" y="14.5" transform="matrix(0.7071 -0.7071 0.7071 0.7071 -6.981 16.1464)" width="32" height="4" />
                </svg>
            </button>

            <ul class="page-nav-menu__list">



                <li class="page-nav-menu__card type--mobile">

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Financial Services</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/financial-services">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="page-nav-menu__card-list-icon">
                                            <linearGradient id="a222-mobile-mobile" gradientUnits="userSpaceOnUse" x1="23.82" x2="3.1" y1="15.95" y2="15.95">

                                                <stop offset="0" stop-color="#008060" />
                                                <stop offset="1" stop-color="#00f0b4" />
                                            </linearGradient>
                                            <linearGradient id="b222-mobile-mobile" gradientUnits="userSpaceOnUse" x1="29.88" x2="17.26" y1="15.94" y2="15.94">

                                                <stop offset="0" stop-color="#7656f0" />
                                                <stop offset="1" stop-color="#08f" />
                                            </linearGradient>
                                            <rect fill="url(#a222-mobile-mobile)" height="20.72" opacity=".8" rx="5.26" transform="matrix(.70710678 .70710678 -.70710678 .70710678 15.22 -4.85)" width="20.72" x="3.11" y="5.58" />
                                            <rect fill="url(#b222-mobile-mobile)" height="12.62" opacity=".8" rx="3.2" transform="matrix(.70710678 .70710678 -.70710678 .70710678 18.18 -12)" width="12.62" x="17.26" y="9.63" />
                                        </svg>
                                    </span>

                                    <span class="page-nav-menu__card-list-title" data-element="title">Overview
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/markets">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="linear-gradient444-mobile" x1="-6232.42" y1="1369.76" x2="-6212.69" y2="1369.76" gradientTransform="translate(-4649.36 4349.96) rotate(149.58)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="linear-gradient-442-mobile" x1="147.94" y1="1467.46" x2="167.68" y2="1467.46" gradientTransform="translate(-869.79 -1171.4) rotate(-30.42)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                            </defs>
                                            <g data-name="Layer 1">
                                                <path d="M11.68,14.19,25.16,6.41a2.09,2.09,0,0,1,3.13,1.81V23.78a2.09,2.09,0,0,1-3.13,1.81L11.68,17.81A2.09,2.09,0,0,1,11.68,14.19Z" opacity="0.8" fill="url(#linear-gradient444-mobile" />
                                                <path d="M20.54,17.81,7.06,25.59a2.09,2.09,0,0,1-3.13-1.81V8.22A2.09,2.09,0,0,1,7.06,6.41l13.48,7.78A2.09,2.09,0,0,1,20.54,17.81Z" opacity="0.8" fill="url(#linear-gradient-442-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Markets
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/connectivity">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 32 32" style="enable-background:new 0 0 32 32;" xml:space="preserve" class="page-nav-menu__card-list-icon">
                                            <linearGradient id="SVGID_1_-mobile" gradientUnits="userSpaceOnUse" x1="19.52" y1="1181.2125" x2="27.11" y2="1181.2125" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                <stop offset="0" style="stop-color:#7656F0" />
                                                <stop offset="1" style="stop-color:#0088FF" />
                                            </linearGradient>
                                            <path style="opacity:0.8;fill:url(#SVGID_1_-mobile);enable-background:new    ;" d="M25.5,26.9l-5-1.3c-0.7-0.2-1.1-0.9-0.9-1.6c0.1-0.2,0.2-0.4,0.3-0.6l3.6-3.6c0.5-0.5,1.4-0.5,1.9,0c0.2,0.2,0.3,0.4,0.3,0.6l1.3,5c0.2,0.7-0.3,1.4-1,1.6C25.8,26.9,25.6,26.9,25.5,26.9z" />
                                            <linearGradient id="SVGID_2_-mobile" gradientUnits="userSpaceOnUse" x1="11.6378" y1="1165.4003" x2="6.7478" y2="1166.9103" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                <stop offset="0" style="stop-color:#F0567E" />
                                                <stop offset="1" style="stop-color:#9C56AA" />
                                            </linearGradient>
                                            <path style="opacity:0.8;fill:url(#SVGID_2_-mobile);enable-background:new    ;" d="M7.1,5.3l4.5,1.2c0.6,0.2,1,0.9,0.8,1.5c-0.1,0.2-0.2,0.4-0.3,0.5l-3.3,3.3c-0.5,0.5-1.2,0.5-1.7,0c-0.1-0.1-0.2-0.3-0.3-0.5L5.7,6.8C5.5,6.2,5.9,5.5,6.5,5.3C6.7,5.3,6.9,5.3,7.1,5.3z" />
                                            <linearGradient id="SVGID_3_-mobile" gradientUnits="userSpaceOnUse" x1="10.4641" y1="1177.4569" x2="8.1041" y2="1185.547" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                <stop offset="0" style="stop-color:#F0AA3D" />
                                                <stop offset="1" style="stop-color:#F0567E" />
                                            </linearGradient>
                                            <path style="opacity:0.8;fill:url(#SVGID_3_-mobile);enable-background:new    ;" d="M5.3,25.1l1.3-4.8c0.2-0.7,0.9-1.1,1.6-0.9c0.2,0.1,0.4,0.2,0.6,0.3l3.5,3.5c0.5,0.5,0.5,1.3,0,1.8c-0.2,0.2-0.4,0.3-0.6,0.3l-4.8,1.3c-0.7,0.2-1.4-0.2-1.6-0.9C5.3,25.6,5.3,25.3,5.3,25.1z" />
                                            <linearGradient id="SVGID_4_-mobile" gradientUnits="userSpaceOnUse" x1="21.8863" y1="1169.4392" x2="24.4063" y2="1162.1991" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                <stop offset="0" style="stop-color:#0088FF" />
                                                <stop offset="1" style="stop-color:#00F0B4" />
                                            </linearGradient>
                                            <path style="opacity:0.8;fill:url(#SVGID_4_-mobile);enable-background:new    ;" d="M26.7,6.8l-1.2,4.7c-0.2,0.7-0.9,1.1-1.5,0.9c-0.2-0.1-0.4-0.2-0.6-0.3L20,8.6c-0.5-0.5-0.5-1.3,0-1.8c0.2-0.2,0.3-0.3,0.6-0.3l4.7-1.2c0.7-0.2,1.3,0.3,1.5,0.9C26.8,6.4,26.8,6.6,26.7,6.8z" />
                                            <linearGradient id="SVGID_5_-mobile" gradientUnits="userSpaceOnUse" x1="13.56" y1="1174" x2="18.44" y2="1174" gradientTransform="matrix(1 0 0 1 0 -1158)">
                                                <stop offset="0" style="stop-color:#FFEF54" />
                                                <stop offset="1" style="stop-color:#F0AA3D" />
                                            </linearGradient>
                                            <path style="fill-rule:evenodd;clip-rule:evenodd;fill:url(#SVGID_5_-mobile);" d="M16,13.5c-1.4,0-2.5,1.1-2.5,2.5s1.1,2.5,2.5,2.5l0,0c1.4,0,2.5-1.1,2.5-2.5S17.4,13.5,16,13.5z" />
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Connectivity
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </section>



                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Key Technology</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/core">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="linear-gradient-mobile" x1="-5972.02" y1="964.31" x2="-5950.71" y2="964.31" gradientTransform="translate(3868.04 4665.89) rotate(59.58)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="linear-gradient-2-mobile" x1="15.97" y1="4.28" x2="15.97" y2="25.85" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="linear-gradient-3-mobile" x1="7.39" y1="16" x2="0.33" y2="16" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#ffef54" />
                                                    <stop offset="1" stop-color="#f0aa3d" />
                                                </linearGradient>
                                                <linearGradient id="linear-gradient-4-mobile" x1="24.81" y1="16" x2="31.82" y2="16" xlink:href="#linear-gradient-3-mobile" />
                                                <linearGradient id="linear-gradient-5-mobile" x1="16.01" y1="13.37" x2="16.01" y2="22.16" xlink:href="#linear-gradient-3-mobile" />
                                            </defs>
                                            <g data-name="Layer 1">
                                                <path d="M13.36,25,5.77,11.86A3.05,3.05,0,0,1,8.42,7.28H23.6a3.06,3.06,0,0,1,2.65,4.58L18.66,25A3.06,3.06,0,0,1,13.36,25Z" opacity="0.8" fill="url(#linear-gradient-mobile)" />
                                                <path d="M18.55,6.78l7.59,13.15a3,3,0,0,1-2.58,4.47H8.37a3,3,0,0,1-2.58-4.47l7.6-13.15A3,3,0,0,1,18.55,6.78Z" opacity="0.8" fill="url(#linear-gradient-2-mobile)" />
                                                <path d="M3.75,12.31a3.69,3.69,0,0,1,0,7.38A3.73,3.73,0,0,1,.06,16a3.6,3.6,0,0,1,3.69-3.69" opacity="0.8" fill="url(#linear-gradient-3-mobile)" />
                                                <path d="M28.21,12.31A3.69,3.69,0,1,1,24.52,16a3.63,3.63,0,0,1,3.69-3.69" opacity="0.8" fill="url(#linear-gradient-4-mobile)" />
                                                <path d="M16,19.82h0a1.77,1.77,0,0,1-1.76-1.76V13.94A1.77,1.77,0,0,1,16,12.18h0a1.77,1.77,0,0,1,1.76,1.76v4.12A1.8,1.8,0,0,1,16,19.82Z" opacity="0.8" fill="url(#linear-gradient-5-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Imandra Core
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/mbsd">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                            <svg viewBox="0 0 22 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="page-nav-menu__card-list-icon">
                                                <path opacity="0.8" d="M21.71 16.42V7.58C21.71 7.04404 21.5697 6.51742 21.303 6.05251C21.0364 5.5876 20.6526 5.2006 20.19 4.93L12.53 0.51C12.0657 0.24425 11.54 0.104446 11.005 0.104446C10.47 0.104446 9.94432 0.24425 9.48001 0.51L1.81001 4.93C1.34738 5.2006 0.963645 5.5876 0.69698 6.05251C0.430314 6.51742 0.290005 7.04404 0.290009 7.58V16.42C0.290005 16.956 0.430314 17.4826 0.69698 17.9475C0.963645 18.4124 1.34738 18.7994 1.81001 19.07L9.48001 23.49C9.94432 23.7558 10.47 23.8956 11.005 23.8956C11.54 23.8956 12.0657 23.7558 12.53 23.49L20.19 19.07C20.6526 18.7994 21.0364 18.4124 21.303 17.9475C21.5697 17.4826 21.71 16.956 21.71 16.42Z" fill="url(#paint0_linear_41_85)"/>
                                                <path d="M14.47 14.09V10.04L10.96 8.02L7.45001 10.04V14.09L10.96 16.12L14.47 14.09Z" fill="url(#paint1_linear_41_85)"/>
                                                <defs>
                                                <linearGradient id="paint0_linear_41_85" x1="3.50001" y1="4.5" x2="19.04" y2="20.03" gradientUnits="userSpaceOnUse">
                                                <stop stop-color="#0088FF"/>
                                                <stop offset="1" stop-color="#00F0B4"/>
                                                </linearGradient>
                                                <linearGradient id="paint1_linear_41_85" x1="8.43001" y1="9.54" x2="13.67" y2="14.78" gradientUnits="userSpaceOnUse">
                                                <stop offset="0.01" stop-color="#78FF80"/>
                                                <stop offset="1" stop-color="#F0E566"/>
                                                </linearGradient>
                                                </defs>
                                            </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">MBSD
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/imandra-protocol-language">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="a2d3592c-19b2-40ba-b0d9-34ed8bb43352-mobile" x1="3.42" y1="13.89" x2="17.17" y2="2.51" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#22b573" />
                                                    <stop offset="1" stop-color="#34ebb9" />
                                                </linearGradient>
                                                <linearGradient id="e3fbbadc-8618-4a08-bbd2-1ca7cb060821-mobile" x1="3.11" y1="24.95" x2="19.28" y2="11.56" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="a202105d-7a01-4785-8ee8-837079e81374-mobile" x1="13.91" y1="19.85" x2="27.67" y2="8.47" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                                <linearGradient id="ff2142a4-3d09-4642-97bd-a2dbbbb92e8e-mobile" x1="9.62" y1="18.67" x2="18.92" y2="10.97" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <path d="M18.78,11,6.9,17.82a1.12,1.12,0,0,1-1.69-1V3.13a1.13,1.13,0,0,1,1.69-1L18.78,9A1.13,1.13,0,0,1,18.78,11Z" style="opacity: 0.8;fill: url(#a2d3592c-19b2-40ba-b0d9-34ed8bb43352-mobile)" />
                                                <path d="M21.17,21.51l-14,8.06a1.32,1.32,0,0,1-2-1.14V12.29a1.33,1.33,0,0,1,2-1.15l14,8.07A1.32,1.32,0,0,1,21.17,21.51Z" style="opacity: 0.8;fill: url(#e3fbbadc-8618-4a08-bbd2-1ca7cb060821-mobile)" />
                                                <path d="M29.27,16.93,17.39,23.78a1.12,1.12,0,0,1-1.69-1V9.09a1.12,1.12,0,0,1,1.69-1L29.27,15A1.13,1.13,0,0,1,29.27,16.93Z" style="opacity: 0.8;fill: url(#a202105d-7a01-4785-8ee8-837079e81374-mobile)" />
                                                <path d="M19.69,17l-7.4,4.27a1.13,1.13,0,0,1-1.69-1V11.73a1.13,1.13,0,0,1,1.69-1L19.69,15A1.13,1.13,0,0,1,19.69,17Z" style="opacity: 0.8;fill: url(#ff2142a4-3d09-4642-97bd-a2dbbbb92e8e-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">IPL
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Explore</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://try.imandra.ai">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="a4c289ff-0fcf-4609-9b23-7d9b1494b4fa-mobile" x1="7.39" y1="24.61" x2="25.22" y2="6.78" gradientTransform="translate(32 32) rotate(-180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0aa3d" />
                                                    <stop offset="1" stop-color="#f0567e" />
                                                </linearGradient>
                                                <linearGradient id="ec664c46-8b05-4d65-9ff3-3073f47ee906-mobile" x1="-782.2" y1="-256.03" x2="-764.38" y2="-273.85" gradientTransform="translate(-757.59 -248.64) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="a12544d8-6484-4dd4-ad6e-5781a5ae2002-mobile" x1="6.73" y1="16" x2="18.98" y2="16" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <rect x="3.85" y="8.23" width="24.29" height="15.53" rx="1.87" transform="translate(32 32) rotate(180)" style="opacity: 0.8;fill: url(#a4c289ff-0fcf-4609-9b23-7d9b1494b4fa-mobile)" />
                                                <rect x="3.79" y="8.01" width="24.42" height="15.99" rx="2.39" transform="translate(0 32) rotate(-90)" style="opacity: 0.8;fill: url(#ec664c46-8b05-4d65-9ff3-3073f47ee906-mobile)" />
                                                <path d="M19.23,17l-4.55,2.57a1.13,1.13,0,0,1-1.68-1V13.44a1.13,1.13,0,0,1,1.68-1L19.23,15A1.13,1.13,0,0,1,19.23,17Z" style="opacity: 0.8;fill: url(#a12544d8-6484-4dd4-ad6e-5781a5ae2002-mobile)" />
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Try Imandra Online
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/demos">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="f4fc95a8-cc01-4990-8fba-1e101f4d2694-mobile" x1="-792.61" y1="-675.43" x2="-810.71" y2="-675.43" gradientTransform="translate(810.84 692.43)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0aa3d" />
                                                    <stop offset="1" stop-color="#f0567e" />
                                                </linearGradient>
                                                <linearGradient id="b427c6e4-08c2-4776-897e-2b8bd9bbb222-mobile" x1="-798.43" y1="-679.43" x2="-816.52" y2="-679.43" gradientTransform="translate(820.65 690.61)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#9d56a8" />
                                                    <stop offset="1" stop-color="#7656f0" />
                                                </linearGradient>
                                                <linearGradient id="feab6c9f-96f6-45b0-a61b-132a6100febe-mobile" x1="-792.67" y1="-689.29" x2="-810.77" y2="-689.29" gradientTransform="translate(824.76 706.24)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="b829fbee-9f30-4238-8b71-fd946660d1ba-mobile" x1="-788.9" y1="-682.25" x2="-806.99" y2="-682.25" gradientTransform="translate(813.95 702.97)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="e212c59f-23dc-488b-b5f3-8ae434490a41-mobile" x1="12.82" y1="20.29" x2="18.77" y2="15.37" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <rect x="0.13" y="10.09" width="18.1" height="13.83" rx="2.35" transform="translate(26.18 7.82) rotate(90)" style="fill: url(#f4fc95a8-cc01-4990-8fba-1e101f4d2694-mobile)" />
                                                <rect x="4.12" y="4.27" width="18.1" height="13.83" rx="2.35" transform="translate(24.36 -1.98) rotate(90)" style="opacity: 0.8;fill: url(#b427c6e4-08c2-4776-897e-2b8bd9bbb222-mobile)" />
                                                <rect x="13.99" y="10.03" width="18.1" height="13.83" rx="2.35" transform="translate(39.99 -6.1) rotate(90)" style="opacity: 0.8;fill: url(#feab6c9f-96f6-45b0-a61b-132a6100febe-mobile)" />
                                                <rect x="6.95" y="13.8" width="18.1" height="13.83" rx="2.35" transform="translate(36.72 4.72) rotate(90)" style="opacity: 0.8;fill: url(#b829fbee-9f30-4238-8b71-fd946660d1ba-mobile)" />
                                                <path d="M18.91,19.52l-4,2.32a1.13,1.13,0,0,1-1.69-1V16.22a1.12,1.12,0,0,1,1.69-1l4,2.32A1.13,1.13,0,0,1,18.91,19.52Z" style="opacity: 0.8;fill: url(#e212c59f-23dc-488b-b5f3-8ae434490a41-mobile)" />
                                            </g>
                                        </svg>
                                    </span>

                                    <span class="page-nav-menu__card-list-title" data-element="title">Core Gallery
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/ipl-gallery">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="f1ff39d3-65a8-48e0-96a9-7f884b71c0bd-mobile" x1="8.41" y1="17.62" x2="20.99" y2="7.21" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="a0ac3c9e-da37-4212-92b1-0883dc35da1b-mobile" x1="5.13" y1="23.33" x2="18.13" y2="12.57" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="a290bf01-df5c-4429-9e1b-5e1b4f541c74-mobile" x1="13.3" y1="24.19" x2="22.47" y2="16.6" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                                <linearGradient id="b3613447-7b86-40d3-9fd1-c0166b75b3e8-mobile" x1="15.84" y1="18.51" x2="27.48" y2="8.87" gradientTransform="translate(8.73 37.67) rotate(-120)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0567e" />
                                                    <stop offset="1" stop-color="#9c56aa" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <path d="M11,10.93,21,16.7a1.52,1.52,0,0,1,0,2.64L11,25.11A1.52,1.52,0,0,1,8.7,23.8V12.25A1.52,1.52,0,0,1,11,10.93Z" style="opacity: 0.8;fill: url(#f1ff39d3-65a8-48e0-96a9-7f884b71c0bd-mobile)" />
                                                <path d="M17.27,10.56l10.34,6a1.57,1.57,0,0,1,0,2.72l-10.34,6a1.57,1.57,0,0,1-2.36-1.36V11.92A1.57,1.57,0,0,1,17.27,10.56Z" style="opacity: 0.8;fill: url(#a0ac3c9e-da37-4212-92b1-0883dc35da1b-mobile)" />
                                                <path d="M16.61,6.29l7.3,4.21a1.11,1.11,0,0,1,0,1.92l-7.3,4.22a1.11,1.11,0,0,1-1.66-1V7.25A1.11,1.11,0,0,1,16.61,6.29Z" style="opacity: 0.8;fill: url(#a290bf01-df5c-4429-9e1b-5e1b4f541c74-mobile)" />
                                                <path d="M8.69,4.84,18,10.19a1.41,1.41,0,0,1,0,2.44L8.69,18a1.41,1.41,0,0,1-2.11-1.22V6.06A1.41,1.41,0,0,1,8.69,4.84Z" style="opacity: 0.8;fill: url(#b3613447-7b86-40d3-9fd1-c0166b75b3e8-mobile)" />
                                            </g>
                                        </svg>
                                    </span>

                                    <span class="page-nav-menu__card-list-title" data-element="title">IPL Gallery
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Applications</h6>
                        <ul class="page-nav-menu__card-list">
                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/mbsd">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">


                                        <svg viewBox="0 0 22 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="page-nav-menu__card-list-icon">
                                            <path opacity="0.8" d="M21.71 16.42V7.58C21.71 7.04404 21.5697 6.51742 21.303 6.05251C21.0364 5.5876 20.6526 5.2006 20.19 4.93L12.53 0.51C12.0657 0.24425 11.54 0.104446 11.005 0.104446C10.47 0.104446 9.94432 0.24425 9.48001 0.51L1.81001 4.93C1.34738 5.2006 0.963645 5.5876 0.69698 6.05251C0.430314 6.51742 0.290005 7.04404 0.290009 7.58V16.42C0.290005 16.956 0.430314 17.4826 0.69698 17.9475C0.963645 18.4124 1.34738 18.7994 1.81001 19.07L9.48001 23.49C9.94432 23.7558 10.47 23.8956 11.005 23.8956C11.54 23.8956 12.0657 23.7558 12.53 23.49L20.19 19.07C20.6526 18.7994 21.0364 18.4124 21.303 17.9475C21.5697 17.4826 21.71 16.956 21.71 16.42Z" fill="url(#paint0_linear_41_85)"/>
                                            <path d="M14.47 14.09V10.04L10.96 8.02L7.45001 10.04V14.09L10.96 16.12L14.47 14.09Z" fill="url(#paint1_linear_41_85)"/>
                                            <defs>
                                            <linearGradient id="paint0_linear_41_85" x1="3.50001" y1="4.5" x2="19.04" y2="20.03" gradientUnits="userSpaceOnUse">
                                            <stop stop-color="#0088FF"/>
                                            <stop offset="1" stop-color="#00F0B4"/>
                                            </linearGradient>
                                            <linearGradient id="paint1_linear_41_85" x1="8.43001" y1="9.54" x2="13.67" y2="14.78" gradientUnits="userSpaceOnUse">
                                            <stop offset="0.01" stop-color="#78FF80"/>
                                            <stop offset="1" stop-color="#F0E566"/>
                                            </linearGradient>
                                            </defs>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title type--multiline" data-element="title">MBSD
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/formal-verification">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="e11043fc-9585-43e0-b376-e20b744f77dc-mobile" x1="-6486.77" y1="1751.17" x2="-6462.87" y2="1751.17" gradientTransform="translate(4710.7 -4774.97) rotate(-30.42)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="f478ffd2-0a36-46a3-836a-a27eb8a1409f-mobile" x1="-670.11" y1="1152.89" x2="-646.21" y2="1152.89" gradientTransform="translate(34.16 1345.97) rotate(149.58)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="adcd2281-390c-409d-8681-ff96cea5c2fe-mobile" x1="-139.6" y1="-54.39" x2="-134.11" y2="-59.88" gradientTransform="translate(-41.04 152.86) rotate(90)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <path d="M28,17.94,10.89,27.8A2.08,2.08,0,0,1,7.76,26V6.28a2.09,2.09,0,0,1,3.13-1.81L28,14.33A2.08,2.08,0,0,1,28,17.94Z" style="opacity: 0.8;fill: url(#e11043fc-9585-43e0-b376-e20b744f77dc-mobile)" />
                                                <path d="M4,14.33,21.11,4.47a2.09,2.09,0,0,1,3.13,1.81V26a2.08,2.08,0,0,1-3.13,1.8L4,17.94A2.08,2.08,0,0,1,4,14.33Z" style="opacity: 0.8;fill: url(#f478ffd2-0a36-46a3-836a-a27eb8a1409f-mobile)" />
                                                <polygon points="19.67 18.03 19.67 13.79 16 11.66 12.33 13.79 12.33 18.03 16 20.15 19.67 18.03" style="fill: url(#adcd2281-390c-409d-8681-ff96cea5c2fe-mobile)" />
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Formal Methods
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/trustworthy-ai">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">


                                        <svg viewBox="0 0 33 33" fill="none" xmlns="http://www.w3.org/2000/svg" class="page-nav-menu__card-list-icon">
                                            <circle opacity="0.8" cx="12.4903" cy="20.4158" r="7.5799" fill="url(#paint0_linear_221_3512)"/>
                                            <circle opacity="0.8" cx="21.3696" cy="20.4158" r="7.5799" fill="url(#paint1_linear_221_3512)"/>
                                            <circle opacity="0.8" cx="16.5215" cy="13.0148" r="7.5799" fill="url(#paint2_linear_221_3512)"/>
                                            <circle opacity="0.96" cx="16.9231" cy="18.0637" r="2.53096" transform="rotate(90 16.9231 18.0637)" fill="url(#paint3_linear_221_3512)"/>
                                            <defs>
                                            <linearGradient id="paint0_linear_221_3512" x1="20.8781" y1="20.4076" x2="5.79153" y2="20.4076" gradientUnits="userSpaceOnUse">
                                            <stop stop-color="#9D56A8"/>
                                            <stop offset="1" stop-color="#7656F0"/>
                                            </linearGradient>
                                            <linearGradient id="paint1_linear_221_3512" x1="14.002" y1="20.4951" x2="29.0259" y2="20.4951" gradientUnits="userSpaceOnUse">
                                            <stop stop-color="#7656F0"/>
                                            <stop offset="1" stop-color="#0088FF"/>
                                            </linearGradient>
                                            <linearGradient id="paint2_linear_221_3512" x1="8.87658" y1="12.974" x2="24.044" y2="12.8732" gradientUnits="userSpaceOnUse">
                                            <stop stop-color="#008060"/>
                                            <stop offset="1" stop-color="#00F0B4"/>
                                            </linearGradient>
                                            <linearGradient id="paint3_linear_221_3512" x1="14.3534" y1="18.0488" x2="19.4178" y2="18.0151" gradientUnits="userSpaceOnUse">
                                            <stop stop-color="#F0AA3D"/>
                                            <stop offset="1" stop-color="#F0567E"/>
                                            </linearGradient>
                                            </defs>
                                            </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Trustworthy AI
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>


                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/system-integration">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="fb1d24f0-9b89-4767-87cb-7507850304fa-mobile" x1="-376.77" y1="-904.04" x2="-390.25" y2="-904.04" gradientTransform="translate(399.51 916.37)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0aa3d" />
                                                    <stop offset="1" stop-color="#f0567e" />
                                                </linearGradient>
                                                <linearGradient id="bbe115bd-49de-46c0-aa1b-bf278cfa82bc-mobile" x1="-371.58" y1="-898.85" x2="-385.06" y2="-898.85" gradientTransform="translate(394.32 918.52)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#9d56a8" />
                                                    <stop offset="1" stop-color="#7656f0" />
                                                </linearGradient>
                                                <linearGradient id="a7c75838-1ed1-4bd1-9598-212d831a238d-mobile" x1="-376.77" y1="-898.85" x2="-390.25" y2="-898.85" gradientTransform="translate(395.84 914.85)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="b678988d-2758-4be4-b2db-88d0d0107aba-mobile" x1="-371.59" y1="-904.04" x2="-385.07" y2="-904.04" gradientTransform="translate(397.99 920.04)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                            </defs>
                                            <g id="f8612d9a-edb4-4481-a565-e1b69a5b4c41" data-name="Layer 1">
                                                <rect x="9.26" y="5.59" width="13.48" height="13.48" rx="3.55" transform="translate(13.41 -7.7) rotate(45)" style="opacity: 0.8;fill: url(#fb1d24f0-9b89-4767-87cb-7507850304fa-mobile)" />
                                                <rect x="9.26" y="12.93" width="13.48" height="13.48" rx="3.55" transform="translate(18.59 -5.55) rotate(45)" style="opacity: 0.8;fill: url(#bbe115bd-49de-46c0-aa1b-bf278cfa82bc-mobile)" />
                                                <rect x="5.59" y="9.26" width="13.48" height="13.48" rx="3.55" transform="translate(14.93 -4.04) rotate(45)" style="opacity: 0.8;fill: url(#a7c75838-1ed1-4bd1-9598-212d831a238d-mobile)" />
                                                <rect x="12.92" y="9.26" width="13.48" height="13.48" rx="3.55" transform="translate(17.07 -9.22) rotate(45)" style="opacity: 0.8;fill: url(#b678988d-2758-4be4-b2db-88d0d0107aba-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">System Integration
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Industries</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/financial-services">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="ac79aab1-f01f-4aab-95c6-9240d1769302-mobile" x1="-472.51" y1="-973.62" x2="-485.84" y2="-973.62" gradientTransform="translate(487.17 989.39)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="bff2810f-faad-4f93-b4c1-44baefa38cc0-mobile" x1="-466.85" y1="-979.27" x2="-480.18" y2="-979.27" gradientTransform="translate(616.25 1263.79) scale(1.27 1.27)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#009973" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="b90f00b0-887a-4c68-88dc-037e37d6503c-mobile" x1="-461.19" y1="-984.93" x2="-474.52" y2="-984.93" gradientTransform="translate(491.86 1000.7)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <rect x="1.33" y="9.1" width="13.33" height="13.33" rx="3.55" transform="translate(13.49 -1.04) rotate(45)" style="opacity: 0.8;fill: url(#ac79aab1-f01f-4aab-95c6-9240d1769302-mobile)" />
                                                <rect x="7.55" y="7.28" width="16.9" height="16.99" rx="3.55" transform="translate(15.84 -6.7) rotate(45)" style="opacity: 0.8;fill: url(#bff2810f-faad-4f93-b4c1-44baefa38cc0-mobile)" />
                                                <rect x="17.34" y="9.1" width="13.33" height="13.33" rx="3.55" transform="translate(18.18 -12.35) rotate(45)" style="opacity: 0.8;fill: url(#b90f00b0-887a-4c68-88dc-037e37d6503c-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Financial Services
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/autonomous-systems">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="f3cc560b-102e-4655-a1b1-253c5cba9660-mobile" x1="-1293.96" y1="-192.45" x2="-1276.66" y2="-192.45" gradientTransform="matrix(1, -0.01, 0.01, 1, 1302.66, 194.66)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="b02a9ebe-dfbe-49c5-bc4e-3ae4088bdd87-mobile" x1="-1296.71" y1="180.47" x2="-1279.41" y2="180.47" gradientTransform="matrix(1, 0.01, 0.01, -1, 1302.66, 210.28)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="b79c21d3-ee2c-4f04-9cbb-3daa25cdc452-mobile" x1="-1321.64" y1="-233.77" x2="-1304.66" y2="-233.77" gradientTransform="translate(-203.88 1330.8) rotate(89.58)" xlink:href="#f3cc560b-102e-4655-a1b1-253c5cba9660-mobile" />
                                                <linearGradient id="bf2d5ed8-1594-4d49-bfd3-7edf55d6511e-mobile" x1="18.31" y1="15.97" x2="4.84" y2="16.14" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" xlink:href="#b02a9ebe-dfbe-49c5-bc4e-3ae4088bdd87-mobile" />
                                            </defs>
                                            <g>
                                                <path d="M21.37,19.58H10.63a3.28,3.28,0,0,1-2.84-4.91l5.37-9.3a3.28,3.28,0,0,1,5.68,0l5.37,9.3A3.28,3.28,0,0,1,21.37,19.58Z" style="opacity: 0.66;fill: url(#f3cc560b-102e-4655-a1b1-253c5cba9660-mobile)" />
                                                <path d="M21.37,12.42H10.63a3.28,3.28,0,0,0-2.84,4.91l5.37,9.3a3.28,3.28,0,0,0,5.68,0l5.37-9.3A3.28,3.28,0,0,0,21.37,12.42Z" style="opacity: 0.66;fill: url(#b02a9ebe-dfbe-49c5-bc4e-3ae4088bdd87-mobile)" />
                                                <path d="M12.42,21V11a3.48,3.48,0,0,1,5.23-3l8.66,5a3.48,3.48,0,0,1,0,6l-8.66,5A3.48,3.48,0,0,1,12.42,21Z" style="opacity: 0.66;fill: url(#b79c21d3-ee2c-4f04-9cbb-3daa25cdc452-mobile)" />
                                                <path d="M19.58,21V11a3.48,3.48,0,0,0-5.23-3L5.69,13a3.48,3.48,0,0,0,0,6l8.66,5A3.48,3.48,0,0,0,19.58,21Z" style="opacity: 0.66;fill: url(#bf2d5ed8-1594-4d49-bfd3-7edf55d6511e-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Autonomous Systems
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/government">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="e91eec89-0bc9-4d97-85d6-4dcaee6fad8c-mobile" x1="3.88" y1="28.53" x2="21.06" y2="18.13" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="a35f1a17-4bbf-4ea7-9630-e732a4403e5a-mobile" x1="14.51" y1="1801.35" x2="27.59" y2="1801.35" gradientTransform="translate(-1527.76 941.73) rotate(-120.42)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="a6daf51c-f8f6-474c-a458-31d5f8507054-mobile" x1="-2355.41" y1="410.63" x2="-2346.48" y2="410.63" gradientTransform="translate(-786.66 2269.45) rotate(119.58)" xlink:href="#a35f1a17-4bbf-4ea7-9630-e732a4403e5a-mobile" />
                                            </defs>
                                            <g>
                                                <path d="M17.81,9.73l8.91,15.44a2.08,2.08,0,0,1-1.81,3.12H7.09a2.08,2.08,0,0,1-1.81-3.12L14.19,9.73A2.09,2.09,0,0,1,17.81,9.73Z" style="opacity: 0.8;fill: url(#e91eec89-0bc9-4d97-85d6-4dcaee6fad8c-mobile)" />
                                                <path d="M17.81,4.58l4.45,7.72a2.08,2.08,0,0,1-1.81,3.12h-8.9A2.08,2.08,0,0,1,9.74,12.3l4.45-7.72A2.09,2.09,0,0,1,17.81,4.58Z" style="opacity: 0.8;fill: url(#a35f1a17-4bbf-4ea7-9630-e732a4403e5a-mobile)" />
                                                <path d="M11.78,22.46l2.67-4.63a1.79,1.79,0,0,1,3.1,0l2.67,4.63a1.79,1.79,0,0,1-1.55,2.68H13.33A1.79,1.79,0,0,1,11.78,22.46Z" style="opacity: 0.8;fill: url(#a6daf51c-f8f6-474c-a458-31d5f8507054-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Government & Defense
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Documentation</h6>
                        <ul class="page-nav-menu__card-list">
                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/imandra-docs/">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="e51ff9ea-42ef-4973-aa09-9e903c56cc10-mobile" x1="-627.64" y1="-420.99" x2="-609.89" y2="-438.74" gradientTransform="translate(-603.82 -412.71) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="ade641ef-0c77-41e1-8e53-724b1e780f70-mobile" x1="-628.41" y1="-421.82" x2="-610.65" y2="-439.58" gradientTransform="translate(-603.75 -414.32) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="eae017dd-fa64-4a91-9803-0a78556c3668-mobile" x1="2.96" y1="14.63" x2="12.26" y2="6.93" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" xlink:href="#e51ff9ea-42ef-4973-aa09-9e903c56cc10-mobile" />
                                                <linearGradient id="e31b5bb4-ae71-4f81-a450-4d0b93977b50-mobile" x1="10.28" y1="11.96" x2="6.6" y2="11.96" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                                <linearGradient id="acd6ac43-9990-4931-974c-1a987b989947-mobile" x1="-1042.27" y1="3517.02" x2="-1031.31" y2="3517.02" gradientTransform="translate(-2813.18 -2310.72) rotate(-67.12)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0567e" />
                                                    <stop offset="1" stop-color="#9c56aa" />
                                                </linearGradient>
                                                <linearGradient id="a7641cb9-49e9-4f94-87d6-126c8c7a85f0-mobile" x1="10.84" y1="19.48" x2="21.87" y2="19.48" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50-mobile" />
                                                <linearGradient id="b863d450-a4f1-4891-9b2f-bf3feeb635f0-mobile" x1="10.84" y1="20.86" x2="21.87" y2="20.86" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50-mobile" />
                                                <linearGradient id="b808cdaa-31c3-47ff-8440-dd0a88d79535-mobile" x1="10.84" y1="22.25" x2="21.87" y2="22.25" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50-mobile" />
                                                <linearGradient id="f55bfafc-3a29-4c8d-80b8-e3f9c0fb86bb-mobile" x1="10.84" y1="23.63" x2="21.87" y2="23.63" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50-mobile" />
                                                <linearGradient id="ab08b4fe-8772-4c41-b1c8-77b381a729ff-mobile" x1="10.84" y1="25.02" x2="16.39" y2="25.02" xlink:href="#e31b5bb4-ae71-4f81-a450-4d0b93977b50-mobile" />
                                                <linearGradient id="b2984b7c-b001-4be3-8d40-437d38d2a1f6-mobile" x1="16" y1="9.47" x2="16" y2="14.86" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0aa3d" />
                                                    <stop offset="1" stop-color="#f0567e" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <rect x="3.1" y="8.86" width="24.29" height="15.99" rx="2.39" transform="translate(-1.61 32.1) rotate(-90)" style="opacity: 0.8;fill: url(#e51ff9ea-42ef-4973-aa09-9e903c56cc10-mobile)" />
                                                <rect x="3.94" y="8.09" width="24.29" height="15.99" rx="2.39" transform="translate(0 32.17) rotate(-90)" style="opacity: 0.8;fill: url(#ade641ef-0c77-41e1-8e53-724b1e780f70-mobile)" />
                                                <path d="M13,12.93,5.63,17.2a1.12,1.12,0,0,1-1.69-1V7.69a1.13,1.13,0,0,1,1.69-1L13,11A1.13,1.13,0,0,1,13,12.93Z" style="opacity: 0.8;fill: url(#eae017dd-fa64-4a91-9803-0a78556c3668-mobile)" />
                                                <path d="M8.36,10a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;fill: url(#e31b5bb4-ae71-4f81-a450-4d0b93977b50-mobile)" />
                                                <path d="M18.37,12.75a.19.19,0,0,0,.17.16l1.35.18a4.27,4.27,0,0,0,.41,1l-.83,1.08a.17.17,0,0,0,0,.23,5.46,5.46,0,0,0,1.1,1.1.18.18,0,0,0,.24,0l1.08-.83a3.9,3.9,0,0,0,1,.4L23,17.38a.21.21,0,0,0,.17.17,5.44,5.44,0,0,0,1.56,0,.19.19,0,0,0,.17-.16L25.12,16a4.31,4.31,0,0,0,1-.4l1.08.82a.18.18,0,0,0,.24,0,5.73,5.73,0,0,0,1.1-1.1.18.18,0,0,0,0-.24L27.68,14a4.31,4.31,0,0,0,.4-1l1.35-.18a.19.19,0,0,0,.17-.16,5.82,5.82,0,0,0,0-1.56.19.19,0,0,0-.17-.17l-1.35-.17a4.35,4.35,0,0,0-.41-1l.83-1.08a.2.2,0,0,0,0-.23,5.51,5.51,0,0,0-1.11-1.1.2.2,0,0,0-.23,0l-1.08.83a4.39,4.39,0,0,0-1-.4l-.18-1.34a.19.19,0,0,0-.16-.17,4.25,4.25,0,0,0-.79,0,5.27,5.27,0,0,0-.78,0,.19.19,0,0,0-.17.17l-.17,1.34a4.16,4.16,0,0,0-1,.41L20.8,7.46a.21.21,0,0,0-.24,0,5.83,5.83,0,0,0-1.11,1.11.18.18,0,0,0,0,.23l.83,1.08a3.83,3.83,0,0,0-.4,1L18.54,11a.19.19,0,0,0-.17.17A5.82,5.82,0,0,0,18.37,12.75ZM24,10.13A1.83,1.83,0,1,1,22.15,12,1.84,1.84,0,0,1,24,10.13Z"
                                                    style="opacity: 0.8;fill: url(#acd6ac43-9990-4931-974c-1a987b989947-mobile)" />
                                                <rect x="10.84" y="19.04" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#a7641cb9-49e9-4f94-87d6-126c8c7a85f0-mobile)" />
                                                <rect x="10.84" y="20.43" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#b863d450-a4f1-4891-9b2f-bf3feeb635f0-mobile)" />
                                                <rect x="10.84" y="21.81" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#b808cdaa-31c3-47ff-8440-dd0a88d79535-mobile)" />
                                                <rect x="10.84" y="23.2" width="11.03" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#f55bfafc-3a29-4c8d-80b8-e3f9c0fb86bb-mobile)" />
                                                <rect x="10.84" y="24.58" width="5.55" height="0.87" rx="0.44" style="opacity: 0.8;fill: url(#ab08b4fe-8772-4c41-b1c8-77b381a729ff-mobile)" />
                                                <path id="a2fe1c7b-e909-4f06-a3de-ce530d29f64c-mobile" data-name="Fill-5" d="M16,9.29a1.1,1.1,0,0,1,1.13,1.12v3.38a1.13,1.13,0,0,1-2.26,0V10.41A1.1,1.1,0,0,1,16,9.29" style="fill-rule: evenodd;opacity: 0.8;fill: url(#b2984b7c-b001-4be3-8d40-437d38d2a1f6-mobile)" />
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Imandra Core
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/imandra-docs/notebooks/python-api/">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                                <g clip-path="url(#clip0_218_231)">
                                                    <path opacity="0.8" d="M6.45001 3.31999L6.45001 22.83C6.45001 24.1499 7.52005 25.22 8.84001 25.22H20.05C21.37 25.22 22.44 24.1499 22.44 22.83V3.31999C22.44 2.00003 21.37 0.929987 20.05 0.929987H8.84001C7.52005 0.929987 6.45001 2.00003 6.45001 3.31999Z" fill="url(#paint0_linear_218_231)"/>
                                                    <path opacity="0.8" d="M7.28 2.56999L7.28 22.08C7.28 23.3999 8.35004 24.47 9.67 24.47H20.88C22.2 24.47 23.27 23.3999 23.27 22.08V2.56999C23.27 1.25003 22.2 0.179987 20.88 0.179987H9.67C8.35004 0.179987 7.28 1.25003 7.28 2.56999Z" fill="url(#paint1_linear_218_231)"/>
                                                    <path opacity="0.8" d="M26.18 3.34998H20.19C19.1848 3.34998 18.37 4.16482 18.37 5.16998V11.16C18.37 12.1651 19.1848 12.98 20.19 12.98H26.18C27.1852 12.98 28 12.1651 28 11.16V5.16998C28 4.16482 27.1852 3.34998 26.18 3.34998Z" fill="url(#paint2_linear_218_231)"/>
                                                    <path opacity="0.8" d="M12.22 7.37999C12.21 7.28999 12.14 7.22999 12.05 7.20999L10.7 7.03999C10.61 6.69999 10.47 6.37999 10.3 6.07999L11.13 4.99999C11.18 4.92999 11.18 4.82999 11.13 4.75999C10.81 4.33999 10.44 3.96999 10.02 3.65999C9.94999 3.60999 9.84999 3.60999 9.77999 3.65999L8.69999 4.48999C8.38999 4.31999 8.06999 4.17999 7.72999 4.08999L7.54999 2.73999C7.53999 2.64999 7.46999 2.57999 7.37999 2.56999C6.83999 2.49999 6.34999 2.49999 5.80999 2.56999C5.71999 2.57999 5.64999 2.64999 5.63999 2.73999L5.46999 4.07999C5.12999 4.16999 4.79999 4.30999 4.49999 4.47999L3.41999 3.64999C3.34999 3.59999 3.24999 3.59999 3.17999 3.64999C2.76999 3.95999 2.38999 4.33999 2.06999 4.74999C2.01999 4.81999 2.01999 4.91999 2.06999 4.98999L2.89999 6.05999C2.72999 6.36999 2.58999 6.68999 2.49999 7.02999L1.14999 7.20999C1.05999 7.21999 0.98999 7.28999 0.97999 7.37999C0.90999 7.89999 0.90999 8.41999 0.97999 8.93999C0.98999 9.02999 1.05999 9.08999 1.14999 9.10999L2.49999 9.27999C2.58999 9.61999 2.72999 9.93999 2.90999 10.25L2.07999 11.33C2.02999 11.4 2.02999 11.5 2.07999 11.57C2.38999 11.98 2.77999 12.36 3.18999 12.67C3.25999 12.72 3.35999 12.72 3.42999 12.67L4.50999 11.84C4.81999 12.01 5.13999 12.15 5.47999 12.24L5.65999 13.58C5.66999 13.67 5.73999 13.74 5.82999 13.75C6.09999 13.79 6.34999 13.8 6.60999 13.8C6.86999 13.8 7.12999 13.78 7.38999 13.74C7.47999 13.73 7.54999 13.66 7.55999 13.57L7.72999 12.22C8.06999 12.13 8.38999 11.99 8.69999 11.82L9.77999 12.65C9.84999 12.7 9.94999 12.7 10.02 12.65C10.44 12.33 10.81 11.96 11.13 11.55C11.18 11.48 11.18 11.38 11.13 11.31L10.3 10.24C10.47 9.93999 10.61 9.60999 10.7 9.26999L12.05 9.08999C12.14 9.07999 12.21 9.00999 12.22 8.91999C12.29 8.38999 12.29 7.88999 12.22 7.35999V7.37999ZM6.60999 9.98999C5.59999 9.98999 4.77999 9.17999 4.77999 8.16999C4.77999 7.15999 5.59999 6.34999 6.60999 6.33999C7.61999 6.32999 8.43999 7.14999 8.44999 8.15999C8.45999 9.16999 7.62999 9.97999 6.61999 9.98999H6.60999Z" fill="url(#paint3_linear_218_231)"/>
                                                    <path opacity="0.8" fill-rule="evenodd" clip-rule="evenodd" d="M23.05 6.08999C21.97 6.09999 21.1 6.97999 21.1 8.06999C21.1 9.16999 21.98 10.05 23.07 10.05C24.16 10.05 25.03 9.15999 25.03 8.05999C25.03 6.96999 24.16 6.08999 23.08 6.07999H23.04L23.05 6.08999Z" fill="url(#paint4_linear_218_231)"/>
                                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M14.79 10.98C14.15 10.98 13.66 10.5 13.66 9.84998V6.46998C13.66 5.82998 14.14 5.33998 14.79 5.33998C15.44 5.33998 15.92 5.81998 15.92 6.46998V9.84998C15.92 10.49 15.44 10.98 14.79 10.98Z" fill="url(#paint5_linear_218_231)"/>
                                                    <path opacity="0.8" d="M15.02 14.13C14.68 14.13 14.35 14.16 14.07 14.21C13.23 14.36 13.07 14.67 13.07 15.24V16H15.07V16.25H12.32C11.74 16.25 11.23 16.6 11.07 17.26C10.88 18.02 10.88 18.5 11.07 19.28C11.21 19.87 11.55 20.29 12.13 20.29H12.81V19.39C12.81 18.73 13.38 18.15 14.06 18.15H16.06C16.62 18.15 17.06 17.7 17.06 17.14V15.24C17.06 14.7 16.61 14.29 16.06 14.21C15.72 14.15 15.37 14.12 15.03 14.12L15.02 14.13ZM13.94 14.75C14.15 14.75 14.31 14.92 14.31 15.13C14.31 15.34 14.14 15.51 13.94 15.51C13.74 15.51 13.57 15.34 13.57 15.13C13.57 14.92 13.73 14.75 13.94 14.75Z" fill="url(#paint6_linear_218_231)"/>
                                                    <path d="M17.3 16.26V17.15C17.3 17.83 16.72 18.42 16.05 18.42H14.06C13.52 18.42 13.06 18.89 13.06 19.43V21.33C13.06 21.87 13.53 22.19 14.06 22.34C14.69 22.53 15.3 22.56 16.06 22.34C16.57 22.19 17.06 21.9 17.06 21.33V20.57H15.06V20.32H18.05C18.63 20.32 18.85 19.92 19.05 19.31C19.26 18.68 19.25 18.08 19.05 17.29C18.91 16.71 18.63 16.28 18.05 16.28H17.3V16.26ZM16.18 21.07C16.39 21.07 16.55 21.24 16.55 21.45C16.55 21.66 16.38 21.83 16.18 21.83C15.98 21.83 15.81 21.66 15.81 21.45C15.81 21.24 15.97 21.07 16.18 21.07Z" fill="url(#paint7_linear_218_231)"/>
                                                    </g>
                                                    <defs>
                                                    <linearGradient id="paint0_linear_218_231" x1="5.87001" y1="4.49999" x2="23.62" y2="22.26" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#0088FF"/>
                                                    <stop offset="1" stop-color="#00F0B4"/>
                                                    </linearGradient>
                                                    <linearGradient id="paint1_linear_218_231" x1="6.7" y1="3.73999" x2="24.45" y2="21.5" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#7656F0"/>
                                                    <stop offset="1" stop-color="#0088FF"/>
                                                    </linearGradient>
                                                    <linearGradient id="paint2_linear_218_231" x1="18.98" y1="11.64" x2="29.5" y2="2.93998" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#F0AA3D"/>
                                                    <stop offset="1" stop-color="#F0567E"/>
                                                    </linearGradient>
                                                    <linearGradient id="paint3_linear_218_231" x1="8.70611" y1="3.14963" x2="4.44095" y2="13.2565" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#F0567E"/>
                                                    <stop offset="1" stop-color="#9C56AA"/>
                                                    </linearGradient>
                                                    <linearGradient id="paint4_linear_218_231" x1="24.97" y1="8.07999" x2="21.29" y2="8.07999" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#7656F0"/>
                                                    <stop offset="1" stop-color="#0088FF"/>
                                                    </linearGradient>
                                                    <linearGradient id="paint5_linear_218_231" x1="14.79" y1="10.8" x2="14.79" y2="5.40998" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#78FF80"/>
                                                    <stop offset="1" stop-color="#F0E566"/>
                                                    </linearGradient>
                                                    <linearGradient id="paint6_linear_218_231" x1="-0.172811" y1="-4.45722" x2="4.36879" y2="-0.542822" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#0088FF"/>
                                                    <stop offset="1" stop-color="#00F0B4"/>
                                                    </linearGradient>
                                                    <linearGradient id="paint7_linear_218_231" x1="6.1272" y1="1.82038" x2="4.5088" y2="-0.475622" gradientUnits="userSpaceOnUse">
                                                    <stop stop-color="#78FF80"/>
                                                    <stop offset="1" stop-color="#F0E566"/>
                                                    </linearGradient>
                                                    <clipPath id="clip0_218_231">
                                                    <rect width="27.06" height="25.06" fill="white" transform="translate(0.940002 0.169983)"/>
                                                    </clipPath>
                                                    </defs>
                                                    </svg>
                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Python API
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Languages & Interfaces</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/ipl/">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="fa3608ca-bbcf-47eb-a1c8-4be48cf33099-mobile" x1="-789.06" y1="-582.4" x2="-771.3" y2="-600.16" gradientTransform="translate(-765.23 -574.12) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="a506a6a8-fab7-4b84-b104-331cd76c7b62-mobile" x1="-789.82" y1="-583.24" x2="-772.07" y2="-601" gradientTransform="translate(-765.16 -575.73) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0aa3d" />
                                                    <stop offset="1" stop-color="#f0567e" />
                                                </linearGradient>
                                                <linearGradient id="bb829f8c-eec2-40b1-b76d-8e75eef76233-mobile" x1="20.5" y1="21.17" x2="18.28" y2="21.17" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                                <linearGradient id="b690d159-c987-4fec-88a7-0dbcfb9fc4c8-mobile" x1="16.67" y1="21.17" x2="14.45" y2="21.17" xlink:href="#bb829f8c-eec2-40b1-b76d-8e75eef76233-mobile" />
                                                <linearGradient id="ab941f6a-c203-4fa0-967e-5cfd592073b5-mobile" x1="12.87" y1="21.17" x2="10.64" y2="21.17" xlink:href="#bb829f8c-eec2-40b1-b76d-8e75eef76233-mobile" />
                                                <linearGradient id="a140b5be-6ac7-4b54-abbd-4d2c1cf063b8-mobile" x1="16.67" y1="11.85" x2="7.14" y2="11.85" gradientTransform="translate(12.06)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0567e" />
                                                    <stop offset="1" stop-color="#9c56aa" />
                                                </linearGradient>
                                                <linearGradient id="b9762c5a-8dbc-4c4e-9104-d5aca4e6220d-mobile" x1="-226.23" y1="9.35" x2="-226.23" y2="14.74" gradientTransform="translate(-210.63 23.91) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="e5d3d7a6-7b07-4106-849a-212d4eadf366-mobile" x1="13.72" y1="11.85" x2="10.04" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#b9762c5a-8dbc-4c4e-9104-d5aca4e6220d-mobile" />
                                                <linearGradient id="ecd75f6c-0eae-4750-a094-36d4df3ec84e-mobile" x1="0.27" y1="11.85" x2="-9.26" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#fa3608ca-bbcf-47eb-a1c8-4be48cf33099-mobile" />
                                                <linearGradient id="bb357e35-efdc-4bb8-82ff-e24b6fec3af5-mobile" x1="-2.68" y1="11.85" x2="-6.36" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#b9762c5a-8dbc-4c4e-9104-d5aca4e6220d-mobile" />
                                            </defs>
                                            <g>
                                                <rect x="3.1" y="8.86" width="24.29" height="15.99" rx="2.39" transform="translate(-1.61 32.1) rotate(-90)" style="opacity: 0.8;fill: url(#fa3608ca-bbcf-47eb-a1c8-4be48cf33099-mobile)" />
                                                <rect x="3.94" y="8.09" width="24.29" height="15.99" rx="2.39" transform="translate(0 32.17) rotate(-90)" style="opacity: 0.8;fill: url(#a506a6a8-fab7-4b84-b104-331cd76c7b62-mobile)" />
                                                <path d="M19.34,20a1.2,1.2,0,1,0,1.2,1.19A1.18,1.18,0,0,0,19.36,20Z" style="fill-rule: evenodd;fill: url(#bb829f8c-eec2-40b1-b76d-8e75eef76233-mobile)" />
                                                <path d="M15.51,20a1.2,1.2,0,1,0,1.2,1.19A1.19,1.19,0,0,0,15.51,20Z" style="fill-rule: evenodd;fill: url(#b690d159-c987-4fec-88a7-0dbcfb9fc4c8-mobile)" />
                                                <path d="M11.71,20a1.2,1.2,0,1,0,1.2,1.19A1.19,1.19,0,0,0,11.71,20Z" style="fill-rule: evenodd;fill: url(#ab941f6a-c203-4fa0-967e-5cfd592073b5-mobile)" />
                                                <path d="M23.75,6.71a5.1,5.1,0,1,0,.1,0Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#a140b5be-6ac7-4b54-abbd-4d2c1cf063b8-mobile)" />
                                                <path id="b756f009-a7cf-4c2e-8bb8-595d1fb5a1f4-mobile" data-name="Fill-5" d="M15.59,14.75a1.09,1.09,0,0,1-1.12-1.12V10.25a1.13,1.13,0,1,1,2.25,0v3.38a1.1,1.1,0,0,1-1.13,1.12" style="fill-rule: evenodd;opacity: 0.8;fill: url(#b9762c5a-8dbc-4c4e-9104-d5aca4e6220d-mobile)" />
                                                <path d="M23.86,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#e5d3d7a6-7b07-4106-849a-212d4eadf366-mobile)" />
                                                <path d="M7.35,6.71a5.1,5.1,0,1,0,.1,0Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#ecd75f6c-0eae-4750-a094-36d4df3ec84e-mobile)" />
                                                <path d="M7.46,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#bb357e35-efdc-4bb8-82ff-e24b6fec3af5-mobile)" />
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">IPL
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://docs.imandra.ai/imandra-rule-synth/">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="a5f02a43-b9fa-4a38-bd72-cd8603430b3d-mobile" x1="-748.63" y1="-541.98" x2="-730.88" y2="-559.73" gradientTransform="translate(-724.81 -533.7) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                                <linearGradient id="abb86233-8a5b-4343-9b82-0f6028f275e5-mobile" x1="-749.4" y1="-542.82" x2="-731.64" y2="-560.57" gradientTransform="translate(-724.74 -535.31) rotate(180)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="ba4b5197-789b-4838-b535-649e38db1eb9-mobile" x1="-187.12" y1="-34.35" x2="-180.43" y2="-39.88" gradientTransform="translate(199.45 57.38)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="b6dd8977-d6b3-47c1-b875-15d0c67a2053-mobile" x1="19.95" y1="21.17" x2="17.72" y2="21.17" gradientTransform="matrix(1, 0, 0, 1, 0, 0)" xlink:href="#a5f02a43-b9fa-4a38-bd72-cd8603430b3d-mobile" />
                                                <linearGradient id="abfa2cf9-8a53-426e-b609-df67b7bbb0d8-mobile" x1="8.14" y1="27.06" x2="18.66" y2="18.35" gradientTransform="translate(-4.82 -11.65)" xlink:href="#a5f02a43-b9fa-4a38-bd72-cd8603430b3d-mobile" />
                                                <linearGradient id="e9006b2b-9f2e-4518-8dda-bb1798e36162-mobile" x1="-2.95" y1="11.85" x2="-6.62" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#ba4b5197-789b-4838-b535-649e38db1eb9-mobile" />
                                                <linearGradient id="a251c688-c5a2-47dc-bdb4-7e5de35805e4-mobile" x1="-145.38" y1="9.35" x2="-145.38" y2="14.74" gradientTransform="translate(-129.79 23.91) rotate(180)" xlink:href="#a5f02a43-b9fa-4a38-bd72-cd8603430b3d-mobile" />
                                                <linearGradient id="a052ee5c-8256-4dc5-a398-6665d14cb822-mobile" x1="6.96" y1="14.63" x2="16.26" y2="6.93" gradientTransform="translate(12.06)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0567e" />
                                                    <stop offset="1" stop-color="#9c56aa" />
                                                </linearGradient>
                                                <linearGradient id="fd058114-3c11-47e8-aae9-997efef6a838-mobile" x1="13.72" y1="11.85" x2="10.04" y2="11.85" gradientTransform="translate(12.06)" xlink:href="#abb86233-8a5b-4343-9b82-0f6028f275e5-mobile" />
                                            </defs>
                                            <g>
                                                <rect x="3.1" y="8.86" width="24.29" height="15.99" rx="2.39" transform="translate(-1.61 32.1) rotate(-90)" style="fill: url(#a5f02a43-b9fa-4a38-bd72-cd8603430b3d-mobile)" />
                                                <rect x="3.94" y="8.09" width="24.29" height="15.99" rx="2.39" transform="translate(0 32.17) rotate(-90)" style="opacity: 0.8;fill: url(#abb86233-8a5b-4343-9b82-0f6028f275e5-mobile)" />
                                                <path d="M19.57,21.81l-5.32,3.07a.81.81,0,0,1-1.21-.7V18a.81.81,0,0,1,1.21-.7l5.32,3.07A.81.81,0,0,1,19.57,21.81Z" style="opacity: 0.8;fill: url(#ba4b5197-789b-4838-b535-649e38db1eb9-mobile)" />
                                                <path d="M18.79,20A1.2,1.2,0,1,0,20,21.16,1.19,1.19,0,0,0,18.79,20Z" style="fill-rule: evenodd;fill: url(#b6dd8977-d6b3-47c1-b875-15d0c67a2053-mobile)" />
                                                <rect x="2.7" y="7.12" width="9.63" height="9.63" rx="1.82" transform="translate(10.64 -1.82) rotate(45)" style="fill: url(#abfa2cf9-8a53-426e-b609-df67b7bbb0d8-mobile)" />
                                                <path d="M7.19,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#e9006b2b-9f2e-4518-8dda-bb1798e36162-mobile)" />
                                                <path id="b175bd3d-dae4-4e97-8a76-415985dfc3f8-mobile" data-name="Fill-5" d="M15.59,14.75a1.09,1.09,0,0,1-1.12-1.12V10.25a1.13,1.13,0,1,1,2.25,0v3.38a1.1,1.1,0,0,1-1.13,1.12" style="fill-rule: evenodd;fill: url(#a251c688-c5a2-47dc-bdb4-7e5de35805e4-mobile)" />
                                                <path d="M29.09,12.93l-7.4,4.27a1.12,1.12,0,0,1-1.69-1V7.69a1.13,1.13,0,0,1,1.69-1L29.09,11A1.13,1.13,0,0,1,29.09,12.93Z" style="opacity: 0.8;fill: url(#a052ee5c-8256-4dc5-a398-6665d14cb822-mobile)" />
                                                <path d="M23.86,9.86a2,2,0,1,0,2,2,2,2,0,0,0-2-2Z" style="fill-rule: evenodd;opacity: 0.8;fill: url(#fd058114-3c11-47e8-aae9-997efef6a838-mobile)" />
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Rule Synthesis
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Company</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/about">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="aed4d08e-8fae-4a0f-b23e-8eed570230be-mobile" x1="7.4" y1="23.53" x2="23.58" y2="9.37" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="bd5d9270-c979-4d59-82f2-57c19d5faac4-mobile" x1="10.99" y1="19.38" x2="21.01" y2="19.38" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                                <linearGradient id="ace2fa23-b9a8-41f9-bfb7-4c8a480be6ee-mobile" x1="13.71" y1="11.43" x2="18.29" y2="11.43" xlink:href="#bd5d9270-c979-4d59-82f2-57c19d5faac4-mobile" />
                                            </defs>
                                            <g>
                                                <path d="M16.2,27.14h-.44A11.2,11.2,0,0,1,4.65,16h0A11.2,11.2,0,0,1,15.8,4.86h.4A11.2,11.2,0,0,1,27.35,16h0A11.18,11.18,0,0,1,16.2,27.14Z" style="opacity: 0.8;fill: url(#aed4d08e-8fae-4a0f-b23e-8eed570230be-mobile)" />
                                                <path d="M12.78,14.8h6.44a1.79,1.79,0,0,1,1.55,2.68l-3.22,5.58a1.79,1.79,0,0,1-3.1,0l-3.22-5.58A1.79,1.79,0,0,1,12.78,14.8Z" style="opacity: 0.9;fill: url(#bd5d9270-c979-4d59-82f2-57c19d5faac4-mobile)" />
                                                <circle cx="16" cy="11.43" r="2.29" style="opacity: 0.9;fill: url(#ace2fa23-b9a8-41f9-bfb7-4c8a480be6ee-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">About
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>


                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://apply.workable.com/imandra/">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="e059fd96-2f3f-444e-aec4-99db27a746bd-mobile" x1="-2398.64" y1="608.27" x2="-2386.9" y2="608.27" gradientTransform="translate(2404.24 -616.69) rotate(-0.42)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0aa3d" />
                                                    <stop offset="1" stop-color="#f0567e" />
                                                </linearGradient>
                                                <linearGradient id="e28dfe9e-3769-45c6-ace3-d691d32fec87-mobile" x1="-2404.9" y1="619.09" x2="-2393.16" y2="619.09" gradientTransform="translate(2404.24 -616.69) rotate(-0.42)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="ea764b29-7bae-495f-8535-1a702e4adc0b-mobile" x1="-2392.21" y1="619.14" x2="-2380.47" y2="619.14" gradientTransform="translate(2404.24 -616.69) rotate(-0.42)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#008060" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <path d="M20.12,14.5H12a1.79,1.79,0,0,1-1.55-2.68l4.08-7.07a1.79,1.79,0,0,1,3.1,0l4.08,7.07A1.79,1.79,0,0,1,20.12,14.5Z" style="opacity: 0.8;fill: url(#e059fd96-2f3f-444e-aec4-99db27a746bd-mobile)" />
                                                <path d="M13.94,25.36H5.78a1.79,1.79,0,0,1-1.55-2.68l4.08-7.07a1.79,1.79,0,0,1,3.1,0l4.08,7.07A1.79,1.79,0,0,1,13.94,25.36Z" style="opacity: 0.8;fill: url(#e28dfe9e-3769-45c6-ace3-d691d32fec87-mobile)" />
                                                <path d="M26.63,25.32H18.47a1.79,1.79,0,0,1-1.55-2.68L21,15.57a1.79,1.79,0,0,1,3.1,0l4.08,7.07A1.79,1.79,0,0,1,26.63,25.32Z" style="opacity: 0.8;fill: url(#ea764b29-7bae-495f-8535-1a702e4adc0b-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Careers
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://discord.com/invite/byQApJ3">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="e9967427-a0d4-43e6-8ef0-54ccb71dc207-mobile" x1="-2722.1" y1="480.46" x2="-2713" y2="480.46" gradientTransform="translate(-2075.73 1807.15) rotate(149.58)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#ffef54" />
                                                    <stop offset="1" stop-color="#f0aa3d" />
                                                </linearGradient>
                                                <linearGradient id="b9fa3870-6b45-4730-9fb3-e9669211feed-mobile" x1="13.53" y1="16.09" x2="5.14" y2="16.09" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#9d56a8" />
                                                    <stop offset="1" stop-color="#7656f0" />
                                                </linearGradient>
                                                <linearGradient id="e47969e3-2f25-4183-b704-63fa513c325c-mobile" x1="-1412.72" y1="-344.15" x2="-1403.54" y2="-344.15" gradientTransform="matrix(0.01, 1, -1, 0.01, -312.94, 1419.56)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="e9ca7409-6e03-44e3-8a9d-5ac38b6b197b-mobile" x1="-1398.62" y1="-343.98" x2="-1389.45" y2="-343.98" gradientTransform="matrix(0.01, 1, -1, 0.01, -312.94, 1419.56)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0aa3d" />
                                                    <stop offset="1" stop-color="#f0567e" />
                                                </linearGradient>
                                                <linearGradient id="b0da5193-fb1b-48ab-8bca-ab28912b50e8-mobile" x1="-1417.53" y1="309.67" x2="-1408.36" y2="309.67" gradientTransform="matrix(-0.01, 1, 1, 0.01, -308.91, 1419.56)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="abf7975a-64e5-49de-a6b5-660b6ad1398f-mobile" x1="-1403.44" y1="309.84" x2="-1394.27" y2="309.84" gradientTransform="matrix(-0.01, 1, 1, 0.01, -308.91, 1419.56)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0567e" />
                                                    <stop offset="1" stop-color="#9c56aa" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <path d="M19.89,14.55l4.78-2.76a1.79,1.79,0,0,1,2.68,1.55v5.51a1.79,1.79,0,0,1-2.68,1.55l-4.78-2.76A1.78,1.78,0,0,1,19.89,14.55Z" style="opacity: 0.8;fill: url(#e9967427-a0d4-43e6-8ef0-54ccb71dc207-mobile)" />
                                                <path d="M12.17,17.66,7.36,20.44a1.81,1.81,0,0,1-2.71-1.57V13.32a1.81,1.81,0,0,1,2.71-1.57l4.81,2.78A1.8,1.8,0,0,1,12.17,17.66Z" style="opacity: 0.8;fill: url(#b9fa3870-6b45-4730-9fb3-e9669211feed-mobile)" />
                                                <path d="M16.62,11.73V6.18a1.81,1.81,0,0,1,2.71-1.57l4.81,2.78a1.81,1.81,0,0,1,0,3.13L19.33,13.3A1.81,1.81,0,0,1,16.62,11.73Z" style="opacity: 0.8;fill: url(#e47969e3-2f25-4183-b704-63fa513c325c-mobile)" />
                                                <path d="M16.55,25.82V20.27a1.81,1.81,0,0,1,2.71-1.57l4.81,2.78a1.8,1.8,0,0,1,0,3.13l-4.81,2.78A1.81,1.81,0,0,1,16.55,25.82Z" style="opacity: 0.8;fill: url(#e9ca7409-6e03-44e3-8a9d-5ac38b6b197b-mobile)" />
                                                <path d="M15.36,11.73V6.18a1.81,1.81,0,0,0-2.71-1.57L7.84,7.39a1.8,1.8,0,0,0,0,3.13l4.81,2.78A1.81,1.81,0,0,0,15.36,11.73Z" style="opacity: 0.8;fill: url(#b0da5193-fb1b-48ab-8bca-ab28912b50e8-mobile)" />
                                                <path d="M15.42,25.82V20.27a1.81,1.81,0,0,0-2.71-1.57L7.9,21.48a1.81,1.81,0,0,0,0,3.13l4.81,2.78A1.81,1.81,0,0,0,15.42,25.82Z" style="opacity: 0.8;fill: url(#abf7975a-64e5-49de-a6b5-660b6ad1398f-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Community
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">Media</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://medium.com/imandra">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="b559e18b-97dd-45f8-82f3-509dc91fd611-mobile" x1="6.12" y1="11.91" x2="18.23" y2="24.02" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#9d56a8" />
                                                    <stop offset="1" stop-color="#7656f0" />
                                                </linearGradient>
                                                <linearGradient id="a0e84c7e-ecb0-41a8-b691-23385417b5e6-mobile" x1="-516.01" y1="-1193.69" x2="-530.89" y2="-1193.69" gradientTransform="matrix(0, 1, 1, 0, 1213.89, 536.59)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <path d="M5.64,20.48V14.71a3.28,3.28,0,0,1,3.28-3.28h5.77A3.28,3.28,0,0,1,18,14.71v11.6l-2.18-2.55H8.92A3.29,3.29,0,0,1,5.64,20.48Z" style="opacity: 0.8;fill: url(#b559e18b-97dd-45f8-82f3-509dc91fd611-mobile)" />
                                                <path d="M26.36,14.75V9a3.29,3.29,0,0,0-3.28-3.29H17.31A3.29,3.29,0,0,0,14,9V20.57L16.21,18h6.87A3.29,3.29,0,0,0,26.36,14.75Z" style="opacity: 0.8;fill: url(#a0e84c7e-ecb0-41a8-b691-23385417b5e6-mobile)" />
                                            </g>
                                        </svg>
                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Blog
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/media">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="ed6aa9ef-5855-48a6-9fc2-57fca92d54d0-mobile" x1="-545.78" y1="-1170.14" x2="-559.11" y2="-1170.14" gradientTransform="translate(560.44 1186.31)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="b09c9e6e-90b5-4bac-85f9-e3e62b05c63c-mobile" x1="-540.12" y1="-1175.8" x2="-553.45" y2="-1175.8" gradientTransform="translate(562.79 1191.97)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#008060" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="b02fb04a-8ee9-452f-ade7-74b091d7a0d4-mobile" x1="-534.46" y1="-1181.46" x2="-547.79" y2="-1181.46" gradientTransform="translate(565.13 1197.63)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0.01" stop-color="#78ff80" />
                                                    <stop offset="1" stop-color="#f0e566" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <rect x="1.33" y="9.5" width="13.33" height="13.33" rx="3.55" transform="translate(13.77 -0.92) rotate(45)" style="opacity: 0.8;fill: url(#ed6aa9ef-5855-48a6-9fc2-57fca92d54d0-mobile)" />
                                                <rect x="9.34" y="9.5" width="13.33" height="13.33" rx="3.55" transform="translate(16.12 -6.58) rotate(45)" style="opacity: 0.8;fill: url(#b09c9e6e-90b5-4bac-85f9-e3e62b05c63c-mobile)" />
                                                <rect x="17.34" y="9.5" width="13.33" height="13.33" rx="3.55" transform="translate(18.46 -12.24) rotate(45)" style="opacity: 0.8;fill: url(#b02fb04a-8ee9-452f-ade7-74b091d7a0d4-mobile)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">News
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>


                        </ul>
                    </section>

                    <section class="page-nav-menu__card-section">
                        <h6 class="page-nav-menu__card-section-title">User Area</h6>
                        <ul class="page-nav-menu__card-list">

                            <li class="page-nav-menu__card-list-menuitem-container">
                                <a class="page-nav-menu__card-list-menuitem" tabindex="-1" href="https://www.imandra.ai/login">
                                    <span class="page-nav-menu__card-list-icon-container" data-element="icon">

                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 32 32" class="page-nav-menu__card-list-icon">
                                            <defs>
                                                <linearGradient id="f97be761-3f38-41a9-9585-3682b83c1b9a" x1="-148.02" y1="-126.65" x2="-132.4" y2="-142.28" gradientTransform="translate(-118.26 156.49) rotate(90)" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#08f" />
                                                    <stop offset="1" stop-color="#00f0b4" />
                                                </linearGradient>
                                                <linearGradient id="ba5b2209-b755-4e27-9dc2-c805f5efa6e1" x1="4.11" y1="19.41" x2="15.84" y2="9.71" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#7656f0" />
                                                    <stop offset="1" stop-color="#08f" />
                                                </linearGradient>
                                                <linearGradient id="bb651fa6-1404-476c-8b05-9e833086a9b4" x1="11.19" y1="17.8" x2="17.07" y2="12.93" gradientUnits="userSpaceOnUse">
                                                    <stop offset="0" stop-color="#f0567e" />
                                                    <stop offset="1" stop-color="#9c56aa" />
                                                </linearGradient>
                                            </defs>
                                            <g>
                                                <path d="M26.71,20.47V11.56a3,3,0,0,0-1.52-2.64L17.47,4.46a3,3,0,0,0-3,0L6.7,8.92a3,3,0,0,0-1.53,2.64v8.91A3,3,0,0,0,6.7,23.11l7.72,4.46a3,3,0,0,0,3,0l7.72-4.46A3,3,0,0,0,26.71,20.47Z" style="opacity: 0.8;fill: url(#f97be761-3f38-41a9-9585-3682b83c1b9a)" />
                                                <path d="M26.71,20.47V11.56a3,3,0,0,0-1.52-2.64L17.47,4.46a3,3,0,0,0-3,0L6.7,8.92a3,3,0,0,0-1.53,2.64v8.91A3,3,0,0,0,6.7,23.11l7.72,4.46a3,3,0,0,0,3,0l7.72-4.46A3,3,0,0,0,26.71,20.47Z" style="opacity: 0.8;fill: url(#f97be761-3f38-41a9-9585-3682b83c1b9a)" />
                                                <path d="M16.54,17.5l-8.8,5.08A1.71,1.71,0,0,1,5.17,21.1V10.93A1.71,1.71,0,0,1,7.74,9.45l8.8,5.08A1.71,1.71,0,0,1,16.54,17.5Z" style="opacity: 0.8;fill: url(#ba5b2209-b755-4e27-9dc2-c805f5efa6e1)" />
                                                <path d="M16.67,17.5l-2.91,1.68a1.71,1.71,0,0,1-2.57-1.48V14.33a1.71,1.71,0,0,1,2.57-1.48l2.91,1.68A1.71,1.71,0,0,1,16.67,17.5Z" style="opacity: 0.8;fill: url(#bb651fa6-1404-476c-8b05-9e833086a9b4)" />
                                            </g>
                                        </svg>

                                    </span>
                                    <span class="page-nav-menu__card-list-title" data-element="title">Login
                                        <span class="page-nav-menu__card-list-menuitem-arrow" data-element="arrow">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 8 8" style="enable-background:new 0 0 8 8;" xml:space="preserve">
                                                <g>
                                                    <polygon class="page-nav-menu__card-list-menuitem-arrow-path" points="2.7,0 1.3,1.4 4,4 1.3,6.6 2.7,8 6.7,4" />
                                                </g>
                                            </svg>
                                        </span>
                                    </span>
                                </a>
                            </li>


                        </ul>
                    </section>



                </li>
            </ul>

        </nav>

    </div>



<script>
    document.getElementById('toggler--left').addEventListener('click', function () {
        document.querySelector('.side__right-menu-toggler .side__toggle').classList.remove(
            'side__toggle--active');
        document.querySelector('.side__left-menu-toggler .side__toggle').classList.toggle(
            'side__toggle--active');
        document.getElementsByClassName('side__nav-container')[0].classList.toggle(
            'side__nav-container--hidden');
    });

    document.getElementById('toggler--right').addEventListener('click', function () {
        document.querySelector('.side__left-menu-toggler .side__toggle').classList.remove(
            'side__toggle--active');
        document.querySelector('.side__right-menu-toggler .side__toggle').classList.toggle(
            'side__toggle--active');
    });

    const siteMenuContainer = document.querySelector(".page-nav-menu-container");
    const siteMenuTopNavContainer = document.querySelector(".page-header-nav");
    const siteMenuNavArrow = document.querySelector(".page-nav-menu__arrow");
    const siteMenuNav = document.querySelector(".page-nav-menu");
    const siteMenuButtons = document.querySelectorAll(".page-header-nav__list-item-link");
    const siteMenuCards = siteMenuContainer.querySelectorAll(".page-nav-menu-container .page-nav-menu__card");

    let nowOpenCardIndex;
    let lastOpenedCardIndex;
    let lastOpenedCard;
    let menuArrowOffsetX;
    let cardCloseSwitch = false;

   const siteMenuSettings = [
      {
        type:"products",
        pageNavMenuOffset: 0,
        pageNavMenuWidth: 672,
        pageNavMenuHeight: 390,
        cardOffset: 0,
      },
      {
        type:"use",
        pageNavMenuOffset: 0,
        pageNavMenuWidth: 672,
        pageNavMenuHeight: 264,
        cardOffset: 0,
      },
      {
        type:"docs",
        pageNavMenuOffset: 0,
        pageNavMenuWidth: 672,
        pageNavMenuHeight: 230,
        cardOffset: 0,
      },
      {
        type:"company",
        pageNavMenuOffset: 0,
        pageNavMenuWidth: 672,
        pageNavMenuHeight: 216,
        cardOffset: 0,
      },
    ];

    //mobile menu
    const siteMobileMenuContainer = document.querySelector(".page-nav-mobile-menu-container");
    const siteMobileNavSwitchButton = document.querySelector("#toggler--right");
    const siteMobileNavCloseButton = document.querySelector(".type--nav-close");

    //nav menu functions
    const siteMenuCardSetup = (event) => {
      nowOpenCardIndex = event.target.dataset.index;
      menuArrowOffsetX = ((event.target.offsetLeft) + (event.target.clientWidth / 2) - 8 -300);

      window.requestAnimationFrame( function () {
        siteMenuContainer.style.setProperty('--menuArrowOffset', menuArrowOffsetX + "px");
        siteMenuContainer.style.setProperty('--menuNavWidth', siteMenuSettings[nowOpenCardIndex].pageNavMenuWidth + "px");
        siteMenuContainer.style.setProperty('--menuNavHeight', siteMenuSettings[nowOpenCardIndex].pageNavMenuHeight + "px");
      });
    }

    const siteMenuCardsSwitch = (event, command) => {
      if (siteMenuContainer.hidden === true) {
        event.target.focus();
        siteMenuContainer.hidden = false;
        siteMenuNavArrow.hidden = false;
        siteMenuNav.hidden = false;
        siteMenuCards[nowOpenCardIndex].hidden = false;
        setTimeout(() => {
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOpacity', "1");
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOffsetY', "0.5rem");
        }, 40);

        event.target.setAttribute("aria-expanded", true);
        lastOpenedCardIndex = nowOpenCardIndex;
        lastOpenedCard = event.target;

      } else if ( event.target.dataset.index === lastOpenedCardIndex ) {
        //case: hovering on the "popped up" button
          // console.log("already opened");
        if ( command == "close") {
          siteMenuCards[nowOpenCardIndex].hidden = true;
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOpacity', "0");
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOffsetY', "-1rem");
          siteMenuNav.hidden = true;
          siteMenuNavArrow.hidden = true;
          siteMenuContainer.hidden = true;
          lastOpenedCardIndex = -1;
          event.target.setAttribute("aria-expanded", false);
          lastOpenedCard = null;
        };

      } else {
        //close old
        siteMenuCards[lastOpenedCardIndex].hidden = true;
        siteMenuCards[lastOpenedCardIndex].style.setProperty('--menuCardOpacity', "0");
        siteMenuCards[lastOpenedCardIndex].style.setProperty('--menuCardOffsetY', "-1rem");
        lastOpenedCard.setAttribute("aria-expanded", false);
        //open new
        siteMenuCards[nowOpenCardIndex].hidden = false;
        event.target.focus();
        event.target.setAttribute("aria-expanded", true);
        setTimeout(() => {
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOpacity', "1");
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOffsetY', "0.5rem");
        }, 40);
        lastOpenedCardIndex = event.target.dataset.index;
        lastOpenedCard = event.target;
      }
    };

  const siteMenuCardClose = () => {
    if  ((cardCloseSwitch == true) && (lastOpenedCard != null) ) {
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOpacity', "0");
          siteMenuCards[nowOpenCardIndex].style.setProperty('--menuCardOffsetY', "-1rem");
          siteMenuCards[nowOpenCardIndex].hidden = true;
          siteMenuNav.hidden = true;
          siteMenuNavArrow.hidden = true;
          siteMenuContainer.hidden = true;
          lastOpenedCard.setAttribute("aria-expanded", false);
          lastOpenedCardIndex = -1;
          document.activeElement.blur();
          lastOpenedCard = null;

          siteMenuContainer.style.removeProperty('--menuArrowOffset');
          siteMenuContainer.style.removeProperty('--menuNavWidth');
          siteMenuContainer.style.removeProperty('--menuNavHeight');
          siteMenuContainer.style.removeProperty('--menuNavOffset');
          siteMenuContainer.style.removeProperty('--menuCardOffset');

    } else {
    //   console.log("not ready to close");
      return
    }
  };

  siteMenuButtons.forEach((item) => {
    item.addEventListener("click", (event) => {
      siteMenuCardSetup(event);
      siteMenuCardsSwitch(event, "close");
    });

      item.addEventListener("mouseenter", (event) => {
        cardCloseSwitch = false;
        siteMenuCardSetup(event);
        siteMenuCardsSwitch(event);
      });

      item.addEventListener("touchstart", (event) => {
        event.stopImmediatePropagation();
        event.preventDefault();
        siteMenuCardSetup(event);
        siteMenuCardsSwitch(event, "close");

        // siteMenuContainer.addEventListener("touchstart", (event)=> {
        //   console.log("outclick");
        //   cardCloseSwitch = true;
        //   siteMenuCardClose();
        //   event.stopPropagation();
        //   event.preventDefault();
        // },
        // {once:true, passive: false },
        // );

      },{passive: false});
    });

    siteMenuNav.addEventListener("mouseenter", (event) => {
      cardCloseSwitch = false;
    });

   siteMenuNav.addEventListener("mouseleave", (event) => {
      cardCloseSwitch = true;
      setTimeout( () => {
        siteMenuCardClose();
      }, 50);
    });

    siteMenuTopNavContainer.addEventListener("mouseleave", (event) => {
      cardCloseSwitch = true;
      setTimeout( () => {
        siteMenuCardClose();
      }, 50);
      });

  siteMobileNavSwitchButton.addEventListener("mousedown", (event) => {
      if (siteMobileMenuContainer.hidden === true) {
        siteMobileMenuContainer.hidden = false;
        event.target.setAttribute("aria-expanded", true);
      }
  });

  siteMobileNavCloseButton.addEventListener("mousedown", (event) => {
    if (siteMobileMenuContainer.hidden === false) {
      siteMobileMenuContainer.hidden = true;
      siteMobileNavSwitchButton.setAttribute("aria-expanded", false);
    }
  });

</script>

</header>