require 'net/http'
require 'uri'

module Jekyll
  class IncludeTagError < StandardError
    attr_accessor :url

    def initialize(msg, url)
      super(msg)
      @url = url
    end
  end

  class IncludeAbsoluteTag < Liquid::Tag
    VARIABLE_SYNTAX = %r!
        (?<variable>[^{]*(\{\{\s*[\w\-\.]+\s*(\|.*)?\}\}[^\s{}]*)+)
        (?<params>.*)
      !x

    def initialize(tag_name, markup, tokens)
      super

      @url = markup.strip
    end

    def openurl(url)
      Net::HTTP.get(URI.parse(url))
    end

    # Render the variable if required (@see https://goo.gl/N5sMV3)
    def render_variable(context)
      if @url.match(VARIABLE_SYNTAX)
        partial = context.registers[:site]
          .liquid_renderer
          .file("(variable)")
          .parse(@url)
        partial.render!(context)
      end
    end

    def render(context)

      url  = render_variable(context) || @url
      
      begin
        return openurl(url)
      rescue => e
        raise IncludeTagError.new e.message, url
      end
    end

  end
end

Liquid::Template.register_tag('include_ipl', Jekyll::IncludeAbsoluteTag)