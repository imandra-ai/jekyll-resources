<!-- Jupyter (Imandra core docs) version -->
<header>
  <div class="TopRowContainer">
  	<div class="TopRow">
  		<div id="toggler--left" class="side__left-menu-toggler"><a href="#" class="side__toggle">≡ <span class="side__toggle-text">Docs</span></a></div>
  		<div class="side__logo-container">
  			<a class="side__logo-link" href="/">
  				<img class="side__logo " src = "/{{ repo_dir }}/jekyll-resources/assets/img/ai_logo_green.svg">
  			</a>
  		</div>
  		<div id="toggler--right" class="side__right-menu-toggler"><a href="#" class="side__toggle"><span class="side__toggle-text">Pages</span> ≡</a></div>
  
  		<nav class="side__nav-container side__nav-container--hidden">
  			
  			<ul class="side__nav-list">
          {% for site in data.sites %}
  				<li class="side__nav-list-item TopNavListItem">
  				  <a class="side__nav-link" href="{{ site.basurl }}">{{ site.name }}</a>
            {% if site.name == 'Imandra' %}
            <ul class="side__nav-list--sub-level-1">
  				    <li class="side__nav-list-item--sub-level-1">
                <a class="side__nav-link side__nav-link--active" href="/{{ repo_dir }}">Active link</a>
              </li>
  				    <li class="side__nav-list-item--sub-level-1">
                <a class="side__nav-link" href="/{{ repo_dir }}">Inactive link</a>
              </li>
  				    <li class="side__nav-list-item--sub-level-1">
                <a class="side__nav-link" href="/{{ repo_dir }}">lulwut</a>
              </li>
  				  </ul>
            {% endif %}
          </li>
          {% endfor %}
  			</ul>
  		</nav>
  	</div>
  </div>
  
  <div class="TemplateHeader">
  	<div class="top-bar">
  		<nav class="top-bar__nav-container">
  				<a href="#" class="top-bar__toggle">≡</a>
  				<ul class="top-bar__nav-list top-bar__nav-list--hidden">
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://imandra.ai/">Home</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://imandra.ai/">Imandra</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://try.imandra.ai/">Try</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://medium.com/">Blog</a></li>		
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://imandra.ai/">Research</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://docs.imandra.ai/">Docs</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://imandra.ai/media">Media</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://imandra.ai/#about-ai">About AI</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://imandra.ai/careers">CAREERS</a></li>
  				  <li class="top-bar__nav-list-item"><a class="top-bar__nav-link" href="https://imandra.ai/#contact">CONTACT</a></li>
  				</ul>
  			  </nav>
  	</div>
    <div class="TemplateHeaderImageContainer">
    	<a class="template-header__image" href ="/{{ repo_dir }}">
    		<img class="SiteSpecificImage" src="/{{ repo_dir }}/static/img/site_specific_image_v_2.svg">
    	</a>
    </div>
  </div>
  <script>
  document.getElementById('toggler--left').addEventListener('click', function () {
    document.getElementsByClassName('side__nav-container')[0].classList.toggle('side__nav-container--hidden');
    document.getElementsByClassName('top-bar__nav-list')[0].classList.add('top-bar__nav-list--hidden');
  });
  document.getElementById('toggler--right').addEventListener('click', function () {
    document.getElementsByClassName('side__nav-container')[0].classList.add('side__nav-container--hidden');
    document.getElementsByClassName('top-bar__nav-list')[0].classList.toggle('top-bar__nav-list--hidden');
  });
  </script>
</header>