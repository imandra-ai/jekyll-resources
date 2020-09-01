{% if nav_items and nav_items|length > 1 -%}
  {% for item in nav_items %}
  {% if loop.index != 1 %}
  <a class="side__nav-link--within-page side__nav-link--within-page--{{ item['tag'] }}" href="#{{ item['id'] }}">{{ item['text']}}:len={{nav_items|length}}:size={{nav_items|size}}</a>
  {% endif %}
  {% endfor %}
{%- endif -%}