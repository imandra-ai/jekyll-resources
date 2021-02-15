# jekyll_sh_copy

module Jekyll
	class ShCopyBlock < Liquid::Block

		@@buttonCounter = 0

		def render(context)
			@baseurl = Jekyll.configuration({})['baseurl']
			@text = super.strip
			@bc = @@buttonCounter
			@@buttonCounter = @bc + 1
			"<div class=\"terminal\">
			<div class=\"terminal__copy-ready\">
			  <div class=\"terminal__copy-ready--top\"><span class=\"terminal__copy-msg\">Ready!</span></div>
			  <div class=\"terminal__copy-ready--bottom\"></div>
			</div>
			<code>
			<div class=\"highlight\"><pre><span class=\"o\">#{@text}</span></pre></div>
			</code>
			<div id=\"copy-button-id#{@bc}\" class=\"terminal__copy-cover\">
			  <img src=\"#{@baseurl}/jekyll-resources/assets/img/copy.svg\">
			</div>
		  	</div><script>document.getElementById('copy-button-id#{@bc}').addEventListener('click', handleCopyClick);</script>
		  	"
		end
	end
end

Liquid::Template.register_tag('shcopy', Jekyll::ShCopyBlock)