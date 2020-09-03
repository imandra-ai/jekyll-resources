{% for item in nav_items %}
  {% if loop.index != 1 %}
  <a class="side__nav-link--within-page side__nav-link--within-page--{{ item['tag'] }}" href="#{{ item['id'] }}">{{ item['text']}}</a>
  <ul class="side__nav-list--sub-level-3 {% if slug == section.notebookSlug or slug in section.get('children', [])|map(attribute='notebookSlug') %} side__nav-list--sub-level-2--active{% endif %}">
  {% for child in section.children | difficulty|lower == text|lower) %}
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
  {% endif %}
{% endfor %}