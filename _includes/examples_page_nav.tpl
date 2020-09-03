{% if slug == section.notebookSlug or slug in section.get('children', [])|map(attribute='notebookSlug') %}
{% for item in [{'text':'Beginner','id':'Beginner','tag':'h2'},{'text':'Intermediate','id':'Intermediate','tag':'h2'},{'text':'Advanced','id':'Advanced','tag':'h2'}] %}
  <a class="side__nav-link--within-page side__nav-link--within-page--{{ item['tag'] }}" href="{{site.baseurl}}/notebooks/examples/#{{ item['id'] }}">{{ item['text']}}</a>
  <ul class="side__nav-list--sub-level-3 {% if slug == section.notebookSlug or slug in section.get('children', [])|map(attribute='notebookSlug') %} side__nav-list--sub-level-2--active{% endif %}">
  {% for child in section.children %}
  {% if child.difficulty and child.difficulty|lower == item['id']|lower %}
  <li class="side__nav-list-item--sub-level-2{% if child.children | length == 0 %} side__nav-list--sub-level-2--empty{% endif %}">
      {% if child.notebookSlug %}
      <a class="side__nav-link{% if child.notebookSlug == slug %} side__nav-link--active{% endif %}" href="/{{ repo_dir }}/notebooks/{{ child.notebookSlug }}">{{ child.name }}</a>
      {% else %}
      <a class="side__nav-link" href="/{{ repo_dir }}/{{ child.slug }}">{{ child.name }}</a>
      {% endif %}
      {% if child.notebookSlug == slug %}
      <ul class="side__nav-list--sub-level-3">
          <div class="side__within-page-nav--sub-level-3">
          {% if nav_items and nav_items|length > 2 -%}
          {% if false %}
          {% for item in nav_items %}
          {% if loop.index != 1 %}
          <a class="side__nav-link--within-page side__nav-link--within-page--{{ item['tag'] }}" href="#{{ item['id'] }}">{{ item['text']}}</a>
          {% endif %}
          {% endfor %}
          {% endif %}
          {% endif %}
          </div>
      </ul>
      {% endif %}
  </li>
  {% endif %}
  {% endfor %}
{% endfor %}
{% endif %}
